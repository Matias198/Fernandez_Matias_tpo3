<%@page import="Logica.Empleado"%>
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
                <a class="navbar-brand">HOTEL · Perfil Empleado</a>
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

        <%
            Controladora control = new Controladora();
            List<Empleado> listaEmpleados = control.verEmpleados();
            int dni = 0;
            String nombre = "";
            String apellido = "";
            String fecNac = "";
            String dir = "";
            String cargo = "";
            for (int i = 0; i < listaEmpleados.size(); i++) {
                if (Integer.parseInt(usuario) == listaEmpleados.get(i).getDniPersona()){
                    dni = listaEmpleados.get(i).getDniPersona();
                    nombre = listaEmpleados.get(i).getNombre();
                    apellido = listaEmpleados.get(i).getApellido();
                    fecNac = listaEmpleados.get(i).getFechaNac();
                    dir = listaEmpleados.get(i).getDireccion();
                    cargo = listaEmpleados.get(i).getCargo();
                }
            }
            String bienvenido = nombre.toUpperCase() + " " + apellido.toUpperCase();
        %>
        <header class="text-center p-2 container-fluid" style="background-color: #86b7fe;">
            <h1 class="globo text-center py-2" style="color:white;"><%=bienvenido%></h1>
        </header>

        <div class="container text-center py-2">
            <div class="row justify-content-md-center">
                <div class="col-12">
                    <div style="background-image: url('rec/h2.jpg'); background-size: 45rem; height: 35rem; background-position: center;">
                        <h3 class="py-3" style="background-color: white;"> 
                            DATOS PERSONALES
                        </h3>
                        <form class="py-3" style="color:white;">
                            <div class="row g-3">
                                <div class="col-sm-4">
                                    <label for="dni" class="form-label">DNI</label>
                                    <input
                                        type="number"
                                        class="form-control text-center"
                                        id="dni"
                                        name="dni"
                                        value="<%=dni%>"
                                        readonly
                                        />
                                </div>

                                <div class="col-sm-4">
                                    <label for="nombre" class="form-label">Nombre</label>
                                    <input
                                        type="text"
                                        class="form-control text-center"
                                        id="nombre"
                                        name="nombre"
                                        value="<%=nombre%>"
                                        readonly
                                        />
                                </div>

                                <div class="col-sm-4">
                                    <label for="apellido" class="form-label"
                                           >Apellido</label
                                    >
                                    <input
                                        type="text"
                                        class="form-control text-center"
                                        id="apellido"
                                        name="apellido"
                                        value="<%=apellido%>"
                                        readonly
                                        />
                                </div>

                                <div class="col-6">
                                    <label for="date" class="form-label"
                                           >Fecha de nacimiento</label
                                    >
                                    <input
                                        type="date"
                                        class="form-control text-center"
                                        id="date"
                                        name="fechaNac"
                                        value="<%=fecNac%>"
                                        readonly
                                        />
                                </div>

                                <div class="col-6">
                                    <label for="direccion" class="form-label">
                                        Direccion
                                        <span class="text-muted">(Calle)</span>
                                    </label>
                                    <input
                                        type="text"
                                        class="form-control text-center"
                                        id="direccion"
                                        placeholder="ej: Manuel Estrada 1250"
                                        name="direccion"
                                        value="<%=dir%>"
                                        readonly
                                        />
                                </div>

                                <div class="col-12">
                                    <label for="cargo" class="form-label"
                                           >Cargo</label
                                    >
                                    <input
                                        type="text"
                                        class="form-control text-center"
                                        id="cargo"
                                        name="cargo"
                                        value="<%=cargo%>"
                                        readonly
                                        />
                                </div>
                        </form>
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
