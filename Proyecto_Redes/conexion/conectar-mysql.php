<?php
 $servidor = "localhost";
 $usuario = "root";
 $password = "";
 $baseDatos = "productos_vs";

 //conectando a la base Datos
 $conexion = mysqli_connect($servidor,$usuario,$password,$baseDatos);
  if(!$conexion){
    echo"Problemas al conectar con la BD";
  }
?>