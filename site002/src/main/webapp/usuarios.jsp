<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.productos.negocio.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registro</title>
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
 <a class="active" href="index.jsp">Inicio</a>
  <a href="bitacora.jsp">Bitacora</a>
 <a href="usuarios.jsp">Agregar Usuario</a>
 <a href="Cerrarsesion.jsp">Cerrar Sesion</a>
 </nav>
<body>
<h4> Registro Nuevo Empleado o Administrador</h4>
<div class="agrupar">
<form action="respuestaAoE.jsp" method="post">
<table border="1">
<tr><td>Nombre</td> <td><input type="text" name="txtNombre" required/>*Campo obligatorio</td></tr>
<tr><td>Cédula</td> <td><input type="text" name="txtCedula" maxlength="10" required/>*Campo obligatorio</td></tr>


<tr><td>Tipo Empleado</td><td><select name="cmbTperfil">
<option value="Administrador">Administrador</option>
<option value="Empleado">Empleado</option>
<option value="Vendedor">Vendedor</option>
</select></td></tr>

<tr><td>Estado Civil</td><td><select name="cmbECivil">
<option value="Soltero">Soltero</option>
<option value="Casado">Casado</option>
<option value="Divorciado">Divorciado</option>
<option value="Viudo">Viudo</option>
</select></td></tr>
<tr><td>Correo</td><td> <input type="email" name="txtCorreo" placeholder="usuario@nombreProveedor.dominio" required/>*Campo obligatorio</td></tr>

<tr>
<td><input type="submit" name="btnEnviar" id="btnEnviar" value="Enviar Registro"/></td>
<td><input type="reset" /></td>
</tr>
</table>
<button type="button" onclick="location.href='index.jsp'">← Regresar</button>
</form>
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
</body>
</html>