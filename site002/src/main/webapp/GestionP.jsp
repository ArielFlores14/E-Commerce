<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.productos.negocio.*"%>
<%
    String mensaje = "";
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            String nombre = request.getParameter("txtNombre");
            int idCategoria = Integer.parseInt(request.getParameter("cmbCategoria"));
            int cantidad = Integer.parseInt(request.getParameter("cantidad"));
            double precio = Double.parseDouble(request.getParameter("precio"));

            Producto prInsert = new Producto();
            mensaje = prInsert.insertarProducto(nombre, idCategoria, cantidad, precio);
        } catch (Exception e) {
            mensaje = "❌ Error al insertar el producto: " + e.getMessage();
        }
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Productos - A-Technology</title>
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
    <h2 class="destacado">La mejor tecnología a tu alcance</h2>
    <h4 id="favorito">Donde la innovación cobra vida</h4>
</header>

<nav>
    <a class="active" href="GestionP.jsp">Administrar Productos</a>
    <a href="cambiarclave.jsp">Cambiar Clave</a>
    <a href="Cerrarsesion.jsp">Cerrar Sesión</a>
</nav>

<main>
    <div class="form-container">
        <h2>Registrar Producto</h2>

        <% if (!mensaje.isEmpty()) { %>
            <p style="color: <%= mensaje.startsWith("❌") ? "red" : "limegreen" %>;">
                <strong><%= mensaje %></strong>
            </p>
        <% } %>

        <form action="GestionP.jsp" method="post">
            <label for="nombre">Nombre del Producto</label>
            <input type="text" id="nombre" name="txtNombre" required>

            <label for="categoria">Categoría:</label>
            <%
                Categoria cat = new Categoria();
                out.print(cat.mostrarCategoria());
            %>

            <label for="cantidad">Cantidad:</label>
            <input type="number" name="cantidad" id="cantidad" min="1" required>

            <label for="precio">Precio (USD):</label>
            <input type="number" name="precio" id="precio" step="0.01" min="0" required>

            <label for="foto">Foto:</label>
            <input type="file" name="foto" id="foto" accept="image/*" disabled>
            <!-- Campo deshabilitado por ahora -->

            <button type="submit">Enviar</button>
            <button type="reset">Borrar</button>
        </form>
    </div>

    <div class="contenedor">
        <section>
            <h3>Listado de Productos</h3>
            <%
                Producto pr = new Producto();
                out.print(pr.reporteProducto());
            %>
        </section>
    </div>
</main>

<footer>
    <ul>
        <li><a href="https://www.facebook.com/"><img src="iconos/facebook.png" alt="facebook" height="30" width="30"/></a></li>
        <li><a href="https://www.instagram.com/"><img src="iconos/instagram.png" alt="instagram" height="30" width="30"/></a></li>
        <li><a href="https://www.tiktok.com/"><img src="iconos/tik-tok.png" alt="tiktok" height="30" width="30"/></a></li>
    </ul>
    <p style="text-align:center;">&copy; 2025 A-Technology. Todos los derechos reservados.</p>
</footer>

</body>
</html>
