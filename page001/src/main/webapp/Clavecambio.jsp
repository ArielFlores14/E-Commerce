<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="com.productos.seguridad.*"
    pageEncoding="ISO-8859-1" session="true"%> 
 <head>
     <link href="css/estilos.css" rel="stylesheet" type="text/css">
 </head>
<% 
    String usuario; 
    String pwd;
    HttpSession sesion = request.getSession(); 
    if (sesion.getAttribute("usuario") == null)   //Se verifica si existe la variable      
    { 
     %> 
     <jsp:forward page="Login.jsp"> 
     <jsp:param name="error" value="Debe registrarse en el sistema."/> 
     </jsp:forward> 
     <% 
    } 
    else 
    { 
    usuario=(String)sesion.getAttribute("usuario"); //Se devuelve los valores de atributos 
    int perfil=(Integer)sesion.getAttribute("perfil"); 
    %> 
 <main>
        <header>
            <h1 class="titulo">E-Technology</h1>
            <h2 class="destacado">Venta de todo tipo de dispositivos electronicos</h2>
            <h4 id="favorito">Siempre vendemos lo mejor a menor precio</h4>
        </header>
        <nav>
            <% 
            Pagina pag = new Pagina(); 
            String menu = pag.mostrarMenu(perfil); 
            out.print(menu); 
            %>
        </nav>
        <div class="contenedor">
            <section class="form-contenedor">
                <h2 class="subtitulo">Cambio de clave</h2>
                <form action="" method="post">
                    <div class="form-group">
                        <label for="clave_a">Clave anterior:</label>
                        <input type="password" id="clave_a" name="clave_a" required>
                    </div>
                    <div class="form-group">
                        <label for="clave_n">Clave nueva:</label>
                        <input type="password" id="clave_n" name="clave_n" required>
                    </div>
                    <div class="form-group">
                        <label for="clave_nn">Repetir clave</label>
                        <input type="password" id="clave_nn" name="clave_nn" required>
                    </div>
                    <div class="form-buttons">
                        <button type="submit" id="btnEnviar">Registrar</button>
                        <button type="reset">Limpiar</button>
                    </div>
                    <%
                        // Extraer los datos
                        usuario = (String) sesion.getAttribute("usuario");
                        pwd = (String) sesion.getAttribute("contrasena");
                        String old_password = request.getParameter("clave_a");
                        String new_password = request.getParameter("clave_n");
                        String nn_password = request.getParameter("clave_nn");
                        String mensaje = "";

                        if (old_password != null && new_password != null && nn_password != null) {
                            Usuario user = new Usuario();
                            if (old_password.equals(pwd)) {
                                if (new_password.equals(nn_password)) {
                                    mensaje = user.cambioClave(new_password, usuario);
                                    // Opcional: actualizar la contraseña en sesión
                                    session.setAttribute("contrasena", new_password);
                                } else {
                                    mensaje = "Las claves nuevas no coinciden.";
                                }
                            } else {
                                mensaje = "La clave anterior no es correcta.";
                            }
                        }
                    %>
                    <% if (!mensaje.equals("")) { %>
                        <div class="mensaje">
                            <p><%= mensaje %></p>
                        </div>
                    <% } %>
                </form>
            </section>

        </div>

        <footer>
            <ul>
                <li><a href="https://www.facebook.com" target="_blank" rel="noopener noreferrer">
                    <img src="Iconos/faceb.png" width="40" height="40" alt="Facebook"/>
                </a></li>
                <li><a href="https://www.instagram.com" target="_blank" rel="noopener noreferrer">
                    <img src="Iconos/instagram.png" width="40" height="40" alt="Instagram"/>
                </a></li>
                <li><a href="https://www.tiktok.com" target="_blank" rel="noopener noreferrer">
                    <img src="Iconos/tiktok.png" width="40" height="40" alt="TikTok"/>
                </a></li>
            </ul>
        </footer>
    </main>
<%}%>
