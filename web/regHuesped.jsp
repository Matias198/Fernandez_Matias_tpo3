<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Logica.Habitacion"%>
<%@page import="Logica.Reserva"%>
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
        <link href="css/bootstrap.min.css" rel="stylesheet"/>
        <link rel="stylesheet" href="css/estiloGeneral.css"/>
        <link rel="stylesheet" href="css/estiloRegistro.css"/>
    </head>
    <body onload="greenGlow();">

        <%
            HttpSession httpSession = request.getSession();
            String usuario = (String) httpSession.getAttribute("usuario");

            if (usuario == null) {
                response.sendRedirect("mainLogin.jsp");
            } else {
        %>

        <nav class="navbar navbar-dark bg-dark" aria-label="navbarMenu">
            <div class="container-fluid">
                <a class="navbar-brand">HOTEL · Registrar Huesped</a>
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
            boolean existeTablaHab, existeTablaRes;
            List<Habitacion> listaHabitaciones = null;
            List<Reserva> listaReservas = null;
            String fechaDesdeIn = "";
            String fechaDesdeOut = "";
            String fechasDisabled = "";

            String timeStamp = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
            try {
                listaHabitaciones = control.verHabitaciones();
                existeTablaHab = true;

                listaReservas = control.verReserva();
                existeTablaRes = true;

            } catch (Exception ex) {
                System.out.println(ex.getMessage());
                existeTablaHab = false;
                existeTablaRes = false;
            }

            if (existeTablaHab) {

                if (listaHabitaciones.size() == 0) {
        %>         
        <div class="container text-center">
            <div class="text-center container py-3">
                <div class="alert alert-danger" role="alert">
                    No hay habitaciones disponibles!
                </div>

                <a href="regHabitacion.jsp">
                    <input type="button" class="btn btn-success m-2" value="Registrar nueva habitacion"></input>
                </a>
                </br>
                <a href="mainMenu.jsp">
                    <input type="button" class="btn btn btn-secondary m-2" value="Volver al inicio"></input>
                </a>
            </div>
        </div>
        <%
        } else {
        %>
        <div>
            <form
                action="Sv_regHuesped"
                method="POST"
                id="registroCompleto"
                class="container-fluid"
                >
                <div class="row g-3 text-center">
                    <div class="col-sm-6 col-md-3">
                        <label for="dniE" class="form-label">DNI Empleado a cargo:</label>
                        <input
                            type="number"
                            class="form-control text-center"
                            id="dniE"
                            name="dniEmp"
                            value="<%=usuario%>"
                            readonly
                            />
                        <div class="invalid-feedback">
                            Ingrese un numero valido.
                        </div>
                    </div>

                    <div class="col-sm-6 col-md-3">
                        <label for="dni" class="form-label">DNI Huesped</label>
                        <input
                            type="number"
                            class="form-control"
                            id="dni"
                            name="dni"
                            value=""
                            required
                            oninput="actualizarComprobante();"
                            />
                        <div class="invalid-feedback">
                            Ingrese un numero valido.
                        </div>
                    </div>

                    <div class="col-sm-6 col-md-3">
                        <label for="nombre" class="form-label">Nombre</label>
                        <input
                            type="text"
                            class="form-control"
                            id="nombre"
                            value=""
                            required
                            name="nombre"
                            oninput="actualizarComprobante();"
                            />
                        <div class="invalid-feedback">
                            Ingrese un nombre valido.
                        </div>
                    </div>

                    <div class="col-sm-6 col-md-3">
                        <label for="apellido" class="form-label">Apellido</label
                        >
                        <input
                            type="text"
                            class="form-control"
                            id="apellido"
                            value=""
                            required
                            name="apellido"
                            />
                        <div class="invalid-feedback">
                            Ingrese un apellido valido.
                        </div>
                    </div>

                    <div class="col-6">
                        <label for="date" class="form-label">Fecha de nacimiento</label
                        >
                        <input
                            type="date"
                            class="form-control"
                            id="date"
                            name="fechaNac"
                            required
                            max="<%=timeStamp%>"
                            />

                        <div class="invalid-feedback">
                            Ingrese su fecha de nacimiento.
                        </div>
                    </div>

                    <div class="col-6">
                        <label for="direccion" class="form-label">Direccion
                            <span class="text-muted">(Calle)</span></label>
                        <input
                            type="text"
                            class="form-control"
                            id="direccion"
                            placeholder="ej: Manuel Estrada 1250"
                            name="direccion"
                            value=""
                            required
                            />
                        <div class="invalid-feedback">
                            Ingrese una direccion valida.
                        </div>
                    </div>

                    <div class="col-12">
                        <label for="profesion" class="form-label">Profesion</label
                        >
                        <input
                            type="text"
                            class="form-control text-center"
                            id="profesion"
                            name="profesion"
                            value=""
                            required
                            />
                        <div class="invalid-feedback">
                            Ingrese una profesion valida.
                        </div>
                    </div>


                    <hr class="my-4" />
                    <label for="tLabel" class="form-label d-flex">
                        Seleccione la habitacion deseada:
                    </label>
                    <div class="overflow-auto tablaContenedor">
                        <table id="tLabel" class="table table-responsive table-bordered" style="border-color: black; border-style: solid;">
                            <thead class="tbHead">
                                <tr>
                                    <th>ID</th>
                                    <th>Numero de piso</th>
                                    <th>Tematica</th>
                                    <th>
                                        <label for="filtroType" class="form-label">
                                            Filtrar tipo:
                                        </label>
                                        </br>
                                        <select
                                            class="form-select-sm"
                                            id="filtroType"
                                            name="filtroType"
                                            style=
                                            "
                                            background-color: #86b7fe; 
                                            border-color: #86b7fe;
                                            "
                                            onchange="filtrarDatos()"
                                            >
                                            <option id="noFilter">No filtrar</option>
                                            <option id="single">Single</option>
                                            <option id="doble">Doble</option>
                                            <option id="triple">Triple</option>
                                            <option id="multiple">Multiple</option>
                                        </select>
                                    </th>
                                    <th>Cantidad admitida</th>
                                    <th>Precio/noche</th>
                                    <th>Disponible:</th>
                                    <th>Elegir</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    String tematica, tipo, dispo = "";
                                    int id = 0, nroPiso, cant;
                                    float precio;

                                    for (int i = 0; i < listaHabitaciones.size(); i++) {
                                %>
                                <tr class="tbBody">
                                    <%id = listaHabitaciones.get(i).getIdHabitacion();%>
                                    <td><%=String.valueOf(id)%></td>

                                    <%nroPiso = listaHabitaciones.get(i).getNumPiso();%>
                                    <td><%=String.valueOf(nroPiso)%></td>

                                    <%tematica = listaHabitaciones.get(i).getNombreTematica();%>
                                    <td><%=tematica%></td>

                                    <%tipo = listaHabitaciones.get(i).getTipoHabitacion();%>
                                    <td name="elementFilter"><%=tipo%></td>

                                    <%cant = listaHabitaciones.get(i).getCantPersonas();%>
                                    <td><%=String.valueOf(cant)%></td>

                                    <%precio = listaHabitaciones.get(i).getPrecioXnoche();%>
                                    <td><%=String.valueOf(precio)%></td>

                                    <%dispo = listaHabitaciones.get(i).getDisponible();%>

                                    <td><%=dispo%></td>
                                    <% if (dispo.equals("Si")) {%>

                                    <%
                                        if (existeTablaRes) {
                                            for (int j = 0; j < listaReservas.size(); j++) {
                                                if (listaReservas.get(j).getHabitacion().getIdHabitacion() == id) {
                                                    fechaDesdeIn = listaReservas.get(j).getCheckIn();
                                                    fechaDesdeOut = listaReservas.get(j).getCheckOut();
                                                    fechasDisabled = fechasDisabled + fechaDesdeIn + "," + fechaDesdeOut + "$";
                                                }
                                            }
                                        }
                                    %>

                                    <td class="text-justify"> 
                                        <input 
                                            class="form-check-input" 
                                            type="radio"
                                            name="eleccion" 
                                            id="numID_<%=String.valueOf(id)%>"
                                            onchange="actualizarDatos(<%=String.valueOf(id)%>,<%=precio%>, '<%=tipo%>',<%=String.valueOf(nroPiso)%>, '<%=fechaDesdeIn%>', '<%=fechaDesdeOut%>');"
                                            ></input>
                                    </td>  
                                    <%} else {%>
                                    <td class="text-justify"></td>
                                    <%}%>

                                </tr> 
                                <%}%>
                            </tbody>

                        </table>
                    </div>

                    <div class="d-flex col-2">
                        <label for="profesion" class="form-control" readonly>
                            ID:
                        </label>
                        <input
                            type="number"
                            class="form-control text-center col-2"
                            id="idHabitad"
                            name="idHabitadName"
                            value=""
                            readonly
                            />
                    </div>
                    <hr class="my-4" />


                    <div class="col-xs-10 col-sm-6 col-md-4">
                        <label for="tipoHabitacion" class="form-label">
                            Tipo de habitacion
                        </label>
                        <input
                            class="form-control text-center"
                            id="tipoHabitacion"
                            name="tipoHabitacionName"
                            value=""
                            disabled
                            required>
                        </input>
                    </div>

                    <div class="col-xs-2 col-sm-6 col-md-2">
                        <label for="precioXnoche" class="form-label">Precio/noche</label>
                        <input
                            type="text"
                            class="form-control text-center"
                            id="precioXnoche"
                            name="precioXnocheName"
                            readonly
                            />
                    </div>

                    <div class="col-xs-6 col-md-3">
                        <label for="fechaDesde" class="form-label">
                            Fecha desde
                            <span class="text-muted">(In)</span>
                        </label>
                        <input
                            type="date"
                            class="form-control"
                            id="fechaDesde"
                            name="fechaDesdeName"
                            min="<%=timeStamp%>"
                            max="9999-12-31"
                            disabled
                            required
                            />
                    </div>

                    <div class="col-xs-5 col-md-3">
                        <label for="fechaHasta" class="form-label">
                            Fecha hasta
                            <span class="text-muted">(Out)</span>
                        </label>
                        <input
                            type="date"
                            class="form-control"
                            id="fechaHasta"
                            name="fechaHastaName"
                            min="<%=timeStamp%>"
                            max="9999-12-31"
                            disabled
                            required
                            />
                    </div>

                    <hr class="my-4" />
                    <label for="precioTotal" class="form-label d-flex">
                        Precio total: 
                    </label>

                    <div class="input-group">
                        <div class="input-group-prepend">
                            <button
                                type="button"
                                class="btn btn-dark"
                                id="btnPrecio"
                                name="btnPrecio"
                                onclick="verificarFechas();"
                                >
                                Calcular
                            </button>
                        </div>
                        <input
                            type="number"
                            class="form-control text-center"
                            id="precioTotal"
                            name="precioTotalName"
                            readonly
                            requiered
                            >           
                        </input>
                    </div>   
                    <hr class="my-4" />

                    <label for="tabla2" class="form-label d-flex">
                        Resumen comprobante:
                    </label>

                    <div class="overflow-auto tablaContenedor">
                        <table id="tabla2" class="table table-responsive table-bordered" style="border-color: black; border-style: solid;">
                            <thead class="tbHead">
                                <tr>
                                    <th>DNI</th>
                                    <th>Nombre</th>
                                    <th>ID Habitacion</th>
                                    <th>Tipo de habitacion</th>
                                    <th>Piso</th>
                                    <th>Fecha ingreso</th>
                                    <th>Fecha egreso</th>
                                    <th>Precio/noche</th>
                                    <th>Dias totales</th>
                                    <th>Costo total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="tbBody">
                                    <td>
                                        <label class="border border-white" name="fila1name" id="fila1" readonly></label>
                                    </td>
                                    <td>
                                        <label class="border border-white" id="fila2" readonly></label>
                                    </td>
                                    <td>
                                        <label class="border border-white" id="fila3" readonly></label>
                                    </td>
                                    <td>
                                        <label class="border border-white" id="fila4" readonly></label>
                                    </td>
                                    <td>
                                        <label class="border border-white" id="fila5" readonly></label>
                                    </td>
                                    <td>
                                        <label class="border border-white" id="fila6" readonly></label>
                                    </td>
                                    <td>
                                        <label class="border border-white" id="fila7" readonly></label>
                                    </td>
                                    <td>
                                        <label class="border border-white" id="fila8" readonly></label>
                                    </td>
                                    <td>
                                        <label class="border border-white" id="fila9" readonly></label>
                                    </td>
                                    <td>
                                        <label class="border border-white" id="fila10" readonly></label>
                                    </td>                                
                                </tr> 
                                <tr>

                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="d-flex flex-row-reverse">
                        <label class="button btn btn-secondary" onclick="imprimir()">
                            Imprimir
                        </label>
                    </div>

                    <hr class="my-4" />
                    <div class="container text-center">
                        <div class="btn-group-vertical" role="group" aria-label="Basic example">

                        </div>
                        <label id="btnSuccess" class="button btn btn-dark" onclick="verificarTodo()">
                            Verificar
                        </label>
                        <button class="btn btn-lg btn-primary m-2" id="btnRegistrar" type="submit" disabled>
                            Registrar
                        </button>
                    </div>
                </div>
            </form>
            <%}%>

        </div>
        <footer class="text-center">
            <div class="container">
                <p class="mt-5 mb-3 text-muted">© 1999-2021</p>
            </div>
        </footer>


        <%} else {%>
        <div class="text-center container py-3">
            <div class="alert alert-danger" role="alert">
                Error con la base de datos!
            </div>
            <a href="mainMenu.jsp">
                <input type="button" class="btn btn-secondary m-2" value="Volver al inicio"></input>
            </a>
        </div>
        <%
            }
        %>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/jsFunctions.js"></script>
        <%}%>
    </body>
</html>
