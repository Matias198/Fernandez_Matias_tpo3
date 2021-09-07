<%@page import="Logica.Reserva"%>
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
                <a class="navbar-brand">HOTEL · Ver Huespedes</a>
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
            boolean existeTabla;
            List<Huesped> listaHuespedes = null;
            try {
                listaHuespedes = control.verHuespedes();
                existeTabla = true;
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
                existeTabla = false;
            }
            //List<Huesped> listaHuespedes = control.verHabitaciones();
            if (existeTabla) {
                if (listaHuespedes.size() == 0) {%> 
        <div class="text-center container py-3">
            <div class="alert alert-danger" role="alert">
                No hay huespedes registrados!
            </div>
            <a href="regHuesped.jsp">
                <input type="button" class="btn btn-success m-2" value="Registrar nuevo huesped"></input>
            </a>
            </br>
            <a href="mainMenu.jsp">
                <input type="button" class="btn btn btn-secondary m-2" value="Volver al inicio"></input>
            </a>
        </div>
        <%
        } else {
        %>
        <div class="text-center container-fluid py-3">
            <div class="overflow-auto">
                <table class="table table-responsive table-bordered" style="border-color: black; border-style: solid;">
                    <thead class="tbHead">
                        <tr>
                            <th>DNI</th>
                            <th>Nombre y apellido</th>
                            <th>Nacimiento</th>
                            <th>Direccion</th>
                            <th>Profesion</th>
                            <th>ID Reserva</th>
                            <th>Editar</th>
                            <th>Borrar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int dni, i, k, id;
                            String listaR;
                            String nombreApellido, fechaNac, direccion, profesion;
                            for (i = 0; i < listaHuespedes.size(); i++) {
                        %>
                        <tr class="tbBody">
                            <%id = listaHuespedes.get(i).getIdPersona();%>
                       
                            <%dni = listaHuespedes.get(i).getDniPersona();%>
                            <td><%=String.valueOf(dni)%></td>

                            <%nombreApellido = listaHuespedes.get(i).getNombre() + " " + listaHuespedes.get(i).getApellido();%>
                            <td><%=nombreApellido%> </td>

                            <%fechaNac = listaHuespedes.get(i).getFechaNac();%>
                            <td><%=fechaNac%></td>

                            <%direccion = listaHuespedes.get(i).getDireccion();%>
                            <td><%=direccion%></td>

                            <%profesion = listaHuespedes.get(i).getProfesion();%>
                            <td><%=profesion%></td>
                            <%
                                k = listaHuespedes.get(i).getReserva().getIdReserva();

                                if (String.valueOf(k) == null) {
                                    listaR = "Sin reservas";
                                } else {
                                    listaR = String.valueOf(k);
                                }
                            %>
                            <td>
                                <%=listaR%>
                            </td>
                            <td> 
                                <form action="Sv_editPersona" id="fromGuardar" method="post" style="display: inline;">
                                    <input type="hidden" name="id" value="<%=id%>"></input>
                                    <button class="btn btn-primary" type="submit" style="display: inline;">Editar</button>
                                </form>
                            </td>
                            <td>
                                <form action="Sv_delPersona" method="post" style="display: inline;">
                                    <input type="hidden" name="id" value="<%=id%>"></input>
                                    <input type="hidden" name="idr" value="<%=k%>"></input>
                                    <button class="btn btn-primary" type="submit" style="display: inline;">Borrar</button>
                                </form>
                            </td>

                    </tr> 
                    </tbody>
                    <%}%>
                </table>
            </div>
        </div>
        <%}
        } else {%>
        <div class="text-center container py-3">
            <div class="alert alert-danger" role="alert">
                Error con la base de datos!
            </div>
            <a href="mainMenu.jsp">
                <input type="button" class="btn btn btn-secondary m-2" value="Volver al inicio"></input>
            </a>
        </div>
        <%}%>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/jsFunctions.js"></script>
        <%}%>
    </body>
</html>
