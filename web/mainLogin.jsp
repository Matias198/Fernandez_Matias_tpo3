<%@page import="Logica.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="Logica.Controladora"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>HOTEL</title>
        <meta
            name=
            "viewport"
            content=
            "width=device-width, 
            user-scalable=no, 
            initial-scale=1.0, 
            maximum-scale=1.0, 
            minimum-scale=1.0"
            />
        <link rel="shortcut icon" href="rec/ico.png">
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" href="css/estiloGeneral.css"/>
        <link rel="stylesheet" href="css/estiloLogin.css"/>
    </head>
    <body class="text-center">
        <%
            HttpSession httpSession = request.getSession();
            httpSession.invalidate();

        %>
        <main class="form-signin">
            <header class="container">
                <h1 class="h3 mb-3 fw-normal">HOTEL</h1>
            </header>
            <form action="Sv_mainLogin" method="POST">
                <img
                    class="mb-3"
                    src="rec/ico.png"
                    alt=""
                    width="64"
                    height="64"
                    />
                <h3 class="h3 mb-3 fw-normal">*****</h3>
                <h2 class="h3 mb-3 fw-normal">Acceda para continuar</h2>

                <div class="form-floating">
                    <input
                        type="number"
                        class="form-control"
                        id="floatingInput"
                        placeholder="DNI"
                        name="usuario"
                        value=""
                        required
                        />
                    <label for="floatingInput">DNI</label>
                </div>
                <div class="form-floating">
                    <input
                        type="password"
                        class="form-control"
                        id="floatingPassword"
                        placeholder="Contraseña"
                        name="clave"
                        value=""
                        required
                        />
                    <label for="floatingPassword">Contraseña</label>
                </div>
                <div class="checkbox mb-3">
                    <label>
                        <input type="checkbox" value="verContra" onchange="verContra();"/> Ver contraseña
                    </label>
                </div>
                <button 
                    class="w-100 btn btn-lg btn-primary" 
                    type="submit"
                    >
                    Acceder
                </button>
                <hr class="my-3" />
                <a role="button" class="w-100 btn btn-secundary" href="regEmpleado.jsp"  rel="async">
                    Registrarse
                </a>
                <p class="mt-5 mb-3 text-muted">©1999-2021</p>
            </form>
        </main>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/jsFunctions.js"></script>
    </body>
</html>
