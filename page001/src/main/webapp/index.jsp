<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>A-Technology</title>
    <link href="css/estilos.css" rel="stylesheet" type="text/css">
</head>
<body>

    <!-- Encabezado principal -->
    <header>
        <h1>A-Technology</h1>
        <h2 class="destacado">Contamos con variedad de productos electrónicos</h2>
        <h4 id="favorito">Te vendemos lo mejor, a buen precio.</h4>
        <div class="contenedor-logo">
            <img src="Iconos/Logo1.png" alt="Logo A-Technology" class="logo-img">
        </div>
    </header>

    <!-- Barra de navegación -->
    <nav>
        <a class="active" href="Productos.jsp">Ver Productos</a>
        <a href="Categoria.jsp">Buscar Por Categoría</a>
        <a href="Login.jsp">Login</a>
    </nav>

    <!-- Contenido principal -->
    <main class="contenedor">
        <!-- Sección informativa -->
        <section>
            <h3>Nuestra misión</h3>
            <p>
                Esta empresa fue creada hace 3 años y busca brindar los mejores productos electrónicos a los mejores precios.
            </p>
            <div class="imagen-tienda">
                <img src="imagenes/imagen1.png" alt="Imagen de la tienda">
            </div>
        </section>

        <!-- Aside con mapa e información adicional -->
        <aside>
            <p><a href="https://www.linkedin.com/in/ariel-flores-766b7b35a/" target="_blank">
                Ver más información sobre los desarrolladores</a></p>
            <iframe src="https://www.google.com/maps/d/embed?mid=1xMQyjGfhXwePEC61-YUKyv70md9LVFw&ehbc=2E312F" 
                width="100%" height="320" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
        </aside>
    </main>

    <!-- Pie de página -->
    <footer>
        <ul class="redes-sociales">
            <li>
                <a href="https://www.facebook.com" target="_blank">
                    <img src="Iconos/faceb.png" alt="Facebook">
                </a>
            </li>
            <li>
                <a href="https://www.instagram.com/" target="_blank">
                    <img src="Iconos/instagram.png" alt="Instagram">
                </a>
            </li>
            <li>
                <a href="https://www.tiktok.com/login?lang=es" target="_blank">
                    <img src="Iconos/tiktok.png" alt="TikTok">
                </a>
            </li>
        </ul>
        <p>&copy; 2025 A-Technology. Todos los derechos reservados.</p>
    </footer>

</body>
</html>
