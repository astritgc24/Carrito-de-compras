<?php
include("conexion/conectar-mysql.php");

// Verificar si se ha enviado el ID del producto a eliminar
if (isset($_GET['id'])) {
    $id = $_GET['id'];

    // Eliminar el producto de la base de datos
    $query = "DELETE FROM Producto WHERE id = $id";

    if (mysqli_query($conexion, $query)) {
        echo "<div class='alert alert-success' role='alert'>Producto eliminado correctamente</div>";
    } else {
        echo "<div class='alert alert-danger' role='alert'>Error al eliminar el producto: " . mysqli_error($conexion) . "</div>";
    }
}

// Redireccionar de vuelta al index.php
header("Location: index.php");
exit();
?>
