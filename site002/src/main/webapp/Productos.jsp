<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.productos.negocio.*"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Productos - A-Technology</title>
    <link href="css/estilos.css" rel="stylesheet" type="text/css">
</head>
<body>

<header>
    <div class="logo">
        <a href="index.jsp">
            <img src="imagenes/logo.png" alt="Logo A-Technology" id="logo">
        </a>
    </div>
    <h1>A-Technology</h1>
    <h2 class="destacado">Encuentra los mejores productos electrónicos</h2>
    <h4 id="favorito">Tecnología e innovación a tu alcance</h4>
</header>

<nav>
    <a class="active" href="index.jsp">Inicio</a>
    <a class="active" href="Productos.jsp">Productos</a>
    <a href="Categoria.jsp">Buscar por Categoría</a>
    <a href="Login.jsp">Login</a>
</nav>

<main>
    <section class="contenedor">
        <h2>Lista de Productos</h2>

        <div class="product-list">
            <%
                Producto pr = new Producto();
                String tablaProductos = pr.consultarTodo();
                out.print(tablaProductos);
            %>
        </div>
    </section>
</main>

<aside>
    <a href="https://www.linkedin.com/in/anthony-pilliza-1b844335b/" target="_blank" style="color:#00BFFF; font-weight: bold;">
        Ver más información sobre los desarrolladores
    </a>
    <br><br>
<iframe src="https://www.google.com/maps/d/embed?mid=1xMQyjGfhXwePEC61-YUKyv70md9LVFw&ehbc=2E312F" 
                width="100%" height="320" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
</aside>

<footer>
    <p>&copy; 2025 A-Technology. Todos los derechos reservados.</p>
    <ul class="redes-sociales">
        <li><a href="https://www.facebook.com/"><img src="iconos/faceb.png" alt="Facebook" width="30"></a></li>
        <li><a href="https://www.instagram.com/"><img src="iconos/instagram.png" alt="Instagram" width="30"></a></li>
        <li><a href="https://www.tiktok.com/"><img src="iconos/tiktok.png" alt="TikTok" width="30"></a></li>
    </ul>
</footer>

</body>
</html>
