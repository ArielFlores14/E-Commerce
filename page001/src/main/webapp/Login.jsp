<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Iniciar Sesión - A-Technology</title>
    <link href="css/estilos.css" rel="stylesheet" type="text/css">
</head>
<body>

<header>
    <h1>A-Technology</h1>
    <h2 class="destacado">La mejor tecnología a tu alcance</h2>
</header>

<main>
    <div class="form-container">
        <h2>Iniciar Sesión</h2>
        <form action="validaruser.jsp" method="post">
            <div class="form-group">
                <label for="usuario">Usuario:</label>
                <input type="text" id="usuario" name="usuario" required>
            </div>

            <div class="form-group">
                <label for="contrasena">Contraseña:</label>
                <input type="password" id="contrasena" name="contrasena" required>
            </div>

            <button type="submit">Iniciar Sesión</button>
        </form>

        <form action="Registros.jsp" method="get" style="margin-top: 10px;">
            <button type="submit">Registrarse</button>
        </form>
    </div>
</main>

<footer>
    <p>&copy; 2025 A-Technology. Todos los derechos reservados.</p>
    <ul class="redes-sociales">
        <li><a href="https://www.facebook.com" target="_blank"><img src="Iconos/faceb.png" alt="Facebook"></a></li>
        <li><a href="https://www.instagram.com" target="_blank"><img src="Iconos/instagram.png" alt="Instagram"></a></li>
        <li><a href="https://www.tiktok.com" target="_blank"><img src="Iconos/tiktok.png" alt="TikTok"></a></li>
    </ul>
</footer>

</body>
</html>
