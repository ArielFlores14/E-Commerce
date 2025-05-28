<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8" session="true" 
    import="com.productos.seguridad.*" 
    import="java.util.Date, java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Panel Principal - A-Technology</title>
    <link href="css/estilos.css" rel="stylesheet" type="text/css">
</head>
<body>
<main>
    <header>
        <div class="logo">
            <a href="index.jsp">
                <img src="iconos/Logo1.png" alt="Logo A-Technology" id="logo">
            </a>
        </div>
        <h1>A-Technology</h1>
        <h2 class="destacado">La mejor tecnología a tu alcance</h2>
        <h4 id="favorito">Donde la innovación cobra vida</h4>
    </header>

    <%
        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("usuario") == null) {
    %>
        <jsp:forward page="Login.jsp">
            <jsp:param name="error" value="Debe registrarse en el sistema." />
        </jsp:forward>
    <%
        } else {
            String usuario = (String) sesion.getAttribute("usuario");
            int perfil = (Integer) sesion.getAttribute("perfil");

            Date fechaInicio = (Date) sesion.getAttribute("fechaInicio");
            String fechaFormateada = "";
            if (fechaInicio != null) {
                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                fechaFormateada = sdf.format(fechaInicio);
            }

            String rol = "";
            switch (perfil) {
                case 1: rol = "ADMINISTRADOR: " + usuario + " | Sesión: " + fechaFormateada; break;
                case 2: rol = "CLIENTE: " + usuario + " | Sesión: " + fechaFormateada; break;
                case 3: rol = "VENDEDOR: " + usuario + " | Sesión: " + fechaFormateada; break;
                case 4: rol = "EMPLEADO: " + usuario + " | Sesión: " + fechaFormateada; break;
                default: rol = "USUARIO no identificado";
            }

            Pagina pag = new Pagina();
            String menu = pag.mostrarMenu(perfil);
    %>

    <!-- Menú generado desde Pagina.java -->
    <nav class="nav-blog">
        <%= menu %>
    </nav>

    <main class="contenido-blog">
        <section class="mision">
            <h2>Bienvenido, <%= usuario %></h2>
            <p style="font-weight: bold;"><%= rol %></p>
            <p>Has ingresado correctamente al sistema de administración de productos electrónicos.</p>
        </section>
    </main>

    <footer class="footer-blog">
        <ul>
            <li><a href="#">Contacto</a></li>
            <li><a href="#">Ayuda</a></li>
            <li><a href="#">Política de privacidad</a></li>
            <iframe src="https://www.google.com/maps/d/embed?mid=1xMQyjGfhXwePEC61-YUKyv70md9LVFw&ehbc=2E312F" 
                width="100%" height="320" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
        </ul>
        <p>&copy; 2025 A-Technology. Todos los derechos reservados.</p>
    </footer>
    

    <%
        } // Fin del else
    %>
</main>
</body>
</html>
