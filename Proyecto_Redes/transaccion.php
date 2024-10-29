<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Entradas y Salidas</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-6">
                <h2>Registro de Entradas</h2>
                <table class="table">
                    <thead>
                        <tr>
                            <th>ID Ejemplar</th>
                            <th>Nombre</th>
                            <th>Precio</th>
                            <th>Categoría</th>
                            <th>Presentación</th>
                            <th>Marca</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        include("conexion/conectar-mysql.php");

                        // Obtener registros de entradas
                        $query_entradas = "SELECT Ejemplar.id AS id_ejemplar, Producto.nombre, Producto.precio, Categoria.nombre AS categoria, Presentacion.nombre AS presentacion, Marca.nombre AS marca 
                                            FROM Ejemplar 
                                            INNER JOIN Producto ON Ejemplar.id_producto = Producto.id 
                                            INNER JOIN Categoria ON Producto.id_categoria = Categoria.id 
                                            INNER JOIN Presentacion ON Producto.id_presentacion = Presentacion.id 
                                            INNER JOIN Marca ON Producto.id_marca = Marca.id";
                        $result_entradas = mysqli_query($conexion, $query_entradas);
                        if (!$result_entradas) {
                            die("Error en la consulta de entradas: " . mysqli_error($conexion));
                        }
                        while ($entrada = mysqli_fetch_assoc($result_entradas)) {
                            echo "<tr>";
                            echo "<td>" . $entrada['id_ejemplar'] . "</td>";
                            echo "<td>" . $entrada['nombre'] . "</td>";
                            echo "<td>" . $entrada['precio'] . "</td>";
                            echo "<td>" . $entrada['categoria'] . "</td>";
                            echo "<td>" . $entrada['presentacion'] . "</td>";
                            echo "<td>" . $entrada['marca'] . "</td>";
                            echo "</tr>";
                        }
                        ?>
                    </tbody>
                </table>
            </div>
            <div class="col-md-6">
                <h2>Registro de Salidas</h2>
                <table class="table">
                    <thead>
                        <tr>
                            <th>ID Ejemplar</th>
                            <th>Nombre</th>
                            <th>Precio</th>
                            <th>Categoría</th>
                            <th>Presentación</th>
                            <th>Marca</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        // Obtener registros de salidas (vacío por el momento)
                        $query_salidas = "SELECT Ejemplar.id AS id_ejemplar, Producto.nombre, Producto.precio, Categoria.nombre AS categoria, Presentacion.nombre AS presentacion, Marca.nombre AS marca 
                                            FROM Ejemplar 
                                            INNER JOIN Producto ON Ejemplar.id_producto = Producto.id 
                                            INNER JOIN Categoria ON Producto.id_categoria = Categoria.id 
                                            INNER JOIN Presentacion ON Producto.id_presentacion = Presentacion.id 
                                            INNER JOIN Marca ON Producto.id_marca = Marca.id 
                                            WHERE Ejemplar.id = 0"; // Consulta vacía temporalmente
                        $result_salidas = mysqli_query($conexion, $query_salidas);
                        if (!$result_salidas) {
                            die("Error en la consulta de salidas: " . mysqli_error($conexion));
                        }
                        while ($salida = mysqli_fetch_assoc($result_salidas)) {
                            echo "<tr>";
                            echo "<td>" . $salida['id_ejemplar'] . "</td>";
                            echo "<td>" . $salida['nombre'] . "</td>";
                            echo "<td>" . $salida['precio'] . "</td>";
                            echo "<td>" . $salida['categoria'] . "</td>";
                            echo "<td>" . $salida['presentacion'] . "</td>";
                            echo "<td>" . $salida['marca'] . "</td>";
                            echo "</tr>";
                        }
                        ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
