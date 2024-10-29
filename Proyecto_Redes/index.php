<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Interface</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            height: 100vh;
            display: flex;
            flex-direction: column;
        }
        .header {
            width: 100%;
            background-color: #34495e;
            color: white;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .sidebar {
            width: 250px;
            background-color: #2c3e50;
            height: calc(100vh - 50px);
            padding-top: 20px;
            position: fixed;
            top: 50px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .sidebar button {
            width: 80%;
            padding: 15px;
            margin: 10px 0;
            font-size: 18px;
            color: #2c3e50;
            background-color: white;
            border: none;
            cursor: pointer;
            transition: background 0.3s, color 0.3s;
        }
        .sidebar button:hover {
            background-color: #34495e;
            color: white;
        }
        .main-content {
            margin-left: 250px;
            padding: 20px;
            width: calc(100% - 250px);
            overflow-x: auto;
        }
        .table-custom thead th {
            background-color: #34495e;
            color: white;
            border-color: #34495e;
        }
        .table-custom tbody tr:hover {
            background-color: #f2f2f2;
        }
        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
                top: 0;
            }
            .main-content {
                margin-left: 0;
                width: 100%;
            }
        }
    </style>
</head>
<body>

<div class="header">
    <div>Administrador: Astrit Lariza Garcia Castillo</div>
    <button onclick="logout()" class="btn btn-danger">Cerrar sesión</button>
</div>

<div class="sidebar">
    <button onclick="navigateTo('registrar-producto.php')" class="btn btn-light">Agregar productos</button>
    <button onclick="navigateTo('edit_elim.php')" class="btn btn-light">Editar y Eliminar productos</button>
    <button onclick="navigateTo('transaccion.php')" class="btn btn-light">Consultar transacciones</button>
    <button onclick="navigateTo('insertar-ejemplares.php')" class="btn btn-light">Agregar ejemplares</button>
    <button onclick="navigateTo('menu.php')" class="btn btn-light">Consultar sitio</button>
</div>

<div class="main-content">
    <h1>Productos en existencia</h1>

    <div class="table-responsive">
        <table class="table table-custom table-bordered">
            <thead>
                <tr>
                    <th scope="col">Clave</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Descripción</th>
                    <th scope="col">Precio</th>
                    <th scope="col">Marca</th>
                    <th scope="col">Categoría</th>
                    <th scope="col">Presentación</th>
                    <th scope="col">Stock min</th>
                    <th scope="col">Stock max</th>
                    <th scope="col">Existencias</th>
                </tr>
            </thead>
            <tbody>
                <?php
                // Conectar con el servidor de BD
                include("conexion/conectar-mysql.php");

                // Preparar la consulta
                $sql = "SELECT p.id, p.nombre, p.descripcion, p.precio, m.nombre AS marca, c.nombre AS categoria, pr.nombre AS presentacion, p.stock_minimo, p.stock_maximo, p.cantidad
                FROM Producto p
                INNER JOIN Marca m ON p.id_marca = m.id
                INNER JOIN Categoria c ON p.id_categoria = c.id
                INNER JOIN Presentacion pr ON p.id_presentacion = pr.id";
        

                // Ejecutar consulta
                $ejecConsulta = mysqli_query($conexion, $sql);

                // Mostrar los datos obtenidos
                while ($regProducto = mysqli_fetch_array($ejecConsulta)) {
                    echo "<tr>";
                    echo "<th scope='row'>" . $regProducto['id'] . "</th>" .
                         "<td>" . $regProducto['nombre'] . "</td>" .
                         "<td>" . $regProducto['descripcion'] . "</td>" .
                         "<td>" . $regProducto['precio'] . "</td>" .
                         "<td>" . $regProducto['marca'] . "</td>" .
                         "<td>" . $regProducto['categoria'] . "</td>" .
                         "<td>" . $regProducto['presentacion'] . "</td>" .
                         "<td>" . $regProducto['stock_minimo'] . "</td>" .
                         "<td>" . $regProducto['stock_maximo'] . "</td>" .
                         "<td>" . $regProducto['cantidad'] . "</td>";
                    echo "</tr>";
                }
                ?>
            </tbody>
        </table>
    </div>
</div>

<script>
    function navigateTo(page) {
        window.location.href = page;
    }

    function logout() {
        alert('Cerrando sesión');
        // Aquí puedes agregar la lógica de cierre de sesión, por ejemplo, redirigir a una página de inicio de sesión.
        window.location.href = 'login.html';
    }
</script>
<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
