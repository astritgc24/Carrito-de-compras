<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Producto</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Editar Producto</h2>
        <?php
        include("conexion/conectar-mysql.php");

        // Verificar si se ha enviado el ID del producto
        if (isset($_GET['id'])) {
            $id = $_GET['id'];

            // Obtener los datos del producto con el ID proporcionado
            $query = "SELECT * FROM Producto WHERE id = $id";
            $result = mysqli_query($conexion, $query);

            if (mysqli_num_rows($result) == 1) {
                $row = mysqli_fetch_assoc($result);
                $nombre = $row['nombre'];
                $descripcion = $row['descripcion'];
                $precio = $row['precio'];
                $id_marca = $row['id_marca'];
                $id_categoria = $row['id_categoria'];
                $id_presentacion = $row['id_presentacion'];
                $stock_minimo = $row['stock_minimo'];
                $stock_maximo = $row['stock_maximo'];
                $cantidad = $row['cantidad'];
            }
        }

        // Procesar el formulario cuando se envíe
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            // Recuperar los datos del formulario
            $nombre = $_POST['nombre'];
            $descripcion = $_POST['descripcion'];
            $precio = $_POST['precio'];
            $id_marca = $_POST['id_marca'];
            $id_categoria = $_POST['id_categoria'];
            $id_presentacion = $_POST['id_presentacion'];
            $stock_minimo = $_POST['stock_minimo'];
            $stock_maximo = $_POST['stock_maximo'];
            $cantidad = $_POST['cantidad'];

            // Actualizar los datos del producto en la base de datos
            $query = "UPDATE Producto SET nombre = '$nombre', descripcion = '$descripcion', precio = $precio, id_marca = $id_marca, id_categoria = $id_categoria, id_presentacion = $id_presentacion, stock_minimo = $stock_minimo, stock_maximo = $stock_maximo, cantidad = $cantidad WHERE id = $id";

            if (mysqli_query($conexion, $query)) {
                echo "<div class='alert alert-success' role='alert'>Producto actualizado correctamente</div>";
            } else {
                echo "<div class='alert alert-danger' role='alert'>Error al actualizar el producto: " . mysqli_error($conexion) . "</div>";
            }
        }
        ?>
        <form method="POST">
            <div class="form-group">
                <label for="nombre">Nombre:</label>
                <input type="text" class="form-control" id="nombre" name="nombre" value="<?php echo $nombre; ?>" required>
            </div>
            <div class="form-group">
                <label for="descripcion">Descripción:</label>
                <textarea class="form-control" id="descripcion" name="descripcion" rows="3"><?php echo $descripcion; ?></textarea>
            </div>
            <div class="form-group">
                <label for="precio">Precio:</label>
                <input type="text" class="form-control" id="precio" name="precio" value="<?php echo $precio; ?>" required>
            </div>
            <div class="form-group">
                <label for="id_marca">Marca:</label>
                <select class="form-control" id="id_marca" name="id_marca" required>
                    <?php
                    // Obtener marcas desde la base de datos
                    $query_marcas = "SELECT * FROM Marca";
                    $result_marcas = mysqli_query($conexion, $query_marcas);
                    while ($marca = mysqli_fetch_assoc($result_marcas)) {
                        $selected = ($marca['id'] == $id_marca) ? 'selected' : '';
                        echo "<option value='" . $marca['id'] . "' $selected>" . $marca['nombre'] . "</option>";
                    }
                    ?>
                </select>
            </div>
            <div class="form-group">
                <label for="id_categoria">Categoría:</label>
                <select class="form-control" id="id_categoria" name="id_categoria" required>
                    <?php
                    // Obtener categorías desde la base de datos
                    $query_categorias = "SELECT * FROM Categoria";
                    $result_categorias = mysqli_query($conexion, $query_categorias);
                    while ($categoria = mysqli_fetch_assoc($result_categorias)) {
                        $selected = ($categoria['id'] == $id_categoria) ? 'selected' : '';
                        echo "<option value='" . $categoria['id'] . "' $selected>" . $categoria['nombre'] . "</option>";
                    }
                    ?>
                </select>
            </div>
            <div class="form-group">
                <label for="id_presentacion">Presentación:</label>
                <select class="form-control" id="id_presentacion" name="id_presentacion" required>
                    <?php
                    // Obtener presentaciones desde la base de datos
                    $query_presentaciones = "SELECT * FROM Presentacion";
                    $result_presentaciones = mysqli_query($conexion, $query_presentaciones);
                    while ($presentacion = mysqli_fetch_assoc($result_presentaciones)) {
                        $selected = ($presentacion['id'] == $id_presentacion) ? 'selected' : '';
                        echo "<option value='" . $presentacion['id'] . "' $selected>" . $presentacion['nombre'] . "</option>";
                    }
                    ?>
                </select>
            </div>
            <div class="form-group">
                <label for="stock_minimo">Stock Mínimo:</label>
                <input type="number" class="form-control" id="stock_minimo" name="stock_minimo" value="<?php echo $stock_minimo; ?>" required>
            </div>
            <div class="form-group">
                <label for="stock_maximo">Stock Máximo:</label>
                <input type="number" class="form-control" id="stock_maximo" name="stock_maximo" value="<?php echo $stock_maximo; ?>" required>
            </div>
            <div class="form-group">
                <label for="cantidad">Cantidad:</label>
                <input type="number" class="form-control" id="cantidad" name="cantidad" value="<?php echo $cantidad; ?>" required>
            </div>
            <button type="submit" class="btn btn-primary">Actualizar Producto</button>
        </form>
    </div>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
