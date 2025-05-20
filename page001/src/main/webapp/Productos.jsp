<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.productos.negocio.*"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Productos - A-Technology</title>
    <link href="css/estilos.css" rel="stylesheet" type="text/css"> <!-- Mantienes tu hoja de estilos -->
</head>
<body>

<header>
    <h1>A-Technology</h1>
    <h2 class="destacado">Encuentra los mejores productos electrónicos</h2>
</header>

<main>
    <div class="contenedor">
        <h2>Nuestros Productos</h2>

        <div class="product-list">
            <% 
                Producto pr = new Producto();
                String tablaProductos = pr.consultarTodo();  
                out.print(tablaProductos);  
            %>
        </div>
    </div>
</main>

<footer>
    <p>&copy; 2025 A-Technology. Todos los derechos reservados.</p>
</footer>

</body>
</html>
