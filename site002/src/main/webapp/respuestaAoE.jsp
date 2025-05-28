<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.productos.seguridad.*,com.productos.negocio.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Respuesta - Registro</title>
    <link href="css/estilos.css?v=2" rel="stylesheet" type="text/css">
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
 <a class="active" href="Productos.jsp">Productos</a>
 <a href="Categoria.jsp">Buscar Por Categoría</a>
 <a href="Login.jsp">Login</a>
 </nav>
<body>
<main>
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
        <a href="categoria.jsp">Buscar Por Categoría</a>
        <a href="login.jsp">Login</a>
    </nav>

    <div class="agrupar">
        <section>
            <h3>Resultado del Registro</h3>

            <%
                String nombre = request.getParameter("txtNombre");
                String cedula = request.getParameter("txtCedula");
                String correo = request.getParameter("txtCorreo");
                String tipoPerfil = request.getParameter("cmbTperfil"); // "Administrador" o "Empleado"
                String ecivil = request.getParameter("cmbECivil");

                int estadoCivil = 0;
                switch(ecivil) {
                    case "Casado": estadoCivil = 1; break;
                    case "Soltero": estadoCivil = 2; break;
                    case "Divorciado": estadoCivil = 3; break;
                    case "Viudo": estadoCivil = 4; break;
                }

                int idPerfil = 4; // Valor por defecto: Empleado
                if ("Administrador".equalsIgnoreCase(tipoPerfil)) {
                    idPerfil = 1;
                }else if ("Vendedor".equalsIgnoreCase(tipoPerfil)){
                	 idPerfil = 3;
                }

                Usuario user = new Usuario();
                user.setPerfil(idPerfil);
                user.setNombre(nombre);
                user.setCedula(cedula);
                user.setCorreo(correo);
                user.setEstadoCivil(estadoCivil);
                user.setClave("654321"); // Clave fija como solicitaste

                String resultado = user.ingresarEmpleadoOAdministrador(tipoPerfil); // método que tú creaste
            %>

            <strong><%= resultado %></strong>

            <h3>Datos Ingresados</h3>
            <ul>
                <li>Nombre: <%= nombre %></li>
                <li>Cédula: <%= cedula %></li>
                <li>Estado civil: <%= ecivil %></li>
                <li>Tipo de perfil: <%= tipoPerfil %></li>
                <li>Correo electrónico: <%= correo %></li>
                <li>Clave fija: 654321</li>
            </ul>

            <button onclick="location.href='login.jsp'">← Volver al login</button>
        </section>

        <aside>
            <a href="https://www.linkedin.com/in/anthony-pilliza-1b844335b/" target="_blank">Ver más información sobre los desarrolladores</a>
            <iframe src="https://www.google.com/maps/d/embed?mid=1xMQyjGfhXwePEC61-YUKyv70md9LVFw&ehbc=2E312F" 
                width="100%" height="320" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
        </aside>
    </div>

    <footer>
        <ul>
            <li><a href="https://www.facebook.com">
                <img src="iconos/faceb.png" alt="imagen facebook" height="30" width="30"/></a></li>
            <li><a href="https://www.instagram.com/">
                <img src="iconos/instagram.png" alt="imagen instagram" height="30" width="30"/></a></li>
            <li><a href="https://www.tiktok.com">
                <img src="iconos/tiktok.png" alt="imagen tiktok" height="30" width="30"/></a></li>
        </ul>
    </footer>
</main>
</body>
</html>
