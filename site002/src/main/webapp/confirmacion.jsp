<%@ page import="com.productos.seguridad.Usuario" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Confirmación de cambio de clave</title>
    <link href="css/estilos.css" rel="stylesheet" type="text/css">
</head>
<header>
 <div class="logo">
 <a href="index.jsp">
 <img src="imagenes/logo.png" alt="Logo Musica Pilliza" id="logo">
 </a>
 </div>
 <h1>La Casa del Músico</h1>
 <h2 class="destacado">Instrumentos musicales de alta calidad</h2>
 <h4 id="favorito">Lo mejor de la música es cuando la creas</h4>
 </header>
 <nav>
 <a class="active" href="consulta.jsp">Productos</a>
 <a href="cambiarclave.jsp">cambiarclave</a>
 <a href="Cerrarsesion.jsp">cerrar sesion</a>
 </nav>
<body>
<%
    String claveAnterior = request.getParameter("txtClaveA");
    String claveNueva = request.getParameter("txtClaveN");
    String claveRepetir = request.getParameter("txtClaveR");

    String correo = (String) session.getAttribute("correo");

    Usuario user = new Usuario();
    String mensaje;
    
    out.println("Correo en sesión: " + correo + "<br>");
    // Paso crítico: cargar el usuario desde la base
    boolean usuarioExiste = user.verificarUsuario(correo, claveAnterior);
    
   
    
    if (!usuarioExiste) {
%>
        mensaje = <strong>Clave anterior no es correcta</strong>
<%
    } else if (!user.coincidirClave(claveNueva, claveRepetir)) {
%>
       				 <strong>Las claves nuevas no coinciden</strong>
<%
    } else {
        boolean cambiada = user.cambiarClave(correo, claveNueva);
        if (cambiada) {
%>
            <strong>Clave cambiada exitosamente</strong>
<%
        } else {
%>
            <strong>Error al cambiar la clave</strong>
<%
        }
    }
%>


<button onclick="location.href='index.jsp'">Volver al inicio</button>
</body>
</html>
