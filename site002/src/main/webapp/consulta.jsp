<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.productos.negocio.*" %>
<%
    Producto producto = new Producto();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Activo Sportwear</title>
    <link href="css/est2.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
</head>
<body>
    <main>
        <header>
            <h1>Activo Sportwear</h1>
            <h2 class="destacado">Moda deportiva para tu mejor versión</h2>
            <h4 id="favorito">Rinde más, luce mejor</h4>
            <div id="image"><img src="../images/Logo.jpg" width="400" height="200" alt="Logo de Activo Sportwear"/></div>
        </header>
        
        <nav>
            <a href="#" onclick="window.history.back(); return false;">Volver atrás</a>
            <a href="Menu.jsp">Menú</a>
            <a href="../CerrarSesion.jsp">Cerrar Sesion</a>
        </nav>
        
        <div class="agrupar">
            <section> 
			    <div class="container mt-4">
				    <div class="card shadow">
				        <div class="card-header bg-primary text-white">
				            <h1 class="h4 mb-0">Productos Disponibles</h1>
				        </div>
				        
				        <div class="card-body">
				            <!-- Tabla de productos (generada por producto.consultarTodo()) -->
				            <%= producto.consultarTodo() %>
				            
				            <div class="card mt-4">
				                <div class="card-header bg-light">
				                    <h2 class="h5 mb-0">Agregar al Carrito</h2>
				                </div>
				                <div class="card-body">
				                    <form action="carrito.jsp" method="post" class="row g-3">
				                        <input type="hidden" name="action" value="add">
				                        
				                        <div class="col-md-6">
				                            <label for="idProducto" class="form-label">ID del Producto</label>
				                            <input type="number" class="form-control" id="idProducto" name="id" min="1" required>
				                        </div>
				                        
				                        <div class="col-md-6">
				                            <label for="cantidad" class="form-label">Cantidad</label>
				                            <input type="number" class="form-control" id="cantidad" name="cantidad" min="1" value="1" required>
				                        </div>
				                        
				                        <div class="col-12">
				                            <button type="submit" class="btn btn-success">
				                                <i class="bi bi-cart-plus"></i> Agregar al Carrito
				                            </button>
				                        </div>
				                    </form>
				                </div>
				            </div>
				            
				            <div class="d-flex justify-content-between mt-4">
				                <a href="carrito.jsp" class="btn btn-outline-primary">
				                    <i class="bi bi-cart"></i> Ver Carrito
				                </a>
				                <a href="historial.jsp" class="btn btn-outline-secondary">
				                    <i class="bi bi-clock-history"></i> Ver Historial de Compras
				                </a>
				            </div>
				        </div>
				    </div>
				</div>
			</section>

            <aside>
                <a href="https://www.linkedin.com/in/steven-parra-02516b32b">Ver más información sobre los desarrolladores</a></br>
                <iframe src="https://www.google.com/maps/d/embed?mid=1EfbeRnJknOZ-F_WdFwZqUiwD3gqtczo&ehbc=2E312F" width="600" height="440"></iframe>
            </aside>
        </div>
        
        <footer>
            <ul>
                <li><a href="https://www.facebook.com" target="_blank">
                    <img src="icons/faceb.png" width="30" height="30" alt="icono de facebook"/></a></li>
                <li><a href="https://www.instagram.com" target="_blank">
                    <img src="icons/instagram.png" width="30" height="30" alt="icono de instagram"/></a></li>
                <li><a href="https://www.tiktok.com" target="_blank">
                    <img src="icons/tiktok.png" width="30" height="30" alt="icono de tiktok"/></a></li>
            </ul>
            <iframe src="https://www.google.com/maps/d/embed?mid=1xMQyjGfhXwePEC61-YUKyv70md9LVFw&ehbc=2E312F" 
                width="100%" height="320" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
        </footer>
    </main>
</body>
</html>