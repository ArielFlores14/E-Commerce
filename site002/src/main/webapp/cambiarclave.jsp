<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.productos.negocio.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cambio de Clave - A-Technology</title>
<link href="css/estilos.css" rel="stylesheet" type="text/css">
</head>

<body>
<header>
 <div class="logo">
 <a href="index.jsp">
 <img src="imagenes/logo.png" alt="Logo A-Technology" id="logo">
 </a>
 </div>
 <h1>A-Technology</h1>
 <h2 class="destacado">La mejor tecnología a tu alcance</h2>
 <h4 id="favorito">Donde la innovación cobra vida</h4>
</header>

<nav>
 <a class="active" href="Productos.jsp">Productos</a>
 <a href="cambiarclave.jsp">Cambiar Clave</a>
 <a href="Cerrarsesion.jsp">Cerrar Sesión</a>
</nav>

<main>
<h3>Cambio de Clave</h3>
<div class="agrupar">
<form action="confirmacion.jsp" method="post">
<table border="1">
<tr>
  <td>Clave Anterior</td>
  <td><input type="password" id="clave" name="txtClaveA" required/>*Campo obligatorio</td>
</tr>
<tr>
  <td>Clave Nueva</td>
  <td><input type="password" id="clave" name="txtClaveN" required/>*Campo obligatorio</td>
</tr>
<tr>
  <td>Repetir Clave</td>
  <td><input type="password" id="clave" name="txtClaveR" required/>*Campo obligatorio</td>
</tr>
<tr>
  <td><input type="submit" name="btnEnviar" id="btnEnviar" value="Cambiar Clave"/></td>
  <td><input type="reset" /></td>
</tr>
</table>
<button type="button" onclick="location.href='index.jsp'">← Regresar</button>
</form>
</div>

<footer>
 <ul>
   <li><a href="https://www.facebook.com/"><img src="iconos/facebook.png" alt="imagen facebook" height="30" width="30"/></a></li>
   <li><a href="https://www.instagram.com/"> <img src="iconos/instagram.png" alt="imagen instagram" height="30" width="30"/></a></li>
   <li><a href="https://www.tiktok.com/"> <img src="iconos/tik-tok.png" alt="imagen tiktok" height="30" width="30"/></a></li>
 </ul>
</footer>
</main>
</body>
</html>
