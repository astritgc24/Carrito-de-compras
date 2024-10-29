<?php
// Verificar si se envió el formulario
if (isset($_POST['submit'])) {
    // Recibir los datos del formulario
    $producto_id = $_POST['producto'];
    $clasificacion = $_POST['clasificacion'];
    $nombre_imagen = $_FILES['imagen']['name'];
    $nombre_temporal = $_FILES['imagen']['tmp_name'];
    
    // Directorio donde se guardarán las imágenes
    $directorio_imagenes = "imagenes/";

    // Mover la imagen al directorio de imágenes
    move_uploaded_file($nombre_temporal, $directorio_imagenes . $nombre_imagen);
    
    // Redireccionar a la página correspondiente según la clasificación del producto
    switch ($clasificacion) {
        case 'Lociones':
            header("Location: Lociones.php?imagen=$nombre_imagen&producto=$producto_id");
            break;
        case 'Brumas':
            header("Location: Brumas.php?imagen=$nombre_imagen&producto=$producto_id");
            break;
        case 'Bolsos':
            header("Location: Bolsos.php?imagen=$nombre_imagen&producto=$producto_id");
            break;
        case 'Accesorios':
            header("Location: Accesorios.php?imagen=$nombre_imagen&producto=$producto_id");
            break;
        case 'Labiales':
            header("Location: Labiales.php?imagen=$nombre_imagen&producto=$producto_id");
            break;
        default:
            // Clasificación no válida
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar Producto</title>
    <!-- Incluir Bootstrap desde el CDN -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h1>Agregar Producto</h1>
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="POST" enctype="multipart/form-data">
            <div class="form-group">
                <label for="producto">Producto:</label>
                <select class="form-control" id="producto" name="producto">
                    <?php
                    // Incluir archivo de conexión a la base de datos
                    include("conexion/conectar-mysql.php");

                    // Consultar productos disponibles en la base de datos
                    $query_productos = "SELECT id, nombre, descripcion FROM Producto";
                    $result_productos = mysqli_query($conexion, $query_productos);
                    while ($row = mysqli_fetch_assoc($result_productos)) {
                        echo "<option value='" . $row['id'] . "'>" . $row['nombre'] . " - " . $row['descripcion'] . "</option>";
                    }
                    ?>
                </select>
            </div>
            <div class="form-group">
                <label for="clasificacion">Clasificación:</label>
                <select class="form-control" id="clasificacion" name="clasificacion">
                    <option value="Lociones">Lociones</option>
                    <option value="Brumas">Brumas</option>
                    <option value="Bolsos">Bolsos</option>
                    <option value="Accesorios">Accesorios</option>
                    <option value="Labiales">Labiales</option>
                </select>
            </div>
            <div class="form-group">
                <label for="imagen">Imagen del Producto:</label>
                <input type="file" class="form-control-file" id="imagen" name="imagen" required>
            </div>
            <button type="submit" name="submit" class="btn btn-primary">Agregar Producto</button>
        </form>
    </div>

    <!-- Incluir Bootstrap JS y dependencias -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
