<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.productos.negocio.*, java.text.*, java.util.*"%>
<%
    Carrito carrito = (Carrito) session.getAttribute("carrito");
    if (carrito == null || carrito.getItems().isEmpty()) {
        response.sendRedirect("carrito.jsp");
        return;
    }
    
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        Compra nuevaCompra = new Compra();
        nuevaCompra.setItems(new ArrayList<>(carrito.getItems()));
        nuevaCompra.setTotal(carrito.getTotal());
        nuevaCompra.setEstado("Completada");
        
        Producto producto = new Producto();
        for (ItemCarrito item : carrito.getItems()) {
            producto.actualizarStock(item.getProducto().getId(), item.getCantidad());
        }
        
        List<Compra> historial = (List<Compra>) session.getAttribute("historialCompras");
        if (historial == null) {
            historial = new ArrayList<>();
        }
        historial.add(nuevaCompra);
        session.setAttribute("historialCompras", historial);
        
        session.removeAttribute("carrito");
        response.sendRedirect("confirmacion.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>A-Technology - Finalizar Compra</title>
    <!-- Tu hoja de estilos personalizada -->
    <link href="css/est2.css" rel="stylesheet" type="text/css">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" 
          integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
</head>
<body>
    <main>
        <header>
            <h1>Activo Sportwear</h1>
            <h2 class="destacado">Te vendemos lo mejor</h2>
            <h4 id="favorito">Lo mejor a menos precio</h4>
            <div id="image">
                <img src="iconos/Logo1.jpg" width="400" height="200" alt="Logo de Activo Sportwear"/>
            </div>
        </header>
        
        <nav>
            <a href="#" onclick="window.history.back(); return false;">Volver atrás</a>
            <a href="Menu.jsp">Menú</a>
            <a href="../CerrarSesion.jsp">Cerrar Sesión</a>
        </nav>
        
        <div class="agrupar">
            <h2>Finalizar Compra - Activo Sportwear</h2>
            <h3>Resumen de tu pedido</h3>
            
            <div class="container mt-4">
                <div class="row">
                    <div class="col-md-8">
                        <div class="card mb-4">
                            <div class="card-header bg-light">
                                <h3 class="h5 mb-0">Resumen de Compra - Activo Sportwear</h3>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead class="table-light">
                                            <tr>
                                                <th>Producto</th>
                                                <th class="text-center">Cantidad</th>
                                                <th class="text-end">Precio Unitario</th>
                                                <th class="text-end">Subtotal</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% for (ItemCarrito item : carrito.getItems()) { %>
                                            <tr>
                                                <td><%= item.getProducto().getNombre() %></td>
                                                <td class="text-center"><%= item.getCantidad() %></td>
                                                <td class="text-end">$<%= String.format("%.2f", item.getProducto().getPrecio()) %></td>
                                                <td class="text-end">$<%= String.format("%.2f", item.getProducto().getPrecio() * item.getCantidad()) %></td>
                                            </tr>
                                            <% } %>
                                            <tr class="table-active">
                                                <td colspan="3" class="text-end"><strong>Total:</strong></td>
                                                <td class="text-end"><strong>$<%= String.format("%.2f", carrito.getTotal()) %></strong></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-header bg-primary text-white">
                                <h3 class="h5 mb-0">Información de Pago - Activo Sportwear</h3>
                            </div>
                            <div class="card-body">
                                <form method="post" id="formPago" onsubmit="return validarFormulario()">
                                    <div class="mb-3">
                                        <label for="nombreTarjeta" class="form-label">Nombre en la Tarjeta</label>
                                        <input type="text" class="form-control" id="nombreTarjeta" name="nombreTarjeta" required>
                                    </div>
                                    
                                    <div class="mb-3">
                                        <label for="numeroTarjeta" class="form-label">Número de Tarjeta</label>
                                        <input type="text" class="form-control" id="numeroTarjeta" name="numeroTarjeta" 
                                               pattern="[0-9]{16}" title="Debe contener exactamente 16 dígitos" required>
                                        <small class="text-muted">16 dígitos sin espacios</small>
                                        <div class="invalid-feedback">Por favor ingrese un número de tarjeta válido (16 dígitos)</div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label for="fechaExpiracion" class="form-label">Expiración (MM/AA)</label>
                                            <input type="text" class="form-control" id="fechaExpiracion" name="fechaExpiracion" 
                                                   placeholder="MM/AA" pattern="(0[1-9]|1[0-2])\/?([0-9]{2})" 
                                                   title="Formato MM/AA" required>
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label for="cvv" class="form-label">CVV</label>
                                            <input type="text" class="form-control" id="cvv" name="cvv" 
                                                   pattern="[0-9]{3}" title="Debe contener exactamente 3 dígitos" required>
                                            <div class="invalid-feedback">El CVV debe tener 3 dígitos</div>
                                        </div>
                                    </div>
                                    
                                    <div class="d-grid">
                                        <button type="submit" class="btn btn-success btn-lg">
                                            <i class="bi bi-credit-card"></i> Confirmar Pago
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <script>
            function validarFormulario() {
                const form = document.getElementById('formPago');
                const numeroTarjeta = document.getElementById('numeroTarjeta');
                const cvv = document.getElementById('cvv');
                const fechaExpiracion = document.getElementById('fechaExpiracion');
                
                const tarjetaValida = /^\d{16}$/.test(numeroTarjeta.value);
                if (!tarjetaValida) {
                    numeroTarjeta.classList.add('is-invalid');
                } else {
                    numeroTarjeta.classList.remove('is-invalid');
                }
                
                const cvvValido = /^\d{3}$/.test(cvv.value);
                if (!cvvValido) {
                    cvv.classList.add('is-invalid');
                } else {
                    cvv.classList.remove('is-invalid');
                }
                
                const fechaValida = /^(0[1-9]|1[0-2])\/?([0-9]{2})$/.test(fechaExpiracion.value);
                if (!fechaValida) {
                    fechaExpiracion.classList.add('is-invalid');
                } else {
                    fechaExpiracion.classList.remove('is-invalid');
                }
                
                if (!tarjetaValida || !cvvValido || !fechaValida) {
                    return false;
                }
                
                return true;
            }
            
            document.getElementById('numeroTarjeta').addEventListener('input', function(e) {
                this.value = this.value.replace(/\D/g, '').substring(0, 16);
                if (/^\d{16}$/.test(this.value)) {
                    this.classList.remove('is-invalid');
                }
            });
            
            document.getElementById('cvv').addEventListener('input', function(e) {
                this.value = this.value.replace(/\D/g, '').substring(0, 3);
                if (/^\d{3}$/.test(this.value)) {
                    this.classList.remove('is-invalid');
                }
            });
            </script>
        </div>
    </main>
    <footer class="text-center p-4 bg-dark text-light">
        <h3>A-Technology </h3>
        <div>
            <a href="https://www.facebook.com" target="_blank" class="text-light mx-2">Facebook</a>
            <a href="https://www.instagram.com" target="_blank" class="text-light mx-2">Instagram</a>
            <a href="https://twitter.com" target="_blank" class="text-light mx-2">Twitter</a>
        </div>
        <div id="ubicacion" class="mt-3">
            <iframe src="https://www.google.com/maps/d/embed?mid=1xMQyjGfhXwePEC61-YUKyv70md9LVFw&ehbc=2E312F" 
                width="100%" height="320" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
        </div>
        <p>© 2025 A-Technology. Todos los derechos reservados.</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-HoAyt5ZqZ7PaW7b2KkQqjrX8TQxQAi7J5WyF0TPj3YIpmiFYwA60hb8R6zGdiXrt" crossorigin="anonymous"></script>
</body>
</html>
