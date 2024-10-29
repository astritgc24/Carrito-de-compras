<?php
include("conexion/conectar-mysql.php");

// Función para obtener la cantidad total de ejemplares registrados para un producto
function obtenerCantidadTotalEjemplares($id_producto, $conexion) {
    $query = "SELECT COUNT(*) AS total FROM Ejemplar WHERE id_producto = ?";
    $stmt = mysqli_prepare($conexion, $query);
    mysqli_stmt_bind_param($stmt, 'i', $id_producto);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    $row = mysqli_fetch_assoc($result);
    mysqli_stmt_close($stmt);
    return intval($row['total']);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id_producto = intval($_POST['producto']);
    $cantidad = intval($_POST['cantidad']);

    // Obtener el stock mínimo y máximo del producto seleccionado
    $query_stock = "SELECT stock_minimo, stock_maximo FROM Producto WHERE id = ?";
    $stmt_stock = mysqli_prepare($conexion, $query_stock);
    mysqli_stmt_bind_param($stmt_stock, 'i', $id_producto);
    mysqli_stmt_execute($stmt_stock);
    $result_stock = mysqli_stmt_get_result($stmt_stock);
    $stock = mysqli_fetch_assoc($result_stock);
    $stock_minimo = intval($stock['stock_minimo']);
    $stock_maximo = intval($stock['stock_maximo']);
    mysqli_stmt_close($stmt_stock);

    // Obtener la cantidad total de ejemplares registrados para este producto
    $cantidad_total_registrada = obtenerCantidadTotalEjemplares($id_producto, $conexion);

    // Calcular la cantidad total después de sumar la nueva cantidad
    $nueva_cantidad_total = $cantidad_total_registrada + $cantidad;

    if ($cantidad > 0 && $nueva_cantidad_total >= $stock_minimo && $nueva_cantidad_total <= $stock_maximo) {
        // Preparar la declaración para insertar los ejemplares
        $insert_query = "INSERT INTO Ejemplar (id_producto) VALUES (?)";
        $stmt_insert = mysqli_prepare($conexion, $insert_query);
        
        // Iniciar una transacción para mejorar el rendimiento en inserciones masivas
        mysqli_begin_transaction($conexion);

        try {
            for ($i = 0; $i < $cantidad; $i++) {
                mysqli_stmt_bind_param($stmt_insert, 'i', $id_producto);
                mysqli_stmt_execute($stmt_insert);
            }
            mysqli_commit($conexion);
            echo "<script>alert('Se han registrado $cantidad ejemplares del producto.');</script>";
        } catch (Exception $e) {
            mysqli_rollback($conexion);
            echo "<script>alert('Error: " . mysqli_error($conexion) . "');</script>";
        } finally {
            mysqli_stmt_close($stmt_insert);
        }
    } else {
        echo "<script>alert('La cantidad debe ser mayor o igual que $stock_minimo y menor o igual que $stock_maximo.');</script>";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrar Ejemplares</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Registrar Ejemplares</h2>
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
            <div class="form-group">
                <label for="producto">Producto:</label>
                <select name="producto" id="producto" class="form-control" required>
                    <?php
                    $query_productos = "SELECT id, nombre, descripcion FROM Producto";
                    $result_productos = mysqli_query($conexion, $query_productos);
                    while ($producto = mysqli_fetch_assoc($result_productos)) {
                        echo "<option value='" . $producto['id'] . "'>" . $producto['nombre'] . " - " . $producto['descripcion'] . "</option>";
                    }
                    ?>
                </select>
            </div>
            <div class="form-group">
                <label for="cantidad">Cantidad de Ejemplares:</label>
                <input type="number" name="cantidad" id="cantidad" class="form-control" required>
                </div>
            <button type="submit" class="btn btn-primary">Registrar</button>
            <a href="index.php" class="btn btn-secondary">Volver a Inicio</a>
        </form>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
