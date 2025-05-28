<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true" import="com.productos.seguridad.Usuario" import="java.util.Date"%>
<%
    // Obtener los parámetros del formulario de login
   

    // Crear una instancia de Usuario
    Usuario user = new Usuario();
	String nombre = request.getParameter("nombre");
	String correo = request.getParameter("usuario");
	String clave = request.getParameter("clave");
	HttpSession sesion = request.getSession();

    // Verificar las credenciales
    boolean validUser = user.verificarUsuario(correo, clave);

    if (validUser) {
        // Si el usuario es válido, guardar en la sesión
        
        sesion.setAttribute("usuario", user.getNombre());
        sesion.setAttribute("perfil", user.getPerfil());
        sesion.setAttribute("correo", user.getCorreo());
        Date fechaInicio = new Date();
        sesion.setAttribute("fechaInicio", fechaInicio);

        // Redirigir a la página principal (o al menú)
        response.sendRedirect("Menu.jsp");
    } else {
        // Si no es válido, redirigir al login con un mensaje de error
        request.setAttribute("error", "Datos incorrectos. Vuelva a intentarlo.");
        request.getRequestDispatcher("Login.jsp").forward(request, response);
    }
%>


