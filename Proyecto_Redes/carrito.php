<?php
session_start();

include("conexion/conectar-mysql.php"); // Asegúrate de que este archivo contiene la conexión a la base de datos

$mensaje = "";

// Función para verificar el stock disponible
function verificarStock($conexion, $id, $cantidad) {
    $query = $conexion->prepare("SELECT cantidad FROM producto WHERE id = ?");
    $query->bind_param("i", $id);
    $query->execute();
    $resultado = $query->get_result();
    $producto = $resultado->fetch_assoc();

    if ($producto && $producto['cantidad'] >= $cantidad) {
        return true;
    } else {
        return false;
    }
}

if (isset($_POST['btnAccion'])) {

    switch ($_POST['btnAccion']) {

        case 'agregar':

            if (is_numeric(openssl_decrypt($_POST['id'], COD, KEY))) {
                $ID = openssl_decrypt($_POST['id'], COD, KEY);
                $mensaje = "ID correcto: " . $ID;
            } else {
                $mensaje = "ID incorrecto";
                break;
            }

            if (is_string(openssl_decrypt($_POST['nombre'], COD, KEY))) {
                $NOMBRE = openssl_decrypt($_POST['nombre'], COD, KEY);
                $mensaje .= "NOMBRE correcto: " . $NOMBRE . "<br/>";
            } else {
                $mensaje .= "NOMBRE incorrecto<br/>";
                break;
            }

            if (is_numeric(openssl_decrypt($_POST['precio'], COD, KEY))) {
                $PRECIO = openssl_decrypt($_POST['precio'], COD, KEY);
                $mensaje .= "PRECIO correcto: " . $PRECIO . "<br/>";
            } else {
                $mensaje .= "PRECIO incorrecto<br/>";
                break;
            }

            if (is_string(openssl_decrypt($_POST['descripcion'], COD, KEY))) {
                $DESCRIPCION = openssl_decrypt($_POST['descripcion'], COD, KEY);
                $mensaje .= "DESCRIPCION correcta: " . $DESCRIPCION . "<br/>";
            } else {
                $mensaje .= "DESCRIPCION incorrecta<br/>";
                break;
            }

            if (is_numeric(openssl_decrypt($_POST['cantidad'], COD, KEY))) {
                $CANTIDAD = openssl_decrypt($_POST['cantidad'], COD, KEY);
                $mensaje .= "CANTIDAD correcta: " . $CANTIDAD . "<br/>";
            } else {
                $mensaje .= "CANTIDAD incorrecta<br/>";
                break;
            }

            if (is_numeric($ID) && is_string($NOMBRE) && is_numeric($PRECIO) && is_string($DESCRIPCION) && is_numeric($CANTIDAD)) {
                if (verificarStock($conexion, $ID, $CANTIDAD)) {
                    if (!isset($_SESSION['CARRITO'])) {
                        $producto = array(
                            'ID' => $ID,
                            'NOMBRE' => $NOMBRE,
                            'CANTIDAD' => $CANTIDAD,
                            'PRECIO' => $PRECIO,
                            'DESCRIPCION' => $DESCRIPCION
                        );
                        $_SESSION['CARRITO'][0] = $producto;
                        $mensaje = "Producto agregado al carrito";
                    } else {
                        $idProductos = array_column($_SESSION['CARRITO'], "ID");
                        if (in_array($ID, $idProductos)) {
                            echo "<script>alert('El producto ya ha sido seleccionado');</script>";
                            $mensaje = "";
                        } else {
                            $NumeroProductos = count($_SESSION['CARRITO']);
                            $producto = array(
                                'ID' => $ID,
                                'NOMBRE' => $NOMBRE,
                                'CANTIDAD' => $CANTIDAD,
                                'PRECIO' => $PRECIO,
                                'DESCRIPCION' => $DESCRIPCION
                            );
                            $_SESSION['CARRITO'][$NumeroProductos] = $producto;
                            $mensaje = "Producto agregado al carrito";
                        }
                    }
                } else {
                    $mensaje = "Cantidad no disponible en stock";
                }
            } else {
                $mensaje = "Datos del producto incorrectos";
            }
            break;

        case "Eliminar":
            if (is_numeric(openssl_decrypt($_POST['id'], COD, KEY))) {
                $ID = openssl_decrypt($_POST['id'], COD, KEY);

                foreach ($_SESSION['CARRITO'] as $indice => $producto) {
                    if ($producto['ID'] == $ID) {
                        unset($_SESSION['CARRITO'][$indice]);
                        echo "<script>alert('Elemento borrado...');</script>";
                        break; // Terminate the loop once the product is found and deleted
                    }
                }
                $mensaje = "ID correcto: " . $ID;
            } else {
                $mensaje = "ID incorrecto";
            }
            break;

        case "ActualizarCantidad":
            if (is_numeric(openssl_decrypt($_POST['id'], COD, KEY))) {
                $ID = openssl_decrypt($_POST['id'], COD, KEY);
                $cantidad = $_POST['cantidad'];

                if (verificarStock($conexion, $ID, $cantidad)) {
                    foreach ($_SESSION['CARRITO'] as $indice => $producto) {
                        if ($producto['ID'] == $ID) {
                            $_SESSION['CARRITO'][$indice]['CANTIDAD'] = $cantidad;
                            $mensaje = "Cantidad actualizada";
                            break;
                        }
                    }
                } else {
                    $mensaje = "Cantidad no disponible en stock";
                }
            } else {
                $mensaje = "ID incorrecto";
            }
            break;
    }
}
?>
