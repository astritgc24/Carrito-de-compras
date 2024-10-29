<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrar Producto</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container {
            margin-top: 50px;
        }
        .btn-regresar {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Registrar Nuevo Producto</h2>
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="POST">
            <div class="form-group">
                <label for="nombre">Nombre del Producto</label>
                <input type="text" class="form-control" id="nombre" name="nombre" required>
            </div>
            <div class="form-group">
                <label for="descripcion">Descripción</label>
                <textarea class="form-control" id="descripcion" name="descripcion" rows="3" required></textarea>
            </div>
            <div class="form-group">
                <label for="precio">Precio</label>
                <input type="number" step="0.01" class="form-control" id="precio" name="precio" required>
            </div>
            <div class="form-group">
                <label for="id_marca">Marca</label>
                <select class="form-control" id="id_marca" name="id_marca" required>
                    <?php
                    include("conexion/conectar-mysql.php");
                    $query = "SELECT * FROM Marca";
                    $result = mysqli_query($conexion, $query);
                    while ($row = mysqli_fetch_assoc($result)) {
                        echo "<option value='" . $row['id'] . "'>" . $row['nombre'] . "</option>";
                    }
                    ?>
                </select>
            </div>
            <div class="form-group">
                <label for="id_categoria">Categoría</label>
                <select class="form-control" id="id_categoria" name="id_categoria" required>
                    <?php
                    $query = "SELECT * FROM Categoria";
                    $result = mysqli_query($conexion, $query);
                    while ($row = mysqli_fetch_assoc($result)) {
                        echo "<option value='" . $row['id'] . "'>" . $row['nombre'] . "</option>";
                    }
                    ?>
                </select>
            </div>
            <div class="form-group">
                <label for="id_presentacion">Presentación</label>
                <select class="form-control" id="id_presentacion" name="id_presentacion" required>
                    <?php
                    $query = "SELECT * FROM Presentacion";
                    $result = mysqli_query($conexion, $query);
                    while ($row = mysqli_fetch_assoc($result)) {
                        echo "<option value='" . $row['id'] . "'>" . $row['nombre'] . "</option>";
                    }
                    ?>
                </select>
            </div>
            <div class="form-group">
                <label for="stock_minimo">Stock Mínimo</label>
                <input type="number" class="form-control" id="stock_minimo" name="stock_minimo" required>
            </div>
            <div class="form-group">
                <label for="stock_maximo">Stock Máximo</label>
                <input type="number" class="form-control" id="stock_maximo" name="stock_maximo" required>
            </div>
            <button type="submit" class="btn btn-primary" name="submit">Registrar Producto</button>
        </form>
        <!-- Botón de regresar -->
        <a href="index.php" class="btn btn-secondary btn-regresar">Regresar</a>
    </div>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

<?php
if (isset($_POST['submit'])) {
    // Obtener los datos del formulario
    $nombre = $_POST['nombre'];
    $descripcion = $_POST['descripcion'];
    $precio = $_POST['precio'];
    $id_marca = $_POST['id_marca'];
    $id_categoria = $_POST['id_categoria'];
    $id_presentacion = $_POST['id_presentacion'];
    $stock_minimo = $_POST['stock_minimo'];
    $stock_maximo = $_POST['stock_maximo'];
    $cantidad = $_POST['cantidad'];

    // Conectar con la base de datos
    include("conexion/conectar-mysql.php");

    // Preparar la consulta para insertar el producto en la base de datos
    $query = "INSERT INTO Producto (nombre, descripcion, precio, id_marca, id_categoria, id_presentacion, stock_minimo, stock_maximo, cantidad) 
              VALUES ('$nombre', '$descripcion', '$precio', '$id_marca', '$id_categoria', '$id_presentacion', '$stock_minimo', '$stock_maximo', '$cantidad')";
    
    // Ejecutar la consulta
    $result = mysqli_query($conexion, $query);

    // Verificar si la consulta fue exitosa
    if ($result) {
        echo "Producto registrado correctamente.";
    } else {
        echo "Error al registrar el producto: " . mysqli_error($conexion);
    }
}
?>
