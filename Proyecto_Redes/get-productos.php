<?php
include("conexion/conectar-mysql.php");

// Obtener el ID del producto enviado desde la solicitud POST
$id_producto = $_POST['id'];

// Sanitizar la entrada para evitar inyección SQL
$id_producto = mysqli_real_escape_string($conn, $id_producto);

// Consultar la base de datos para obtener detalles del producto
$sql = "SELECT nombre, precio FROM producto WHERE id = $id_producto";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Convertir el resultado a un array asociativo
    $row = $result->fetch_assoc();
    
    // Devolver los detalles del producto en formato JSON
    echo json_encode($row);
} else {
    // Devolver un código de error 404 Not Found si el producto no se encuentra
    http_response_code(404);
    echo "Producto no encontrado";
}

$conn->close();
?>
