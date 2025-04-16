<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Iniciar Sesión</title>
    <link href="css/estilos.css" rel="stylesheet" type="text/css">
</head>
<body>

<div class="form-container">
    <h2>Inicio de Sesión</h2>
    <form action="procesarLogin.jsp" method="post">
        <label for="usuario">Usuario:</label>
        <input type="text" id="usuario" name="usuario" required>

        <label for="contrasena">Contraseña:</label>
        <input type="password" id="contrasena" name="contrasena" required>

        <button type="submit">Iniciar Sesión</button>
    </form>

    <!-- Botón para ir al registro -->
    <form action="Registros.jsp" method="get" style="margin-top: 10px;">
        <button type="submit">Registrarse</button>
    </form>
</div>

</body>
</html>
