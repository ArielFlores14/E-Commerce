<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.productos.negocio.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Categorías</title>
    <link href="css/estilos.css" rel="stylesheet" type="text/css">
    
</head>
<body>
<div class="contenedor">
    <h1>Categorías de productos</h1>
    <form method="GET" action="">
        <%
            Categoria cat=new Categoria();
            out.print(cat.mostrarCategoria());
        %>
        <input type="submit" value="Filtrar productos">
    </form>

    <div>
        <%
            String categoriaSeleccionada = request.getParameter("cmbCategoria");
            Producto pr = new Producto();
            if (categoriaSeleccionada != null && !categoriaSeleccionada.isEmpty()) {
                out.print(pr.buscarProductoCategoria(Integer.parseInt(categoriaSeleccionada)));
            } else {
                out.print(pr.consultarTodo());
            }
        %>
    </div>
</div>
</body>
</html>
