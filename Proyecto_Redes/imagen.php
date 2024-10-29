<?php
include("conexion/conectar-mysql.php");

// Verificar si se ha proporcionado el parámetro id en la URL
if(isset($_GET['id'])) {
    $id_producto = $_GET['id'];

    // Verificar si la conexión está establecida antes de ejecutar consultas
    if ($conn) {
        // Preparar la consulta SQL con una sentencia preparada para evitar inyección de SQL
        $sql = "SELECT imagen_url FROM Producto WHERE id = ?";
        
        // Preparar la sentencia
        $stmt = $conn->prepare($sql);
        
        // Vincular parámetros
        $stmt->bind_param("i", $id_producto);
        
        // Ejecutar la consulta
        $stmt->execute();
        
        // Obtener el resultado
        $result = $stmt->get_result();

        // Verificar si hay filas en el resultado
        if ($result->num_rows > 0) {
            // Obtener la URL de la imagen
            $row = $result->fetch_assoc();
            $imagen_url = $row["imagen_url"];
        } else {
            echo "No se encontraron resultados para ese ID de producto.";
        }
        
        // Cerrar la sentencia preparada
        $stmt->close();
    } else {
        echo "Error al conectar a la base de datos.";
    }
} else {
    echo "No se proporcionó el parámetro id en la URL.";
}

// Cerrar la conexión
$conn->close();
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mostrar Imagen</title>
</head>
<body>
    <h2>Imagen del Producto</h2>
    <?php
    // Mostrar la imagen si está disponible
    if (!empty($imagen_url)) {
        echo "<img src='$imagen_url' alt='Imagen del Producto'>";
    } else {
        echo "Este producto no tiene una imagen asociada.";
    }
    ?>
</body>
</html>
