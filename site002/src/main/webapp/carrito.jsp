<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.productos.negocio.*, java.util.*, java.text.NumberFormat" %>
<%
    Carrito carrito = (Carrito) session.getAttribute("carrito");
    if (carrito == null) {
        carrito = new Carrito();
        session.setAttribute("carrito", carrito);
    }

    String action = request.getParameter("action");
    if (action != null) {
        int idProducto = Integer.parseInt(request.getParameter("id"));
        Producto product = new Producto().obtenerProducto(idProducto);

        switch (action) {
            case "add":
                int cantidad = Integer.parseInt(request.getParameter("cantidad"));
                carrito.agregarItem(product, cantidad);
                break;
            case "remove":
                carrito.eliminarItem(idProducto);
                break;
            case "update":
                int nuevaCantidad = Integer.parseInt(request.getParameter("cantidad"));
                carrito.actualizarCantidad(idProducto, nuevaCantidad);
                break;
        }
    }

    NumberFormat formatoMoneda = NumberFormat.getCurrencyInstance();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>A-Technology</title>
    <link href="css/est2.css" rel="stylesheet" type="text/css">
</head>
<body>
    <header>
        <h1>A-Technology</h1>
        <h2 class="destacado">Contamos con variedad de productos electrónicos</h2>
        <h4 id="favorito">Te vendemos lo mejor, a buen precio.</h4>
        <div id="image">
            <img src="iconos/Logo1.png" width="400" height="200" alt="Logo de A-Technology"/>
        </div>
    </header>

    <nav>
        <a href="#" onclick="window.history.back(); return false;">Volver atrás</a>
        <a href="Menu.jsp">Menú</a>
        <a href="../CerrarSesion.jsp">Cerrar Sesión</a>
    </nav>

    <main>
        <section>
            <h2>Tu Carrito de Compras</h2>

            <% if (carrito.getItems().isEmpty()) { %>
                <div class="card" style="text-align: center; padding: 40px; background-color: #2A2B3C;">
                    <h3 class="h4">Tu carrito está vacío</h3>
                    <p>Agrega productos para comenzar tu compra</p>
                    <a href="mostrarProductos.jsp" class="btn btn-primary">Ver Productos</a>
                </div>
            <% } else { %>
                <div class="card" style="padding: 20px; background-color: #2A2B3C;">
                    <h3>Mi Carrito</h3>
                    <table>
                        <thead>
                            <tr>
                                <th>Producto</th>
                                <th>Precio Unitario</th>
                                <th>Cantidad</th>
                                <th>Subtotal</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (ItemCarrito item : carrito.getItems()) {
                                Producto producto = item.getProducto();
                                double subtotal = producto.getPrecio() * item.getCantidad();
                            %>
                            <tr>
                                <td><%= producto.getNombre() %></td>
                                <td><%= formatoMoneda.format(producto.getPrecio()) %></td>
                                <td>
                                    <form method="post" action="carrito.jsp">
                                        <input type="hidden" name="action" value="update">
                                        <input type="hidden" name="id" value="<%= producto.getId() %>">
                                        <input type="number" name="cantidad" value="<%= item.getCantidad() %>" 
                                               min="1" max="<%= producto.getCantidad() %>" 
                                               style="width: 70px; text-align: center;">
                                        <input type="submit" value="Actualizar">
                                    </form>
                                </td>
                                <td><%= formatoMoneda.format(subtotal) %></td>
                                <td>
                                    <a href="carrito.jsp?action=remove&id=<%= producto.getId() %>" 
                                       class="btn btn-outline-danger">Eliminar</a>
                                </td>
                            </tr>
                            <% } %>
                            <tr>
                                <td colspan="3" style="text-align: right;"><strong>Total a Pagar</strong></td>
                                <td><strong><%= formatoMoneda.format(carrito.getTotal()) %></strong></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>

                    <div style="margin-top: 20px; display: flex; justify-content: space-between;">
                        <a href="mostrarProductos.jsp" class="btn btn-outline-secondary">Seguir Comprando</a>
                        <a href="checkout.jsp" class="btn btn-success">Proceder al Pago</a>
                    </div>
                </div>
            <% } %>
        </section>

        <aside>
            <a href="https://www.linkedin.com/in/ariel-flores-766b7b35a/" target="_blank">Ver más información sobre los desarrolladores</a><br>
            <iframe src="https://www.google.com/maps/d/embed?mid=1xMQyjGfhXwePEC61-YUKyv70md9LVFw&ehbc=2E312F" 
                width="100%" height="320" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
        </aside>
    </main>

    <footer>
        <ul>
            <li>&copy; 2025 A-Technology</li>
            <li><a href="mailto:contacto@atechnology.com">Contacto</a></li>
        </ul>
    </footer>
</body>
</html>
