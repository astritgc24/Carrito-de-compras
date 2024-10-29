<?php
$servidor = "localhost";
$usuario = "root";
$password = "";
$baseDatos = "productos_vs";

// Conectando a la base de datos
$conexion = mysqli_connect($servidor, $usuario, $password, $baseDatos);

// Variable para almacenar mensajes de éxito o error
$mensaje = "";

// Verificar si se ha enviado el formulario de registro
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST["correo_electronico"];
    $plain_password = $_POST["contraseña"]; // Nombre de variable cambiado a plain_password
    $username = $_POST["nombre_usuario"];

    // Hashear la contraseña antes de guardarla en la base de datos (es una buena práctica)
    $hashed_password = password_hash($plain_password, PASSWORD_DEFAULT);

    // Preparar la consulta SQL para insertar los datos del usuario en la tabla 'usuario'
    $sql = "INSERT INTO usuario (correo_electronico, contraseña, nombre_usuario) VALUES (?, ?, ?)";

    // Preparar la declaración SQL
    $stmt = mysqli_prepare($conexion, $sql);

    // Bind parameters
    mysqli_stmt_bind_param($stmt, "sss", $email, $hashed_password, $username);

    // Ejecutar la consulta
    if (mysqli_stmt_execute($stmt)) {
        // El usuario se registró correctamente
        $mensaje = "¡Usuario registrado exitosamente!";
        header("Location: login.php"); // Redirigir al usuario a la página de inicio de sesión
        exit();
    } else {
        // Si hay un error al insertar el usuario en la base de datos
        $mensaje = "Error al registrar el usuario. Por favor, inténtalo de nuevo más tarde.";
    }

    // Cerrar la declaración
    mysqli_stmt_close($stmt);
}

// Cerrar la conexión
mysqli_close($conexion);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Usuario</title>
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
        input[type="text"],
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
    </style>
</head>
<body>

<div class="container">
    <h2>Registro de Usuario</h2>
    <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
        <label for="email">Correo Electrónico:</label><br>
        <input type="email" id="email" name="correo_electronico" required><br><br>
        
        <label for="password">Contraseña:</label><br>
        <input type="password" id="password" name="contraseña" required><br><br>
        
        <label for="username">Nombre de Usuario:</label><br>
        <input type="text" id="username" name="nombre_usuario" required><br><br>
        
        <input type="submit" value="Registrar">
    </form>

    <!-- Mostrar mensaje -->
    <?php echo $mensaje; ?>
</div>

</body>
</html>
