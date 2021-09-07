<%@page import="java.util.List"%>
<%@page import="Logica.Huesped"%>
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
        <link rel="stylesheet" href="css/estiloMenu.css"/>
    </head>
    <body>

        <%
            HttpSession httpSession = request.getSession();
            String usuario = (String) httpSession.getAttribute("usuario");

            if (usuario == null) {
                response.sendRedirect("mainLogin.jsp");
            } else {
        %>

        <nav class="navbar navbar-dark bg-dark" aria-label="navbarMenu">
            <div class="container-fluid">
                <a class="navbar-brand">HOTEL · Menu Principal</a>
                <button
                    class="navbar-toggler collapsed"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#navbarMenu"
                    aria-controls="navbarMenu"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
                    >
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="navbar-collapse collapse" id="navbarMenu">
                    <ul class="navbar-nav me-auto mb-2">
                        <li class="nav-item">
                            <a
                                class="nav-link active"
                                aria-current="page"
                                href="mainMenu.jsp"
                                >Inicio</a
                            >
                        </li>
                        <li class="nav-item dropdown">
                            <a
                                class="nav-link dropdown-toggle"
                                href="#"
                                id="dropdown01"
                                data-bs-toggle="dropdown"
                                aria-expanded="false"
                                >Ver</a
                            >
                            <ul class="dropdown-menu" aria-labelledby="dropdown01">
                                <li class="nav-item">
                                    <a
                                        class="dropdown-item"
                                        href="verHuespedes.jsp"
                                        >Ver huespedes</a
                                    >
                                </li>
                                <li class="nav-item">
                                    <a
                                        class="dropdown-item"
                                        href="verHabitaciones.jsp"
                                        >Ver habitaciones</a
                                    >
                                </li>
                                <li class="nav-item">
                                    <a
                                        class="dropdown-item"
                                        href="verReservas.jsp"
                                        >Ver reservas</a
                                    >
                                </li>
                            </ul>

                        <li class="nav-item dropdown">
                            <a
                                class="nav-link dropdown-toggle"
                                href="#"
                                id="dropdown01"
                                data-bs-toggle="dropdown"
                                aria-expanded="false"
                                >Registrar</a
                            >
                            <ul
                                class="dropdown-menu"
                                aria-labelledby="dropdown01"
                                >
                                <li>
                                    <a
                                        class="dropdown-item"
                                        href="regHuesped.jsp"
                                        >Nuevo huesped</a
                                    >
                                </li>
                                <li>
                                    <a class="dropdown-item" 
                                       href="regEmpleado.jsp"
                                       >Nuevo empleado</a
                                    >
                                </li>
                                <li>
                                    <a class="dropdown-item" 
                                       href="regHabitacion.jsp"
                                       >Nueva habitacion</a
                                    >
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a
                                class="nav-link dropdown-toggle"
                                href="#"
                                id="dropdown01"
                                data-bs-toggle="dropdown"
                                aria-expanded="false"
                                >Opciones</a
                            >
                            <ul
                                class="dropdown-menu"
                                aria-labelledby="dropdown01"
                                >
                                <li>
                                    <a class="dropdown-item" 
                                       href="mainPerfil.jsp"
                                       >Mi perfil</a
                                    >
                                </li>
                                <hr class="my-2" />
                                <li>
                                    <a class="dropdown-item" 
                                       href="mainLogin.jsp"
                                       >Cerrar sesión</a
                                    >
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <header class="text-center p-2 container-fluid" style="background-color: #86b7fe;">
            <h1 class="globo text-center py-2" style="color:white;">BIENVENIDO</h1>
        </header>

        <div class="container text-center py-2">
            <div class="row justify-content-md-center">
                <div class="col-sm-12 col-md-5">
                    <div style="background-image: url('rec/h1.jpg'); background-size: 45rem; height: 35rem; background-position: center;">
                        <h3 class="py-3" style="background-color: white;"> 
                            REGISTRAR:
                        </h3>
                        <div class="btn-group-vertical btn-group-lg" role="group">
                            <input type="button" class="btn btn-lg btn-primary globo" value="RESERVAS" onclick=location.href="regHuesped.jsp">
                            </input>
                            <input type="button" class="btn btn-lg btn-primary globo" value="HABITACIONES" onclick=location.href="regHabitacion.jsp">
                            </input>
                            <input type="button" class="btn btn-lg btn-primary globo" value="EMPLEADOS" onclick=location.href="regEmpleado.jsp">
                            </input>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-md-auto">

                </div>
                <div class="col-sm-12 col-md-5">
                    <div style="background-image: url('rec/h3.jpg'); background-size: 45rem; height: 35rem; background-position: center;">
                        <h3 class="py-3" style="background-color: black; color: white;"> 
                            VER:
                        </h3>
                        <div class="btn-group-vertical btn-group-lg" role="group">
                            </br></br></br></br></br></br></br></br></br></br></br></br></br>

                            <input type="button" class="btn btn-lg btn-primary globo" value="RESERVAS" onclick=location.href="verReservas.jsp">
                            </input>
                            <input type="button" class="btn btn-lg btn-primary globo" value="HABITACIONES" onclick=location.href="verHabitaciones.jsp">
                            </input>
                            <input type="button" class="btn btn-lg btn-primary globo" value="HUESPEDES" onclick=location.href="verHuespedes.jsp">
                            </input>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <footer class="text-center">
        <div class="container">
            <p class="mt-5 mb-3 text-muted">© 1999-2021</p>
        </div>
    </footer>

    <script src="js/bootstrap.bundle.min.js"></script>

    <%}%>
</body>
</html>
