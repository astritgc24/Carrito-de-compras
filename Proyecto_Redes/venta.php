<?php
// Mostrar errores de PHP
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Iniciar sesión
session_start();

// Verificar si hay productos en el carrito
if (!empty($_SESSION['CARRITO'])) {
    $productos_carrito = $_SESSION['CARRITO'];
} else {
    // Si no hay productos en el carrito, redirigir a la página del carrito
    header("Location: mostrarCarrito.php");
    exit;
}

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

// Calcular el total a pagar
$total_pagar = 0;
foreach ($productos_carrito as $producto) {
    $total_pagar += $producto['PRECIO'] * $producto['CANTIDAD'];
}

// Verificar si se ha enviado el formulario de datos del cliente
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Recuperar los datos del formulario
    $nombre_cliente = isset($_POST["nombre_cliente"]) ? $_POST["nombre_cliente"] : "";
    $ap1_cliente = isset($_POST["ap1_cliente"]) ? $_POST["ap1_cliente"] : "";
    $ap2_cliente = isset($_POST["ap2_cliente"]) ? $_POST["ap2_cliente"] : "";
    $direccion = isset($_POST["direccion"]) ? $_POST["direccion"] : "";
    $codigo_postal = isset($_POST["codigo_postal"]) ? $_POST["codigo_postal"] : "";
    $metodo_pago = isset($_POST["metodo_pago"]) ? $_POST["metodo_pago"] : "";

    // Insertar en la tabla ventas
    $stmt_ventas = $conexion->prepare("INSERT INTO ventas (nombre_cliente, ap1_cliente, ap2_cliente, direccion, codigo_postal, metodo_pago, total) VALUES (?, ?, ?, ?, ?, ?, ?)");
    if ($stmt_ventas === false) {
        die("Error en la preparación de la consulta de ventas: " . $conexion->error);
    }
    $stmt_ventas->bind_param('ssssssd', $nombre_cliente, $ap1_cliente, $ap2_cliente, $direccion, $codigo_postal, $metodo_pago, $total_pagar);
    if (!$stmt_ventas->execute()) {
        die("Error en la inserción en ventas: " . $stmt_ventas->error);
    }
    // Obtener el ID de la venta insertada
    $id_venta = $stmt_ventas->insert_id;
    $stmt_ventas->close();

    // Preparar la inserción en detalleventa
    $stmt_detalle = $conexion->prepare("INSERT INTO detalleventa (id_venta, id_producto, cantidad, precio_unitario, total) VALUES (?, ?, ?, ?, ?)");
    if ($stmt_detalle === false) {
        die("Error en la preparación de la consulta de detalleventa: " . $conexion->error);
    }

    foreach ($productos_carrito as $producto) {
        $id_producto = $producto['ID'];
        $cantidad = $producto['CANTIDAD'];
        $precio_unitario = $producto['PRECIO'];
        $total = $precio_unitario * $cantidad;

        // Ligar parámetros
        $stmt_detalle->bind_param('iiidd', $id_venta, $id_producto, $cantidad, $precio_unitario, $total);

        // Ejecutar la consulta
        if ($stmt_detalle->execute()) {
            echo "Registro exitoso para el producto: {$producto['NOMBRE']}<br>";
        } else {
            echo "Error en la inserción del producto: {$producto['NOMBRE']} - " . $stmt_detalle->error . "<br>";
        }
    }

    // Cerrar la declaración
    $stmt_detalle->close();

    // Limpiar el carrito
    unset($_SESSION['CARRITO']);

    // Redirigir a una página de confirmación o mostrar un mensaje de éxito
    header("Location: confirmar.html");
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirmación de Compra</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #ffe6f0;
        }
        .container {
            background-color: #fff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        h3, h4 {
            color: #ff99cc;
        }
        .table {
            background-color: #ffe6f0;
        }
        .table th {
            background-color: #ffccdd;
            color: #ffffff;
        }
        .table td {
            background-color: #ffffff;
        }
        .btn-primary {
            background-color: #ff66b2;
            border-color: #ff66b2;
        }
        .btn-primary:hover {
            background-color: #ff4da6;
            border-color: #ff4da6;
        }
        .btn-danger {
            background-color: #ff6699;
            border-color: #ff6699;
        }
        .btn-danger:hover {
            background-color: #ff4d80;
            border-color: #ff4d80;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h3>Confirmación de Compra</h3>
        <h4>Productos en el Carrito:</h4>
        <table class="table table-light table-bordered">
            <tbody>
                <tr>
                    <th width="15%">Nombre</th>
                    <th width="20%">Descripción</th>
                    <th width="15%" class="text-center">Precio</th>
                    <th width="20%" class="text-center">Cantidad</th>
                    <th width="15%" class="text-center">Total</th>
                </tr>
                <?php foreach ($productos_carrito as $producto) { ?>
                <tr>
                    <td><?php echo $producto['NOMBRE']; ?></td>
                    <td><?php echo $producto['DESCRIPCION']; ?></td>
                    <td class="text-center">$<?php echo $producto['PRECIO']; ?></td>
                    <td class="text-center"><?php echo $producto['CANTIDAD']; ?></td>
                    <td class="text-center">$<?php echo number_format($producto['PRECIO'] * $producto['CANTIDAD'], 2); ?></td>
                </tr>
                <?php } ?>
                <tr>
                    <td colspan="4" class="text-end"><h4>Total a Pagar:</h4></td>
                    <td class="text-center"><h4>$<?php echo number_format($total_pagar, 2); ?></h4></td>
                </tr>
            </tbody>
        </table>

        <h4>Datos del Cliente:</h4>
        <form method="post" action="<?php echo $_SERVER["PHP_SELF"]; ?>">
            <div class="mb-3">
                <label for="nombre_cliente" class="form-label">Nombre:</label>
                <input type="text" class="form-control" id="nombre_cliente" name="nombre_cliente" required>
            </div>
            <div class="mb-3">
                <label for="ap1_cliente" class="form-label">Apellido Paterno:</label>
                <input type="text" class="form-control" id="ap1_cliente" name="ap1_cliente" required>
            </div>
            <div class="mb-3">
                <label for="ap2_cliente" class="form-label">Apellido Materno:</label>
                <input type="text" class="form-control" id="ap2_cliente" name="ap2_cliente">
            </div>
            <div class="mb-3">
                <label for="direccion" class="form-label">Dirección:</label>
                <input type="text" class="form-control" id="direccion" name="direccion" required>
            </div>
            <div class="mb-3">
                <label for="codigo_postal" class="form-label">Código Postal:</label>
                <input type="text" class="form-control" id="codigo_postal" name="codigo_postal" required>
            </div>
            <div class="mb-3">
                <label for="metodo_pago" class="form-label">Método de Pago:</label>
                <select class="form-control" id="metodo_pago" name="metodo_pago" required>
                    <option value="efectivo">Efectivo</option>
                    <option value="tarjeta">Tarjeta</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Confirmar Compra</button>
            <a href="mostrarCarrito.php" class="btn btn-danger">Regresar</a>
        </form>
    </div>
</body>
</html>
