<?php
header('Content-Type: application/json');

// Conectar a la base de datos
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "productos_vs";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Obtener los datos enviados
$data = json_decode(file_get_contents('php://input'), true);

// Verificar si se envió el ID del producto
if (isset($data['id'])) {
    $product_id = $data['id'];

    // Consultar la base de datos
    $sql = "SELECT nombre, precio FROM productos WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $product_id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $producto = $result->fetch_assoc();
        echo json_encode(['success' => true, 'producto' => $producto]);
    } else {
        echo json_encode(['success' => false]);
    }
} else {
    // Si no se envió el ID del producto, devuelve un mensaje de error
    echo json_encode(['success' => false, 'message' => 'ID del producto no proporcionado']);
}

$stmt->close();
$conn->close();
?>
