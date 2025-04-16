<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registro</title>
<link href="css/estilos.css" rel="stylesheet" type="text/css">
</head>
<body>

<div class="form-container"> <!-- Contenedor con marco -->
    <h2>Registro de Usuario</h2>
    <form action="respuesta.jsp" method="post">
        <label>Nombre:</label>
        <input type="text" name="txtNombre" required>

        <label>Cédula:</label>
        <input type="text" name="txtCedula" maxlength="10" required>

        <label>Estado Civil:</label>
        <select name="cmbECivil">
            <option value="Soltero">Soltero</option>
            <option value="Casado">Casado</option>
            <option value="Divorciado">Divorciado</option>
            <option value="Viudo">Viudo</option>
        </select>

        <label>Lugar de Residencia:</label>
        <div class="radio-group">
            <input type="radio" name="rdResidencia" value="Sur">Sur
            <input type="radio" name="rdResidencia" value="Norte">Norte
            <input type="radio" name="rdResidencia" value="Centro">Centro
        </div>

        <label>Foto:</label>
        <input type="file" name="fileFoto" accept=".jpg, .jpeg, .png">

        <label>Mes y Año de Nacimiento:</label>
        <input type="month" name="fecha">

        <button type="submit">Registrarse</button>
    </form>
</div>

</body>
</html>
