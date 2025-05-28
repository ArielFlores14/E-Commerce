<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.productos.negocio.*" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.productos.datos.*" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>A-Technology</title>
    <link href="css/est2.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <!-- Bootstrap Icons CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
    <main>
        <header>
            <h1>A-Technology</h1>
            <h2 class="destacado">Lo mejor en equipos electronicos</h2>
            <h4 id="favorito">Lo mejor al menos precio</h4>
            <div id="image">
                <img src="iconos/Logo1.png" width="400" height="200" alt="Logo de A-Technology"/>
            </div>
        </header>
        
        <nav>
            <a href="#" onclick="window.history.back(); return false;">Volver atrás</a>
            <a href="Menu.jsp">Menú</a>
            <a href="../CerrarSesion.jsp">Cerrar Sesión</a>
        </nav>
        
        <div class="agrupar">
            <h1>Nuestros Productos</h1>

            <div class="container-fluid mt-4">
                <div class="card shadow">
                    <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                        <h1 class="h4 mb-0">Nuestros Productos</h1>
                        <a href="carrito.jsp" class="btn btn-light btn-sm">
                            <i class="bi bi-cart"></i> Ver Carrito (
                            <%= session.getAttribute("carrito") != null ? ((Carrito)session.getAttribute("carrito")).getItems().size() : 0 %>)
                        </a>
                    </div>
                    
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-hover table-bordered">
                                <thead class="table-dark">
                                    <tr>
                                        <th>ID</th>
                                        <th>Nombre</th>
                                        <th>Precio</th>
                                        <th>Disponibles</th>
                                        <th>Cantidad</th>
                                        <th class="text-center">Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        String sql = "SELECT * FROM tb_producto ORDER BY id_pr ASC";
                                        Conexion con = new Conexion();
                                        ResultSet rs = con.Consulta(sql);
                                        while(rs.next()) {
                                            int id = rs.getInt("id_pr");
                                            String nombre = rs.getString("nombre_pr");
                                            int cantidad = rs.getInt("cantidad_pr");
                                            double precio = rs.getDouble("precio_pr");
                                    %>
                                    <tr>
                                        <td><%= id %></td>
                                        <td><%= nombre %></td>
                                        <td>$<%= String.format("%.2f", precio) %></td>
                                        <td><%= cantidad %></td>
                                        <td>
                                            <form action="agregarAlCarrito.jsp" method="post" class="d-flex align-items-center" id="form-<%= id %>">
                                                <input type="hidden" name="id" value="<%= id %>">
                                                <input type="hidden" name="nombre" value="<%= nombre %>">
                                                <input type="hidden" name="precio" value="<%= precio %>">
                                                <input type="number" name="cantidad" class="form-control form-control-sm" 
                                                       style="width: 80px;" min="1" max="<%= cantidad %>" value="1" required>
                                        </td>
                                        <td class="text-center">
                                                <button type="submit" class="btn btn-success btn-sm">
                                                    <i class="bi bi-cart-plus"></i> Agregar
                                                </button>
                                            </form>
                                        </td>
                                    </tr>
                                    <%
                                        }
                                        rs.close();
                                    %>
                                </tbody>
                            </table>
                        </div>
                        
                        <div class="mt-3 text-end">
                            <a href="carrito.jsp" class="btn btn-primary">
                                <i class="bi bi-cart-check"></i> Ver Carrito Completo
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <footer>
            <ul>
                <li><a href="https://www.facebook.com" target="_blank">
                    <img src="iconos/faceb.png" width="30" height="30" alt="icono de facebook"/></a></li>
                <li><a href="https://www.instagram.com" target="_blank">
                    <img src="iconos/instagram.png" width="30" height="30" alt="icono de instagram"/></a></li>
                <li><a href="https://www.tiktok.com" target="_blank">
                    <img src="iconos/tiktok.png" width="30" height="30" alt="icono de tiktok"/></a></li>
            </ul>
            <iframe src="https://www.google.com/maps/d/embed?mid=1xMQyjGfhXwePEC61-YUKyv70md9LVFw&ehbc=2E312F" 
                width="100%" height="320" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
        </footer>
    </main>
</body>
</html>
