function verificarPasswords() {

// Obtenemos los valores de los campos de contraseñas 
    clave1 = document.getElementById("floatingPassword1");
    clave2 = document.getElementById("floatingPassword2");
    //Verificamos si las constraseñas no coinciden 
    if (clave1.value !== "") {
        if (clave2.value !== "") {
            if (clave1.value !== clave2.value) {

// Si las constraseñas no coinciden muestra un mensaje 
                document.getElementById("error").classList.remove("ocultar");
                document.getElementById("error").classList.add("mostrar");
                document.getElementById("ok").classList.remove("mostrar");
                document.getElementById("ok").classList.add("ocultar");
                document.getElementById("login").disabled = true;
                document.getElementById("login").style = "border-color: grey !important; background-color: ghostwhite !important; color: grey !important;";
                return false;
            } else {

// Si las contraseñas coinciden oculta el mensaje de error
                document.getElementById("error").classList.remove("mostrar");
                document.getElementById("error").classList.add("ocultar");
                // Muestra un mensaje mencionando que las Contraseñas coinciden 
                document.getElementById("ok").classList.remove("ocultar");
                document.getElementById("ok").classList.add("mostrar");
                // Habilita el botón de login 
                document.getElementById("login").disabled = false;
                document.getElementById("login").style = "border-color: black !important; background-color: palevioletred !important; color: white !important";
                return true;
            }
        } else {
            document.getElementById("error").classList.remove("mostrar");
            document.getElementById("error").classList.add("ocultar");
            document.getElementById("ok").classList.remove("mostrar");
            document.getElementById("ok").classList.add("ocultar");
            document.getElementById("login").disabled = true;
            document.getElementById("login").style = "border-color: grey !important; background-color: ghostwhite !important; color: grey !important;";
        }
    } else
    {
        document.getElementById("error").classList.remove("mostrar");
        document.getElementById("error").classList.add("ocultar");
        document.getElementById("ok").classList.remove("mostrar");
        document.getElementById("ok").classList.add("ocultar");
        document.getElementById("login").disabled = true;
        document.getElementById("login").style = "border-color: grey !important; background-color: ghostwhite !important; color: grey !important;";
    }
}

function activarInput() {

    var elemento = document.getElementById("inputText");
    var index = document.getElementById('tipoHabitacion').selectedIndex;
    if (index === 4) {
        elemento.style = 'background-color: white;';
        elemento.removeAttribute('readonly');
        elemento.setAttribute('value', "");
        elemento.setAttribute('placeholder', 'Ingrese un valor entre 4 a 10');
    } else {
        elemento.style = 'background-color: whitesmoke;';
        elemento.setAttribute('readonly', 'true');
        elemento.setAttribute('value', index);
    }
}

function actualizarDatos(numeroID, precioXnoche, tipoHabitacion, nroPiso, inF, outF) {

    var correccionFechaOut = outF.split('-');
    var diaMas = parseInt(correccionFechaOut[2]) + 1;
    correccionFechaOut[2] = diaMas;
    var fechaCorregida = correccionFechaOut[0] + "-" + correccionFechaOut[1] + "-" + correccionFechaOut[2];

    document.getElementById("fechaDesde").disabled = false;
    document.getElementById("fechaHasta").disabled = false;
    document.getElementById("fechaDesde").min = fechaCorregida;
    document.getElementById("fechaDesde").value = fechaCorregida;
    document.getElementById("tipoHabitacion").value = tipoHabitacion;
    document.getElementById("precioXnoche").value = precioXnoche;
    document.getElementById("fila3").innerHTML = numeroID;
    document.getElementById("idHabitad").value = numeroID;
    document.getElementById("fila4").innerHTML = tipoHabitacion;
    document.getElementById("fila5").innerHTML = nroPiso;
    document.getElementById("fila8").innerHTML = precioXnoche;

}





function filtrarDatos() {
    var
            filter,
            table,
            tr,
            tdFiltro,
            tdDisponible,
            tdElegirID,
            tdElegirRadio,
            i,
            txtValue1,
            txtValue2,
            txtValue3,
            choice;

    choice = document.getElementById("filtroType").selectedIndex;
    filter = document.getElementById("filtroType").value;
    table = document.getElementById("tLabel");
    tr = table.getElementsByTagName("tr");

    if (choice !== 0) {
        for (i = 0; i < tr.length; i++) {
            tdFiltro = tr[i].getElementsByTagName("td")[3];
            tdElegirID = tr[i].getElementsByTagName("td")[0];
            if (tdFiltro) {
                txtValue1 = tdFiltro.textContent || tdFiltro.innerText;
                txtValue3 = tdElegirID.textContent || tdDisponible.innerText;
                tdElegirRadio = document.getElementById("numID_" + txtValue3);
                if (tdElegirRadio.checked === true) {
                    tdElegirRadio.checked = false;
                }
                if (txtValue1 === filter) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
                limpiar();
            }
        }
    } else {
        for (i = 0; i < tr.length; i++) {
            tdFiltro = tr[i].getElementsByTagName("td")[3];
            tdElegirID = tr[i].getElementsByTagName("td")[0];
            if (tdFiltro) {
                txtValue3 = tdElegirID.textContent || tdDisponible.innerText;

                tdElegirRadio = document.getElementById("numID_" + txtValue3);
                tr[i].style.display = "";
                if (tdElegirRadio.checked === true) {
                    tdElegirRadio.checked = false;
                    limpiar();
                }

            }
        }
    }
}

function limpiar() {
    document.getElementById("tipoHabitacion").value = "";
    document.getElementById("precioXnoche").value = "";
    document.getElementById("idHabitad").value = "";
    document.getElementById("fila3").innerHTML = "";
    document.getElementById("fila4").innerHTML = "";
    document.getElementById("fila5").innerHTML = "";
    document.getElementById("fila8").innerHTML = "";
}

function verificarFechas() {
    var fechaDesde = document.getElementById("fechaDesde");
    var fechaHasta = document.getElementById("fechaHasta");
    var precioXnoche = document.getElementById("precioXnoche").value;
    var precioTotal = document.getElementById("precioTotal");
    var total;
    var fecha1 = new Date(fechaDesde.value);
    var fecha2 = new Date(fechaHasta.value);
    if (fecha1 < fecha2) {
        let resta = fecha2.getTime() - fecha1.getTime();
        var dias = Math.floor(resta / (1000 * 60 * 60 * 24));
        total = dias * precioXnoche;
        precioTotal.setAttribute('value', total);
        fecha1.setDate(fecha1.getDate() + 1);
        fecha2.setDate(fecha2.getDate() + 1);
        document.getElementById("fila6").innerHTML = fecha1.toLocaleDateString();
        document.getElementById("fila7").innerHTML = fecha2.toLocaleDateString();
        document.getElementById("fila9").innerHTML = dias;
        document.getElementById("fila10").innerHTML = total;
    } else {
        alert("Las fechas IN/OUT son incorrectas.");
    }

}

function imprimir() {
    var divToPrint = document.getElementById("tabla2");
    newWin = window.open("");
    newWin.document.write(divToPrint.outerHTML);
    newWin.print();
    newWin.close();
}

function actualizarComprobante() {
    document.getElementById("fila1").innerHTML = document.getElementById("dni").value;
    document.getElementById("fila2").innerHTML = document.getElementById("nombre").value;
}

function verificarTodo() {
    if (document.getElementById("fila3").innerHTML !== "") {
        colorRestore("tipoHabitacion");
        colorRestore("precioXnoche");
        if (document.getElementById("fila10").innerHTML !== "") {
            colorRestore("precioTotal");
            document.getElementById("btnRegistrar").disabled = false;
            document.getElementById("btnSuccess").setAttribute('style', style = "box-shadow: 0 0 0 0 #80FF00;");
            document.getElementById("btnRegistrar").setAttribute('style', style = "box-shadow: 0 0 10px 2px #86b7fe;");
        } else {
            colorMove("precioTotal");


        }
    } else {
        colorMove("tipoHabitacion");
        colorMove("precioXnoche");
    }
}

function colorMove(id) {
    document.getElementById(id).scrollIntoView();
    document.getElementById(id).scrollIntoView(false);
    document.getElementById(id).scrollIntoView({block: "end"});
    document.getElementById(id).scrollIntoView({block: "end", behavior: "smooth"});
    document.getElementById(id).focus();
    document.getElementById(id).setAttribute('style', style = "box-shadow: 0 0 10px 2px #86b7fe;");
}

function colorRestore(id) {
    document.getElementById(id).scrollIntoView();
    document.getElementById(id).scrollIntoView(false);
    document.getElementById(id).scrollIntoView({block: "end"});
    document.getElementById(id).scrollIntoView({block: "end", behavior: "smooth"});
    document.getElementById(id).focus();
    document.getElementById(id).setAttribute('style', style = "box-shadow: 0 0 0 0 #80FF00;");
}

function greenGlow() {
    document.getElementById("btnSuccess").setAttribute('style', style = "box-shadow: 0 0 10px 2px #86b7fe;");
}

function verContra() {
    var tipo = document.getElementById("floatingPassword");
    if (tipo.type === "password") {
        tipo.type = "text";
    } else {
        tipo.type = "password";
    }
}
