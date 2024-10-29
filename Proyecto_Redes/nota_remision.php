<?php
// Datos de conexión a la base de datos
$servidor = "localhost";
$usuario = "root";
$password = "";
$baseDatos = "productos_vs";

// Conectar a la base de datos
$conexion = new mysqli($servidor, $usuario, $password, $baseDatos);

// Verificar la conexión
if ($conexion->connect_error) {
    die("Conexión fallida: " . $conexion->connect_error);
}

// Obtener datos de la última venta realizada
$query_venta = "SELECT * FROM ventas ORDER BY id_venta DESC LIMIT 1";
$resultado_venta = $conexion->query($query_venta);

if ($resultado_venta && $resultado_venta->num_rows > 0) {
    $venta = $resultado_venta->fetch_assoc();

    // Consulta para obtener los productos vendidos en esa venta
    $id_venta = $venta['id_venta'];
    $query_detalle = "SELECT dv.*, p.nombre AS nombre_producto FROM detalleventa dv
                      INNER JOIN productos p ON dv.id_producto = p.id_producto
                      WHERE dv.id_venta = $id_venta";
    $resultado_detalle = $conexion->query($query_detalle);
} else {
    die("No se encontraron datos de la venta.");
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nota de Venta</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            background-color: #ffffff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
        }
        h3 {
            color: #6c757d;
            border-bottom: 1px solid #dee2e6;
            padding-bottom: 10px;
        }
        .table {
            margin-top: 20px;
        }
        .table th {
            background-color: #007bff;
            color: #ffffff;
        }
        .table td {
            background-color: #f8f9fa;
        }
    </style>
</head>
<body>
    <div class="container">
        <h3>Nota de Venta</h3>

        <div class="row">
            <div class="col-md-6">
                <p><strong>Fecha de la Venta:</strong> <?php echo $venta['fecha_venta']; ?></p>
                <p><strong>Cliente:</strong> <?php echo $venta['nombre_cliente'] . ' ' . $venta['ap1_cliente'] . ' ' . $venta['ap2_cliente']; ?></p>
                <p><strong>Dirección:</strong> <?php echo $venta['direccion']; ?></p>
                <p><strong>Código Postal:</strong> <?php echo $venta['codigo_postal']; ?></p>
                <p><strong>Método de Pago:</strong> <?php echo ucfirst($venta['metodo_pago']); ?></p>
            </div>
            <div class="col-md-6">
                <p><strong>Número de Venta:</strong> <?php echo $venta['id_venta']; ?></p>
                <p><strong>Total Pagado:</strong> $<?php echo number_format($venta['total'], 2); ?></p>
            </div>
        </div>

        <h4>Detalle de la Venta:</h4>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Producto</th>
                    <th>Cantidad</th>
                    <th>Precio Unitario</th>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($detalle = $resultado_detalle->fetch_assoc()) { ?>
                    <tr>
                        <td><?php echo $detalle['nombre_producto']; ?></td>
                        <td><?php echo $detalle['cantidad']; ?></td>
                        <td>$<?php echo number_format($detalle['precio_unitario'], 2); ?></td>
                        <td>$<?php echo number_format($detalle['total'], 2); ?></td>
                    </tr>
                <?php } ?>
            </tbody>
        </table>

        <a href="mostrarCarrito.php" class="btn btn-secondary">Volver</a>
    </div>
</body>
</html>

<?php
// Cerrar conexión a la base de datos
$conexion->close();
?>
