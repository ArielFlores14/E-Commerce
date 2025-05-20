<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registrarse - A-Technology</title>
    <link href="css/estilos.css" rel="stylesheet" type="text/css">
</head>
<body>

<header>
    <h1>A-Technology</h1>
    <h2 class="destacado">¡Regístrate y descubre lo último en tecnología!</h2>
</header>

<main>
    <div class="form-container">
        <div class="form-image fade-in">
            <img class="imagen-transicion" src="imagenes/imagen2.jpg" alt="Registro">
        </div>
        <form action="respuesta.jsp" method="post" class="form-box">
            <h2>Formulario de Registro</h2>

            <div class="form-group">
                <label for="txtNombre">Nombre</label>
                <input type="text" name="txtNombre" required>
            </div>

            <div class="form-group">
                <label for="txtCedula">Cédula</label>
                <input type="text" name="txtCedula" maxlength="10" required>
            </div>

            <div class="form-group">
                <label for="txtCorreo">Correo</label>
                <input type="email" name="txtCorreo" placeholder="usuario@nombreProveedor.dominio" required>
            </div>

            <div class="form-group">
                <label for="txtpw">Contraseña</label>
                <input type="password" name="txtpw" required>
            </div>

            <div class="form-group">
                <label for="cmbECivil">Estado Civil</label>
                <select name="cmbECivil">
                    <option value="1">Soltero</option>
                    <option value="2">Casado</option>
                    <option value="3">Divorciado</option>
                    <option value="4">Unión Libre</option>
                </select>
            </div>

            <div class="form-group">
                <label>Residencia</label>
                <div class="radios">
                    <label><input type="radio" name="rdResidencia" value="Sur"> Sur</label>
                    <label><input type="radio" name="rdResidencia" value="Norte"> Norte</label>
                    <label><input type="radio" name="rdResidencia" value="Centro"> Centro</label>
                </div>
            </div>

            <div class="form-group">
                <label for="fileFoto">Subir Foto</label>
                <input type="file" name="fileFoto">
            </div>

            <div class="form-group">
                <label for="fecha">Mes y Año de Nacimiento</label>
                <input type="month" name="fecha">
            </div>

            <div class="form-group">
                <label for="colorFavorito">Color Favorito</label>
                <input type="color" name="colorFavorito">
            </div>

            <input type="submit" value="Registrar" class="submit-button">
        </form>
    </div>
</main>

<footer>
    <p>&copy; 2025 A-Technology. Todos los derechos reservados.</p>
</footer>

</body>
</html>
