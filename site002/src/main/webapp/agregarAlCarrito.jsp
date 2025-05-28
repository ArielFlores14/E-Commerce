<%@ page import="com.productos.negocio.*, java.util.*" pageEncoding="UTF-8"%>
<%
    // Obtener parámetros del formulario
    int idProducto = Integer.parseInt(request.getParameter("id"));
    String nombreProducto = request.getParameter("nombre");
    int cantidad = Integer.parseInt(request.getParameter("cantidad"));

    // Obtener el producto de la base de datos
    Producto producto = new Producto().obtenerProducto(idProducto);

    if (producto == null) {
        response.sendRedirect("error.jsp?mensaje=El producto no existe");
        return;
    }

    if (cantidad > producto.getCantidad()) {
        response.sendRedirect("error.jsp?mensaje=No hay suficiente stock");
        return;
    }

    // Obtener o crear el carrito
    Carrito carrito = (Carrito) session.getAttribute("carrito");
    if (carrito == null) {
        carrito = new Carrito();
        session.setAttribute("carrito", carrito);
    }

    // Agregar producto al carrito
    carrito.agregarItem(producto, cantidad);
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>A-Technology</title>
    <link href="css/est2.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<main>
    <header>
        <h1>A-Technology</h1>
        <h2 class="destacado">Tecnología que potencia tu mundo</h2>
        <h4 id="favorito">Innovación al alcance de tu vida</h4>
        <div id="image"><img src="../images/Logo.jpg" width="400" height="200" alt="Logo de ElectroTech"/></div>
    </header>

    <nav>
        <a href="#" onclick="window.history.back(); return false;">Volver atrás</a>
        <a href="Menu.jsp">Menú</a>
        <a href="../CerrarSesion.jsp">Cerrar Sesión</a>
    </nav>

    <div class="agrupar">
        <section>
            <div class="container mt-5">
                <div class="row justify-content-center">
                    <div class="col-md-8 col-lg-6">
                        <div class="card text-center border-success">
                            <div class="card-header bg-success text-white">
                                <h2 class="h4 mb-0"><i class="bi bi-check-circle-fill"></i> ¡Producto agregado al carrito!</h2>
                            </div>
                            <div class="card-body">
                                <div class="alert alert-success" role="alert">
                                    <p class="mb-0">Has agregado <strong><%= cantidad %></strong> unidad(es) de <strong>"<%= nombreProducto %>"</strong> a tu carrito.</p>
                                </div>
                                <div class="d-flex justify-content-center gap-3 mt-4">
                                    <a href="mostrarProductos.jsp" class="btn btn-outline-primary">
                                        <i class="bi bi-arrow-left"></i> Seguir comprando
                                    </a>
                                    <a href="carrito.jsp" class="btn btn-primary">
                                        <i class="bi bi-cart-check"></i> Ver carrito
                                    </a>
                                </div>
                            </div>
                            <div class="card-footer text-muted">
                                <small>¿Necesitas ayuda? <a href="#">Contáctanos</a></small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <aside>
            <a href="https://www.linkedin.com/in/ariel-flores-dev/">Ver más información sobre los desarrolladores</a><br>
            <iframe src="https://maps.google.com/maps?q=ElectroTech%20Quito&t=&z=13&ie=UTF8&iwloc=&output=embed" width="600" height="440"></iframe>
        </aside>
    </div>

    <footer>
        <ul>
            <li><a href="https://www.facebook.com/arielfloresdev" target="_blank">
                <img src="../icons/facebook.png" width="30" height="30" alt="icono de facebook"/></a></li>
            <li><a href="https://www.instagram.com/arielflores.dev/" target="_blank">
                <img src="../icons/instagram.png" width="30" height="30" alt="icono de instagram"/></a></li>
            <li><a href="https://www.tiktok.com/@arielflores.dev" target="_blank">
                <img src="../icons/tik-tok.png" width="30" height="30" alt="icono de tiktok"/></a></li>
        </ul>
        <iframe src="https://www.google.com/maps/d/embed?mid=1xMQyjGfhXwePEC61-YUKyv70md9LVFw&ehbc=2E312F" 
                width="100%" height="320" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
    </footer>
</main>
</body>
</html>
