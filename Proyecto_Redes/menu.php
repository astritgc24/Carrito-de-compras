<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Tienda de Productos Cosméticos</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
    /* Estilos personalizados */
    body {
      font-family: Arial, sans-serif; /* Fuente del cuerpo del documento */
      background-color: #f8f9fa; /* Color de fondo gris claro */
      background-image: url("Imagenes/fondo.jpg"); /* Imagen de fondo */
      background-size: cover; /* Cubrir todo el espacio con la imagen */
      background-position: center; /* Centrar la imagen */
      background-repeat: no-repeat; /* No repetir la imagen */
      padding-bottom: 50px; /* Espacio adicional en la parte inferior */
    }
    .logo-container {
      position: absolute; /* Posiciona el logo en la esquina superior izquierda */
      top: 10px; /* Ajusta la distancia desde el borde superior */
      left: 10px; /* Ajusta la distancia desde el borde izquierdo */
    }
    .logo-container img {
      width: 150px; /* Ajusta el tamaño del logo */
      height: 150px; /* Ajusta el tamaño del logo */
    }
    .bg-pink {
      background-color: #ff69b4 !important; /* Color de fondo rosa */
      color: #fff; /* Texto en color blanco */
      padding: 60px 0; /* Espaciado interior del encabezado */
      position: relative; /* Posicionamiento relativo para evitar que el contenido se superponga */
    }
    .navbar {
      border-bottom: 3px solid #ff69b4; /* Borde inferior rosa */
      background-color: #fff; /* Color de fondo blanco */
      padding: 0; /* Espaciado cero para el contenedor de la barra de navegación */
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Sombra ligera */
    }
    .navbar-brand {
      color: #ff69b4 !important; /* Color del texto del logo */
      font-weight: bold; /* Fuente en negrita */
      font-size: 24px; /* Tamaño de fuente del logo */
    }
    .navbar-toggler {
      border-color: #ff69b4; /* Color del botón del menú desplegable */
    }
    .navbar-toggler-icon {
      background-color: #fff; /* Color de fondo blanco para el icono del botón del menú desplegable */
    }
    .navbar-nav .nav-link {
      color: #495057; /* Color del texto en el menú */
      font-size: 18px; /* Tamaño de fuente del texto del menú */
      margin-right: 20px; /* Margen derecho entre elementos del menú */
    }
    .navbar-nav .nav-link:hover {
      color: #ff69b4; /* Color del texto en el menú al pasar el ratón */
    }
    .anuncio img {
      max-width: 100%; /* Imágenes de anuncios con ancho máximo del contenedor */
      height: auto; /* Altura automática para mantener la proporción */
      border-radius: 10px; /* Bordes redondeados para las imágenes */
    }
    footer {
      background-color: #fff; /* Color de fondo blanco para el pie de página */
      color: #495057; /* Color del texto del pie de página */
      padding: 30px 0; /* Espaciado interior del pie de página */
      box-shadow: 0 -2px 4px rgba(0, 0, 0, 0.1); /* Sombra ligera */
      position: relative; /* Cambiado a 'relative' para evitar superposición con contenido */
      width: 100%; /* Ancho completo */
      margin-top: 50px; /* Margen superior para separar del contenido */
    }
    .container-main {
      margin-top: 50px; /* Margen superior para separar el contenido del navbar */
    }
    .anuncio {
      margin-bottom: 20px; /* Margen inferior entre anuncios */
    }
    .header-title {
      font-size: 3rem; /* Tamaño de fuente grande */
      font-weight: bold; /* Negrita */
      color: #fff; /* Color blanco */
      text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); /* Sombra del texto */
      font-family: 'Cursive', sans-serif; /* Fuente cursiva */
    }
  </style>
</head>
<body>
<?php
include ("conexion/config.php");
include ("carrito.php"); 
?>

<div class="logo-container">
  <img src="Imagenes/logo.png" alt="Logo">
</div>

<header class="bg-pink text-center">
  <div class="container">
    <h1 class="header-title">Pretty and Feminine</h1>
  </div>
</header>

<nav class="navbar navbar-expand-lg navbar-light">
  <div class="container">
    <a class="navbar-brand" href="#">Bienvenido</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item">
          <a class="nav-link" href="Lociones.php">Lociones</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="Brumas.php">Brumas</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="Bolsos.php">Bolsos</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="Accesorios.php">Accesorios</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="Labiales.php">Labiales</a>
        </li>
        <!-- Icono del carrito de compras -->
        <li class="nav-item">
          <a class="nav-link" href="mostrarCarrito.php">Carrito(<?php
            echo (empty($_SESSION['CARRITO'])) ? 0 : count($_SESSION['CARRITO']);
            ?>) 
            <img src="Imagenes/carro.png" alt="Carrito de compras" style="width: 30px; height: 30px;"></a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<div class="container container-main">
  <!-- Aquí se mostrarían los productos de acuerdo a la categoría seleccionada -->
</div>

<footer class="text-center">
  <div class="container">
    <p></p>
    <div class="row">
      <div class="col-md-3 anuncio">
        <img src="Imagenes/anuncio1.jpg" alt="Anuncio 1">
      </div>
      <div class="col-md-3">
        <div class="anuncio">
          <img src="Imagenes/anuncio2.jpeg" alt="Anuncio 2">
        </div>
        <div class="anuncio">
          <img src="Imagenes/anuncio5.jpg" alt="Anuncio 5">
        </div>
      </div>
      <div class="col-md-3 anuncio">
        <img src="Imagenes/anuncio3.jpg" alt="Anuncio 3">
      </div>
      <div class="col-md-3 anuncio">
        <img src="Imagenes/anuncio4.jpg" alt="Anuncio 4">
      </div>
    </div>
  </div>
</footer>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
