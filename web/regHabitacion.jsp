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
                <a class="navbar-brand">HOTEL · Registrar Habitacion</a>
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
                action="Sv_regHabitacion"
                method="POST"
                >
                <div class="row g-3">
                    <div class="col-sm-6">
                        <label for="numPiso" class="form-label">Numero de Piso</label>
                        <input
                            type="number"
                            class="form-control"
                            id="numPiso"
                            placeholder=""
                            value=""
                            name="numPiso"
                            required
                            />
                        <div class="invalid-feedback">
                            Ingrese un numero valido.
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <label for="temaHabitacion" class="form-label">Tematica</label>
                        <input
                            type="text"
                            class="form-control"
                            id="temaHabitacion"
                            placeholder=""
                            value=""
                            name="temaHabitacion"
                            required
                            />
                        <div class="invalid-feedback">
                            Ingrese un nombre valido.
                        </div>
                    </div>

                    <div class="col-6">
                        <label for="tipoHabitacion" class="form-label">Tipo de habitacion</label
                        >
                        <select
                            class="form-select"
                            id="tipoHabitacion"
                            required=""
                            name="tipoHabitacion"
                            value=""
                            required
                            onchange="activarInput();"
                            >
                            <option hidden></option>
                            <option id="single">Single</option>
                            <option id="doble">Doble</option>
                            <option id="triple">Triple</option>
                            <option id="multiple">Multiple</option>
                        </select>
                    </div>

                    <div class="col-6">
                        <label for="inputText" class="form-label">Cantidad de personas:</label>
                        <input
                            type="number" 
                            min="4" max="10"
                            class="form-control text-center"
                            id="inputText"
                            placeholder=""
                            value=""
                            name="inputText"
                            readonly="true"
                            style="background-color: whitesmoke;"
                            required
                            />
                        <div class="invalid-feedback">
                            Ingrese un numero valido.
                        </div>
                    </div>

                    <div class="col-12">
                        <label for="precioXnoche" class="form-label">Precio por noche</label>
                        <div class="input-group mb-3">
                            <span class="input-group-text">$</span>
                            <input
                                type="number"
                                step="any"
                                class="form-control"
                                id="precioXnoche"
                                placeholder=""
                                value=""
                                name="precioXnoche"
                                required
                                />
                            <div class="invalid-feedback">
                                Ingrese un numero valido.
                            </div>
                        </div>
                    </div>

                    <div class="from-check" id="check">
                        <label class="form-check-label" for="check">Disponible:</label>
                        <input
                            class="form-check-input"
                            type="radio"
                            id="disTrue"
                            name="disponible"
                            value="Si"
                            checked
                            required
                            />
                        <label class="form-check-label" for="disTrue">Si</label>

                        <input
                            class="form-check-input"
                            type="radio"
                            id="disFalse"
                            name="disponible"
                            value="No"
                            required
                            />
                        <label class="form-check-label" for="disFalse">No</label>

                    </div>
                </div>
                <hr class="my-3" />
                <button class="btn btn-primary btn-lg" type="submit" id="login">
                    Registrar
                </button>
                <hr class="my-3" />
                <a role="button" class="w-100 btn btn-secundary" href="mainMenu.jsp"  rel="async">
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
