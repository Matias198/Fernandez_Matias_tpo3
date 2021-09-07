<%@page import="Logica.Huesped"%>
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
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/estiloGeneral.css"/>
        <link rel="stylesheet" href="css/estiloRegistro.css"/>
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
                <a class="navbar-brand">HOTEL · Modificar Huesped</a>
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
        
        
        
        <div class="container text-center">
            <form
                action="Sv_editPersona"
                method="get"
                >
                <%
                    HttpSession misession = request.getSession();
                    Huesped huesped = (Huesped) misession.getAttribute("huesped");
                    int idP = huesped.getIdPersona();
                   
                    int dni = huesped.getDniPersona();
                    String nombre = huesped.getNombre();
                    String apellido = huesped.getApellido();
                    String fecha = huesped.getFechaNac();
                    String direccion = huesped.getDireccion();
                    String profesion = huesped.getProfesion();
                %>
                <input name="idP" value="<%=idP%>" hidden></input>
                
                <div class="row g-3">
                    <div class="col-sm-4">
                        <label for="dni" class="form-label">DNI</label>
                        <input
                            type="number"
                            class="form-control text-center"
                            value="<%=dni%>"
                            name="dni"
                            required
                            />
                        <div class="invalid-feedback">
                            Ingrese un numero valido.
                        </div>
                    </div>

                    <div class="col-sm-4">
                        <label for="nombre" class="form-label">Nombre</label>
                        <input
                            type="text"
                            class="form-control text-center"
                            value="<%=nombre%>"
                            name="nombre"
                            required
                            />
                        <div class="invalid-feedback">
                            Ingrese un nombre valido.
                        </div>
                    </div>

                    <div class="col-sm-4">
                        <label for="apellido" class="form-label"
                               >Apellido</label
                        >
                        <input
                            type="text"
                            class="form-control text-center"
                            value="<%=apellido%>"
                            name="apellido"
                            required
                            />
                        <div class="invalid-feedback">
                            Ingrese un apellido valido.
                        </div>
                    </div>

                    <div class="col-6">
                        <label for="date" class="form-label"
                               >Fecha de nacimiento</label
                        >
                        <input
                            type="date"
                            class="form-control text-center"
                            min="1921-07-01"
                            max="2021-08-09"
                            name="fechaNac"
                            value="<%=fecha%>"
                            required
                            />
                        <div class="invalid-feedback">
                            Ingrese su fecha de nacimiento.
                        </div>
                    </div>

                    <div class="col-6">
                        <label for="direccion" class="form-label"
                               >Direccion
                            <span class="text-muted">(Calle)</span></label
                        >
                        <input
                            type="text"
                            class="form-control text-center"
                            placeholder="ej: Manuel Estrada 1250"
                            name="direccion"
                            value="<%=direccion%>"
                            required
                            />
                        <div class="invalid-feedback">
                            Ingrese una direccion valida.
                        </div>
                    </div>

                    <div class="col-12">
                        <label for="cargo" class="form-label"
                               >Profesion</label
                        >
                        <input
                            type="text"
                            class="form-control text-center"
                            id="cargo"
                            name="cargo"
                            value="<%=profesion%>"
                            required
                            />
                        <div class="invalid-feedback">
                            Ingrese un cargo valido.
                        </div>
                    </div>
                    
                <hr class="my-3" />
                <div class="container text-center">
                        <button class="btn btn-lg btn-primary m-2" id="btnGuardar" type="submit">
                            Guardar
                        </button>
                    </div>
                <hr class="my-3" />
                <a role="button" class="btn btn-secundary" href="mainMenu.jsp"  rel="async">
                    Cancelar
                </a>
            </form>
        </div>
        <footer class="text-center">
            <div class="container">
                <p class="mt-5 mb-3 text-muted">© 1999-2021</p>
            </div>
        </footer>

        <script src="js/jsFunctions.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
      <%}%>  
    </body>
</html>
