<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background-color: #f8f9fa; /* Color de fondo claro */
            padding-top: 20px;
        }
        .card {
            margin-bottom: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Sombra de caja para las tarjetas */
            transition: transform 0.2s; /* Animación de transformación */
        }
        .card:hover {
            transform: translateY(-10px); /* Efecto de elevar al pasar el ratón */
        }
        .btn-rosa {
            background-color: #ff69b4; /* Color rosa */
            border-color: #ff69b4;
            color: white;
        }
        .btn-primary {
            background-color: #ff66b2;
            border-color: #ff66b2;
        }
        .btn-rosa:hover {
            background-color: #ff1493; /* Color rosa oscuro */
            border-color: #ff1493;
        }
        .card-title {
            color: #343a40; /* Color del título */
        }
        .card-text {
            color: #6c757d; /* Color del texto */
        }
        .navbar {
            background-color: #ff69b4; /* Color rosa del encabezado */
        }
        .navbar-brand, .nav-link {
            color: white !important;
        }
        .footer {
            background-color: #343a40; /* Color del pie de página */
            color: white;
            padding: 20px 0;
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<?php
include ("conexion/config.php");
include ("carrito.php"); 
?>
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="#">Pretty and Femenine</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="menu.php">Inicio</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Labiales.php">Labiales</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Brumas.php">Brumas</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Accesorios.php">Accesorios</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Bolsos.php">Bolsos</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="mostrarCarrito.php">Carrito(<?php
                    echo (empty($_SESSION['CARRITO'])) ? 0 : count($_SESSION['CARRITO']);
                    ?>)</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="alert alert-success">
    <?php echo $mensaje;?>
</div>

<div class="container">
    <div class="row">
        <?php 
            include_once("conexion/config.php");
            include("conexion/conectar-mysql.php");
            $consulta = "SELECT * FROM producto WHERE producto.id_categoria = '1'";
            $resultado = mysqli_query($conexion, $consulta);
            if (!$resultado) {
                echo "Error en la consulta: " . mysqli_error($conexion);
                exit;
            }
            while ($producto = mysqli_fetch_assoc($resultado)) {
                echo "<div class='col-3'>";
                echo "<div class='card'>";
                echo "<img title='{$producto['nombre']}' alt='{$producto['descripcion']}' class='card-img-top' src='{$producto['imagen_url']}'>"; 
                echo "<div class='card-body'>";
                echo "<h5 class='card-title'>{$producto['nombre']}</h5>";
                echo "<p class='card-text'>{$producto['precio']} USD</p>";
                echo "<p class='card-text'>{$producto['descripcion']}</p>";
                echo "<form action='' method='post'>";
                echo "<input type='hidden' name='id' id='id' value='" . openssl_encrypt($producto['id'], COD, KEY) . "'>";
                echo "<input type='hidden' name='nombre' id='nombre' value='" . openssl_encrypt($producto['nombre'], COD, KEY) . "'>";
                echo "<input type='hidden' name='precio' id='precio' value='" . openssl_encrypt($producto['precio'], COD, KEY) . "'>";
                echo "<input type='hidden' name='descripcion' id='descripcion' value='" . openssl_encrypt($producto['descripcion'], COD, KEY) . "'>";
                echo "<input type='hidden' name='cantidad' id='cantidad' value='" . openssl_encrypt(1, COD, KEY) . "'>";
                echo "<button class='btn btn-primary' name='btnAccion' value='agregar' type='submit'>Agregar al carrito</button>";
                echo "</form>";
                echo "</div>";
                echo "</div>";
                echo "</div>";
            }
            mysqli_free_result($resultado);
            mysqli_close($conexion);
        ?>
    </div>
</div>

<!-- Bootstrap JS Bundle (includes Popper) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-XXXXXX" crossorigin="anonymous"></script>
</body>
</html>
