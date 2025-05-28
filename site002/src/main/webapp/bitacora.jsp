<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.productos.seguridad.*" %>
<%
    ArrayList<auditoria> lista = auditoria.obtenerBitacora();
%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Bitácora - A-Technology</title>
  <link href="css/est2.css" rel="stylesheet" type="text/css">
</head>
<body>
  <main>
    <header>
      <div class="logo">
        <a href="index.jsp">
          <img src="imagenes/logo.png" alt="Logo A-Technology" id="logo">
        </a>
      </div>
      <h1>A-Technology</h1>
      <h2 class="destacado">La mejor tecnología a tu alcance</h2>
      <h4 id="favorito">Innovación y calidad para tu día a día</h4>
    </header>

    <nav>
      <a class="active" href="index.jsp">Inicio</a>
      <a href="Bitacora.jsp">Bitácora</a>
      <a href="GestionP.jsp">Agregar Usuario</a>
      <a href="cerrarsesion.jsp">Cerrar Sesión</a>
    </nav>

    <div class="agrupar">
      <section>
        <h3 class="destacado">Bitácora de Auditoría</h3>
        <div class="form-container">
          <table style="width: 100%; border-collapse: collapse;">
              <tr style="background-color: #8D99AE; color: #1A1A1A;">
                  <th>ID</th>
                  <th>Tabla</th>
                  <th>Operación</th>
                  <th>Valor Anterior</th>
                  <th>Valor Nuevo</th>
                  <th>Fecha</th>
                  <th>Usuario</th>
              </tr>
              <%
                  for (auditoria a : lista) {
              %>
              <tr style="background-color: #EDF2F4; color: #333;">
                  <td><%= a.getId() %></td>
                  <td><%= a.getTabla() %></td>
                  <td><%= a.getOperacion() %></td>
                  <td><%= a.getValorAnterior() %></td>
                  <td><%= a.getValorNuevo() %></td>
                  <td><%= a.getFecha() %></td>
                  <td><%= a.getUsuario() %></td>
              </tr>
              <%
                  }
              %>
          </table>
        </div>
      </section>


    </div>

    <footer>
      <ul>
        <li><a href="https://www.facebook.com/"><img src="iconos/facebook.png" alt="facebook" height="30" width="30"/></a></li>
        <li><a href="https://www.instagram.com/"><img src="iconos/instagram.png" alt="instagram" height="30" width="30"/></a></li>
        <li><a href="https://www.tiktok.com/"><img src="iconos/tik-tok.png" alt="tiktok" height="30" width="30"/></a></li>
      </ul>
      <p style="text-align:center;">&copy; 2025 A-Technology. Todos los derechos reservados.</p>
    </footer>
  </main>
</body>
</html>
