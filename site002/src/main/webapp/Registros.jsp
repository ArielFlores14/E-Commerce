<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.productos.negocio.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registro</title>
<link href="css/est2.css?v=2" rel="stylesheet" type="text/css">
</head>
<body>
<h1> Registro Nuevo Cliente</h1>
<div class="agrupar">
<form action="respuesta.jsp" method="post">
<table border="1">
<tr><td>Nombre</td> <td><input type="text" name="txtNombre" required/>*Campo obligatorio</td></tr>
<tr><td>Cédula</td> <td><input type="text" name="txtCedula" maxlength="10" required/>*Campo obligatorio</td></tr>
<tr><td>Estado Civil</td>
<td><select name="cmbECivil">
<option value="Soltero">Soltero</option>
<option value="Casado">Casado</option>
<option value="Divorciado">Divorciado</option>
<option value="Viudo">Viudo</option>
</select></td></tr>
<tr><td>Lugar residencia </td>
<td>
    <input type="radio" name="rdResidencia" value="Sur"/>Sur   
    <input type="radio" name="rdResidencia" value="Norte"/>Norte 
    <input type="radio" name="rdResidencia" value="Centro"/>Centro
</td></tr>
<tr><td>Foto</td> <td><input type="file" name="fileFoto" accept=".jpg, .jpeg, .png"  /></td></tr> 
<tr><td>Mes y año de nacimiento </td> <td><input type="month" name="fecha"/></td></tr>
<tr><td>Color favorito</td> <td><input type="color" name="colorFavorito"/></td></tr>
<tr><td>Correo</td><td> <input type="email" name="txtCorreo" placeholder="usuario@nombreProveedor.dominio" required/>*Campo obligatorio</td></tr>
<tr><td>Clave</td><td><input type="password" id= "clave" name="txtClave" required/>*Campo obligatorio </td></tr>

<tr>
<td><input type="submit" name="btnEnviar" id="btnEnviar" value="Enviar Registro"/></td>
<td><input type="reset" /></td>
</tr>
</table>
<button type="button" onclick="location.href='index.jsp'">← Regresar</button>
</form>
 <aside>
 <a href="https://www.linkedin.com/in/anthony-pilliza-1b844335b/" target="_blank">Ver más información sobre los desarrolladores</a>
<iframe src="https://www.google.com/maps/d/embed?mid=1xMQyjGfhXwePEC61-YUKyv70md9LVFw&ehbc=2E312F" 
                width="100%" height="320" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
 </aside>
</div>
 <footer>
 <ul>
 <li><a href="https://www.facebook.com/anthony.pilliza.3">
 <img src="iconos/faceb.png" alt="imagen facebook" height="30" width="30"/></a></li>
 <li><a href="https://www.instagram.com/"> 
 <img src="iconos/instagram.png" alt="imagen instagram" height="30" width="30"/></a></li>
 <li><a href="https://www.tiktok.com/tiktokstudio/upload?lang=es">
 <img src="iconos/tiktok.png" alt="imagen tiktok" height="30" width="30"/></a></li>
 </ul>
 </footer>
</body>
</html>
