<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.productos.negocio.*"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Iniciar Sesión - A-Technology</title>
  <link href="css/estilos.css" rel="stylesheet" type="text/css">
</head>
<body>

<header>
  <div class="logo">
    <a href="index.jsp">
      <img src="iconos/Logo1.png" alt="Logo A-Technology" id="logo">
    </a>
  </div>
  <h1>A-Technology</h1>
  <h2 class="destacado">La mejor tecnología a tu alcance</h2>
</header>

<nav>
  <a class="active" href="index.jsp">Inicio</a>
  <a href="Productos.jsp">Productos</a>
  <a href="Categoria.jsp">Buscar por Categoría</a>
  <a href="Login.jsp">Login</a>
</nav>

<main>
  <div class="form-container">
    <h2>Iniciar Sesión</h2>

    <form action="validaruser.jsp" method="post">
      <div class="form-group">
        <label for="usuario">Correo electrónico:</label>
        <input type="email" id="usuario" name="usuario" required>
      </div>

      <div class="form-group">
        <label for="clave">Contraseña:</label>
        <input type="password" id="clave" name="clave" required>
      </div>

      <div class="botones">
        <button type="submit">Entrar</button>
      </div>
    </form>

    <form action="Registros.jsp" method="get" style="margin-top: 10px;">
      <button type="submit">Registrarse</button>
    </form>

    <!-- Mostrar mensaje de error si existe -->
    <%
      String error = request.getParameter("error");
      if (error != null) {
    %>
      <div class="error-message">
        <p style="color: red; font-weight: bold;"><%= error %></p>
      </div>
    <%
      }
    %>
  </div>
</main>



<footer>
  <p>&copy; 2025 A-Technology. Todos los derechos reservados.</p>
  <ul class="redes-sociales">
    <li><a href="https://www.facebook.com" target="_blank"><img src="iconos/faceb.png" alt="Facebook" width="30"></a></li>
    <li><a href="https://www.instagram.com" target="_blank"><img src="iconos/instagram.png" alt="Instagram" width="30"></a></li>
    <li><a href="https://www.tiktok.com" target="_blank"><img src="iconos/tiktok.png" alt="TikTok" width="30"></a></li>
  </ul>
</footer>

</body>
</html>
