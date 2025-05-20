<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.productos.negocio.*,com.productos.datos.*" %>
<%
    String nombreProducto = request.getParameter("txtNombre");
    String categoria = request.getParameter("cmbCategoria");
    String cantidadStr = request.getParameter("txtCantidad");
    String precioStr = request.getParameter("txtPrecio");
    String foto = request.getParameter("fileFoto");
    
    // Si el formulario ha sido enviado, puedes procesar los datos aquí
    if (nombreProducto != null && !nombreProducto.isEmpty()) {
        int cantidad = Integer.parseInt(cantidadStr);
        double precio = Double.parseDouble(precioStr);
        
        // Aquí puedes realizar la inserción en la base de datos si es necesario
        Conexion con = new Conexion();
        String sql = "INSERT INTO tb_producto (nombre, categoria, cantidad, precio, foto) VALUES ('" + nombreProducto + "', '" + categoria + "', " + cantidad + ", " + precio + ", '" + foto + "')";
        String resultado = con.Ejecutar(sql);
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Productos</title>
    <link rel="stylesheet" href="css/estilos.css">
</head>
<body>
    <div class="form-container">
        <h2 class="destacado">Gestionar Producto</h2>
        
        <!-- Formulario para agregar un producto -->
        <form action="gestionProducto.jsp" method="POST" enctype="multipart/form-data">
            <div class="input-group">
                <label for="txtNombre">Nombre del Producto:</label>
                <input type="text" id="txtNombre" name="txtNombre" required>
            </div>
            <div>
             <label for="cmbCategoria">Seleccione una categoría:</label>
                <%
            Categoria cat=new Categoria();
            out.print(cat.mostrarCategoria());
        		%>
            
            </div>

            <div class="input-group">
                <label for="txtCantidad">Cantidad:</label>
                <input type="number" id="txtCantidad" name="txtCantidad" required>
            </div>
            
            <div class="input-group">
                <label for="txtPrecio">Precio:</label>
                <input type="number" id="txtPrecio" name="txtPrecio" step="0.01" required>
            </div>
            
            <div class="input-group">
                <label for="fileFoto">Foto del Producto:</label>
                <input type="file" id="fileFoto" name="fileFoto" accept="image/*">
            </div>
            
            <button type="submit" class="btn-enviar">Enviar</button>
            <button type="reset" class="btn-borrar">Borrar</button>
        </form>
    </div>
</body>
</html>




