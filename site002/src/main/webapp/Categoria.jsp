<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.productos.negocio.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Filtrar por Categoría - A-Technology</title>
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
    <a href="index.jsp">Inicio</a>
    <a href="Productos.jsp">Productos</a>
    <a class="active" href="Categoria.jsp">Buscar por Categoría</a>
    <a href="Login.jsp">Login</a>
</nav>

<main>
    <div class="contenedor">
        <h2>Filtrar productos por categoría</h2>
        <form method="GET" action="Categoria.jsp">
            <%
                Categoria cat = new Categoria();
                out.print(cat.mostrarCategoria());
            %>
            <br><br>
            <input type="submit" value="Buscar productos">
        </form>

        <hr>

        <%
            String categoriaSeleccionada = request.getParameter("cmbCategoria");
            Producto pr = new Producto();

            if (categoriaSeleccionada != null && !categoriaSeleccionada.isEmpty()) {
                out.print("<h3>Productos en la categoría seleccionada:</h3>");
                out.print(pr.buscarProductoCategoria(Integer.parseInt(categoriaSeleccionada)));
            } else {
                out.print("<h3>Todos los productos:</h3>");
                out.print(pr.consultarTodo());
            }
        %>
    </div>
</main>

<footer>
    <p>&copy; 2025 A-Technology. Todos los derechos reservados.</p>
    <ul class="redes-sociales">
        <li><a href="https://www.facebook.com"><img src="iconos/facebook.png" alt="Facebook" width="30"></a></li>
        <li><a href="https://www.instagram.com"><img src="iconos/instagram.png" alt="Instagram" width="30"></a></li>
        <li><a href="https://www.tiktok.com"><img src="iconos/tik-tok.png" alt="TikTok" width="30"></a></li>
    </ul>
</footer>

</body>
</html>
