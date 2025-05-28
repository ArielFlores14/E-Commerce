<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.productos.negocio.Producto, com.productos.negocio.Categoria" %>

<%
    String mensaje = "";
    Producto producto = new Producto();
    Categoria categoria = new Categoria();

    String idStr = request.getParameter("id");
    if (idStr == null) {
        response.sendRedirect("producto.jsp");
        return;
    }
    int idProducto = Integer.parseInt(idStr);

    // Variables para el formulario
    String nombre = "";
    int idCat = 0;
    int cantidad = 0;
    double precio = 0.0;

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            nombre = request.getParameter("txtNombre");
            idCat = Integer.parseInt(request.getParameter("cmbCategoria"));
            cantidad = Integer.parseInt(request.getParameter("cantidad"));
            precio = Double.parseDouble(request.getParameter("precio"));

            mensaje = producto.actualizarProducto(idProducto, nombre, idCat, cantidad, precio);

            if (!mensaje.startsWith("❌")) {
                mensaje = "✔ Producto actualizado correctamente.";
            }

        } catch (Exception e) {
            mensaje = "❌ Error al actualizar el producto: " + e.getMessage();
        }
    }

    // Cargar datos si no es POST o hubo error
    if (!"POST".equalsIgnoreCase(request.getMethod()) || mensaje.startsWith("❌")) {
        Object[] datos = producto.obtenerProductoCompletoPorId(idProducto);
        if (datos != null) {
            nombre = (String) datos[0];
            idCat = (Integer) datos[1];
            cantidad = (Integer) datos[2];
            precio = (Double) datos[3];
        } else {
            response.sendRedirect("producto.jsp");
            return;
        }
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Actualizar Producto - A-Technology</title>
    <link href="css/est2.css" rel="stylesheet" type="text/css">
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
    <h4 id="favorito">Innovación y calidad para tu día a día</h4>
</header>

<nav>
    <a href="index.jsp">Inicio</a>
    <a class="active" href="GestionP.jsp">Administrar Productos</a>
    <a href="Cerrarsesion.jsp">Cerrar Sesión</a>
</nav>

<main>
    <div class="form-container">
        <h2>Actualizar Producto</h2>

        <% if (!mensaje.isEmpty()) { %>
            <p style="color: <%= mensaje.startsWith("❌") ? "red" : "limegreen" %>;">
                <strong><%= mensaje %></strong>
            </p>
        <% } %>

        <form action="actualizar.jsp?id=<%= idProducto %>" method="post">
            <label for="txtNombre">Nombre:</label>
            <input type="text" name="txtNombre" id="txtNombre" value="<%= nombre %>" required>

            <label for="cmbCategoria">Categoría:</label>
            <%
                String combo = categoria.mostrarCategoria();
                combo = combo.replaceAll("<option value=" + idCat + ">", "<option value=" + idCat + " selected>");
                out.print(combo);
            %>

            <label for="cantidad">Cantidad:</label>
            <input type="number" name="cantidad" id="cantidad" min="1" value="<%= cantidad %>" required>

            <label for="precio">Precio (USD):</label>
            <input type="number" name="precio" id="precio" step="0.01" min="0" value="<%= precio %>" required>

            <button type="submit">Confirmar</button>
            <button type="button" onclick="window.location='producto.jsp'">Cancelar</button>
        </form>
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
