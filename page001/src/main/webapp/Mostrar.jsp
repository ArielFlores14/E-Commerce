<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8" import="com.productos.negocio.*,com.productos.seguridad.*"%>
<%
    String nombre=request.getParameter("txtNombre");
    String cedula=request.getParameter("txtCedula");
    String correo=request.getParameter("txtCorreo");
    String contrasena="654321";
    String estadoCivil=request.getParameter("cmbECivil");
    int estadoCivilen=Integer.parseInt(request.getParameter("cmbECivil"));
    int id_per=Integer.parseInt(request.getParameter("cmbPerfil"));
    ConexionUsuario con=new ConexionUsuario();
    String sql = "INSERT INTO tb_usuario (id_per, id_est, nombre_us, cedula_us, correo_us, clave_us) " +
            "VALUES ("+ id_per + ","+estadoCivil+",'"+nombre+"','"+cedula+"','"+correo+"','"+contrasena+"')";
    System.out.println(sql);
    
    String resultado=con.Ejecutar(sql);
    String estadoTexto;
    switch(estadoCivilen) {
        case 1: estadoTexto = "Soltero"; break;
        case 2: estadoTexto = "Casado"; break;
        case 3: estadoTexto = "Divorciado"; break;
        case 4: estadoTexto = "Unión Libre"; break;
        default: estadoTexto = "Desconocido";
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Resumen del Registro</title>
    <link rel="stylesheet" href="css/estilos.css">
</head>
<body>
    <div class="respuesta-container fade-in">
        <div class="respuesta-card">
            <h2>✅ Registro Exitoso</h2>
            <p><strong>👤 Nombre:</strong> <%= request.getParameter("txtNombre") %></p>
            <p><strong>🪪 Cédula:</strong> <%= request.getParameter("txtCedula") %></p>
            <p><strong>📧 Correo:</strong> <%= request.getParameter("txtCorreo") %></p>
			<p><strong>💍 Estado Civil:</strong> <%= estadoTexto %></p>
			
            <a href="Adminusers.jsp" class="btn-volver">🔙 Volver al menu</a>
        </div>
    </div>
</body>
</html>
