package Servlets;

import Logica.Controladora;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Sv_regEmpleado", urlPatterns = {"/Sv_regEmpleado"})
public class Sv_regEmpleado extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //-----------INICIO------------
        //codigo Post aca:
        
        //traer datos registro empleado
        int dniEmpleado = Integer.parseInt(request.getParameter("dni"));
        String nombreEmpleado = request.getParameter("nombre");
        String apellidoEmpleado = request.getParameter("apellido");
        String fechaNacEmpleado = request.getParameter("fechaNac");
        String direccionEmpleado = request.getParameter("direccion");
        String cargoEmpleado = request.getParameter("cargo");
        String claveEmpleado = request.getParameter("clave1");
        
        //traer sesion y asignar atributos registro
        request.getSession().setAttribute("dni", dniEmpleado);
        request.getSession().setAttribute("nombre", nombreEmpleado);
        request.getSession().setAttribute("apellido", apellidoEmpleado);
        request.getSession().setAttribute("fechaNac", fechaNacEmpleado);
        request.getSession().setAttribute("direccion", direccionEmpleado);
        request.getSession().setAttribute("cargo", cargoEmpleado);
        request.getSession().setAttribute("clave1", claveEmpleado);
        request.getSession().setAttribute("clave2", claveEmpleado);

        //conecta con logica registro
        Controladora control = new Controladora();
        
        control.crearEmpleado(dniEmpleado, nombreEmpleado, apellidoEmpleado, fechaNacEmpleado, direccionEmpleado, cargoEmpleado, control.crearUsuario(dniEmpleado, claveEmpleado));

        //respuesta
        response.sendRedirect("mainLogin.jsp");

        //processRequest(request, response);
        //-------------FIN-------------
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
