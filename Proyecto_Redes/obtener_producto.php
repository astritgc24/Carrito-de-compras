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
$data_id = $_POST['id']; // Cambiando 'data_id' a 'id'

// Consultar la base de datos
$sql = "SELECT nombre, precio FROM productos WHERE id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $data_id);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $producto = $result->fetch_assoc();
    echo json_encode(['success' => true, 'producto' => $producto]);
} else {
    echo json_encode(['success' => false]);
}

$stmt->close();
$conn->close();
?>

