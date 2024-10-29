<?php
include ("conexion/config.php");
include ("carrito.php"); 
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista del Carrito</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Custom CSS for pink theme -->
    <style>
        body {
            background-color: #ffe6f0;
        }
        .container {
            background-color: #fff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        h3 {
            color: #ff99cc;
        }
        .table {
            background-color: #ffe6f0;
        }
        .table th {
            background-color: #ffccdd;
            color: #ffffff;
        }
        .table td {
            background-color: #ffffff;
        }
        .btn-primary {
            background-color: #ff66b2;
            border-color: #ff66b2;
        }
        .btn-primary:hover {
            background-color: #ff4da6;
            border-color: #ff4da6;
        }
        .btn-danger {
            background-color: #ff6699;
            border-color: #ff6699;
        }
        .btn-danger:hover {
            background-color: #ff4d80;
            border-color: #ff4d80;
        }
    </style>
</head>

<body>
<div class="container mt-5">
    <h3>Lista del carrito</h3>
    <?php if (!empty($mensaje)) { ?>
    <div class="alert alert-warning" role="alert">
        <?php echo $mensaje; ?>
    </div>
    <?php } ?>
    <?php if(!empty($_SESSION['CARRITO'])) { ?>
    <table class="table table-light table-bordered">
        <tbody>
            <tr>
                <th width="15%">Nombre</th>
                <th width="20%">Descripción</th>
                <th width="15%" class="text-center">Precio</th>
                <th width="20%" class="text-center">Cantidad</th>
                <th width="15%" class="text-center">Total</th>
                <th width="15%">--</th>
            </tr>
            <?php $total=0; ?>
            <?php foreach($_SESSION['CARRITO'] as $indice=>$producto){?>
            <tr>
                <td><?php echo $producto['NOMBRE']?></td>
                <td><?php echo $producto['DESCRIPCION']?></td>
                <td class="text-center">$<?php echo $producto['PRECIO']?></td>
                <td class="text-center">
                    <form action="" method="post" class="d-inline" id="form-<?php echo $producto['ID']; ?>">
                        <input type="number" name="cantidad" value="<?php echo $producto['CANTIDAD']?>" min="1" style="width: 60px;" onchange="document.getElementById('form-<?php echo $producto['ID']; ?>').submit();">
                        <input type="hidden" name="id" value="<?php echo openssl_encrypt($producto['ID'], COD, KEY);?>">
                        <input type="hidden" name="btnAccion" value="ActualizarCantidad">
                    </form>
                </td>
                <td class="text-center">$<?php echo number_format($producto['PRECIO']*$producto['CANTIDAD'],2);?></td>
                <td>
                    <form action="" method="post">
                        <input type="hidden" name="id" value="<?php echo openssl_encrypt($producto['ID'], COD, KEY);?>">
                        <button 
                        class="btn btn-danger"
                        type="submit"
                        name="btnAccion"
                        value="Eliminar"
                        >Eliminar</button>
                    </form>
                </td>
            </tr>
            <?php $total=$total+($producto['PRECIO']*$producto['CANTIDAD']); ?>
           <?php } ?>
            <tr>
                <td colspan="3" class="text-end"><h3>Total</h3></td>
                <td class="text-center"><h3>$<?php echo number_format($total, 2); ?></h3></td>
                <td></td>
            </tr>
        </tbody>
    </table>
    <?php } else { ?>
        <div class="alert alert-success">
            No hay productos en el carrito
        </div>
    <?php } ?>
</div>

<div class="d-flex justify-content-center mt-4">
<form action="venta.php" method="post">
<a class='btn btn-primary' href='venta.php'>Procesar pago</a>
    <a class='btn btn-primary' href='menu.php'>Seguir comprando</a>
</form>


<!-- Bootstrap JS Bundle (includes Popper) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"></script>
</body>
</html>

