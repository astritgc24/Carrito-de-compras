<?php
session_start();

// Cerrar sesión si se hace clic en el botón de cerrar sesión
if (isset($_POST['cerrar_sesion'])) {
    session_unset(); // Eliminar todas las variables de sesión
    session_destroy(); // Destruir la sesión
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar Sesión</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3e5f5;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #e1bee7;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #880e4f;
            text-align: center;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        label {
            color: #880e4f;
            font-weight: bold;
        }

        input[type="email"],
        input[type="password"],
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0 15px;
            border-radius: 5px;
            border: 1px solid #880e4f;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #880e4f;
            color: white;
            font-weight: bold;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #6a1b9a;
        }

        .register-link {
            text-align: center;
            margin-top: 15px;
        }

        .register-link a {
            color: #880e4f;
            text-decoration: none;
        }

        .register-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Iniciar Sesión</h2>
    <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
        <label for="email">Correo Electrónico:</label><br>
        <input type="email" id="email" name="correo_electronico" required><br><br>
        
        <label for="password">Contraseña:</label><br>
        <input type="password" id="password" name="contraseña" required><br><br>
        
        <input type="submit" value="Iniciar Sesión">
    </form>

    <!-- Mostrar mensaje -->
    <?php echo $mensaje; ?>

    <div class="register-link">
        ¿No tienes una cuenta? <a href="login.php">Regístrate aquí</a>
    </div>
</div>

</body>
</html>

</body>
</html>
