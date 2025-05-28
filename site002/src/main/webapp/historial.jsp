<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.productos.negocio.*, java.util.*, java.text.*" %>
<%
    List<Compra> historial = (List<Compra>) session.getAttribute("historialCompras");
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ElectroTech</title>
    <link href="css/est2.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
</head>
<body>
    <main>
        <header>
            <h1>ElectroTech</h1>
            <h2 class="destacado">Tecnología que enciende tu mundo</h2>
            <h4 id="favorito">Conectando innovación y calidad</h4>
            <div id="image"><img src="../images/Logo.jpg" width="400" height="200" alt="Logo de ElectroTech"/></div>
        </header>
        
        <nav>
            <a href="#" onclick="window.history.back(); return false;">Volver atrás</a>
            <a href="Menu.jsp">Menú</a>
            <a href="../CerrarSesion.jsp">Cerrar Sesión</a>
        </nav>
        
        <div class="agrupar">
            <section> 
                <div class="container mt-4">
                    <div class="card shadow">
                        <div class="card-header bg-primary text-white">
                            <h2 class="h4 mb-0">Historial de Compras</h2>
                        </div>
                        
                        <div class="card-body">
                            <% if (historial == null || historial.isEmpty()) { %>
                                <div class="text-center py-5">
                                    <i class="bi bi-cart-x text-muted" style="font-size: 3rem;"></i>
                                    <h3 class="h5 mt-3">No has realizado ninguna compra aún</h3>
                                    <p class="text-muted">Comienza a explorar nuestros productos</p>
                                    <a href="consulta.jsp" class="btn btn-primary">
                                        <i class="bi bi-shop"></i> Ir a la tienda
                                    </a>
                                </div>
                            <% } else { %>
                                <div class="accordion" id="historialAccordion">
                                    <% for (int i = 0; i < historial.size(); i++) { 
                                        Compra compra = historial.get(i); 
                                    %>
                                    <div class="accordion-item mb-3 border">
                                        <h2 class="accordion-header" id="heading<%= i %>">
                                            <button class="accordion-button collapsed" type="button" 
                                                    data-bs-toggle="collapse" data-bs-target="#collapse<%= i %>" 
                                                    aria-expanded="false" aria-controls="collapse<%= i %>">
                                                <div class="d-flex justify-content-between w-100">
                                                    <span>
                                                        <i class="bi bi-receipt"></i> Compra #<%= i+1 %>
                                                    </span>
                                                    <span class="badge <%= compra.getEstado().equals("Completado") ? "bg-success" : "bg-warning text-dark" %>">
                                                        <%= compra.getEstado() %>
                                                    </span>
                                                </div>
                                            </button>
                                        </h2>
                                        <div id="collapse<%= i %>" class="accordion-collapse collapse" 
                                             aria-labelledby="heading<%= i %>" data-bs-parent="#historialAccordion">
                                            <div class="accordion-body">
                                                <div class="d-flex justify-content-between mb-3">
                                                    <div>
                                                        <strong>Fecha:</strong> <%= sdf.format(compra.getFecha()) %>
                                                    </div>
                                                    <div>
                                                        <strong>Total:</strong> $<%= String.format("%.2f", compra.getTotal()) %>
                                                    </div>
                                                </div>
                                                
                                                <div class="table-responsive">
                                                    <table class="table table-sm">
                                                        <thead class="table-light">
                                                            <tr>
                                                                <th>Producto</th>
                                                                <th class="text-end">Precio Unitario</th>
                                                                <th class="text-center">Cantidad</th>
                                                                <th class="text-end">Subtotal</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <% for (ItemCarrito item : compra.getItems()) { %>
                                                            <tr>
                                                                <td><%= item.getProducto().getNombre() %></td>
                                                                <td class="text-end">$<%= String.format("%.2f", item.getProducto().getPrecio()) %></td>
                                                                <td class="text-center"><%= item.getCantidad() %></td>
                                                                <td class="text-end">$<%= String.format("%.2f", item.getProducto().getPrecio() * item.getCantidad()) %></td>
                                                            </tr>
                                                            <% } %>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <% } %>
                                </div>
                                
                                <div class="mt-4 text-center">
                                    <a href="consulta.jsp" class="btn btn-outline-primary">
                                        <i class="bi bi-arrow-left"></i> Volver a la tienda
                                    </a>
                                </div>
                            <% } %>
                        </div>
                    </div>
                </div>
            </section>

            <aside>
                <a href="https://www.linkedin.com/in/ariel-flores-766b7b35a/" ">Ver más información sobre los desarrolladores</a></br>
                <iframe src="https://www.google.com/maps/d/embed?mid=1EfbeRnJknOZ-F_WdFwZqUiwD3gqtczo&ehbc=2E312F" width="600" height="440"></iframe>
            </aside>
        </div>
        
        <footer>
            <ul>
                <li><a href="https://www.facebook.com" target="_blank">
                    <img src="iconOs/facebook.png" width="30" height="30" alt="icono de facebook"/></a></li>
                <li><a href="https://www.instagram.com" target="_blank">
                    <img src="iconOs/instagram.png" width="30" height="30" alt="icono de instagram"/></a></li>
                <li><a href="https://www.tiktok.com" target="_blank">
                    <img src="iconos/tiktok.png" width="30" height="30" alt="icono de tiktok"/></a></li>
            </ul>
            <iframe src="https://www.google.com/maps/d/embed?mid=1xMQyjGfhXwePEC61-YUKyv70md9LVFw&ehbc=2E312F" 
                width="100%" height="320" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
        </footer>
    </main>
</body>
</html>
