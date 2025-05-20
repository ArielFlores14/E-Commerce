<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true" import="com.productos.seguridad.*"%>
<%
    String usuario;
    HttpSession sesion = request.getSession();
    if (sesion.getAttribute("usuario") == null) {
%>
    <jsp:forward page="login.jsp">
        <jsp:param name="error" value="Debe registrarse en el sistema."/>
    </jsp:forward>
<%
    } else {
        usuario = (String) sesion.getAttribute("usuario");
        int perfil = (Integer) sesion.getAttribute("perfil");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Menú Principal</title>
    <link href="css/estilos.css" rel="stylesheet" type="text/css">
</head>
<body>
    <header class="header-blog">
        <h1 class="titulo">Bienvenido al Panel de Productos</h1>
    </header>

    <nav class="nav-blog">
            <%
                Pagina pag = new Pagina();
                String menu = pag.mostrarMenu(perfil);
                out.print(menu);
            %>
    </nav>

    <main class="contenido-blog">
        <section class="mision">
            <h2>Bienvenido, <%= usuario %></h2>
            <p>Has iniciado sesión correctamente.</p>

        </section>
    </main>

    <footer class="footer-blog">
        <ul>
            <li><a href="#">Contacto</a></li>
            <li><a href="#">Ayuda</a></li>
            <li><a href="#">Política de privacidad</a></li>
        </ul>
        <p style="color:white;">&copy; 2025 ARES PHARMACY</p>
    </footer>
</body>
</html>
<%
    }
%>