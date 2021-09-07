<%@page import="Logica.Habitacion"%>
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
                <a class="navbar-brand">HOTEL · Ver Habitaciones</a>
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
            List<Habitacion> listaHabitaciones = null;
            try {
                listaHabitaciones = control.verHabitaciones();
                existeTabla = true;
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
                existeTabla = false;
            }
            //List<Habitacion> listaHabitaciones = control.verHabitaciones();
            if (existeTabla) {
                if (listaHabitaciones.size() == 0) {%>      
        <div class="text-center container py-3">
            <div class="alert alert-danger" role="alert">
                No hay habitaciones registradas!
            </div>

            <a href="regHabitacion.jsp">
                <input type="button" class="btn btn-success m-2" value="Registrar nueva habitacion"></input>
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
                            <th>ID</th>
                            <th>Numero de piso</th>
                            <th>Tematica</th>
                            <th>Tipo</th>
                            <th>Cantidad admitida</th>
                            <th>Precio/noche</th>
                            <th>Disponible</th>
                            <th>Borrar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (int i = 0; i < listaHabitaciones.size(); i++) {
                        %>
                        <tr class="tbBody">
                            <% int id = listaHabitaciones.get(i).getIdHabitacion();%>
                            <td><%=String.valueOf(id)%></td>

                            <% int nroPiso = listaHabitaciones.get(i).getNumPiso();%>
                            <td><%=String.valueOf(nroPiso)%></td>

                            <% String tematica = listaHabitaciones.get(i).getNombreTematica();%>
                            <td><%=tematica%></td>

                            <% String tipo = listaHabitaciones.get(i).getTipoHabitacion();%>
                            <td><%=tipo%></td>

                            <% int cant = listaHabitaciones.get(i).getCantPersonas();%>
                            <td><%=String.valueOf(cant)%></td>

                            <% float precio = listaHabitaciones.get(i).getPrecioXnoche();%>
                            <td><%=String.valueOf(precio)%></td>

                            <% String dispo = listaHabitaciones.get(i).getDisponible();%>
                            <td><%=dispo%></td>
                           
                            <td>
                                <form action="Sv_delHabitacion" method="post" style="display: inline;">
                                    <input type="hidden" name="id" value="<%=id%>"></input>
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
        <%}%>

    </body>
</html>
