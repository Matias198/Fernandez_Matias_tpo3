package Servlets;

import Logica.Controladora;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Sv_regHabitacion", urlPatterns = {"/Sv_regHabitacion"})
public class Sv_regHabitacion extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        //-----------INICIO LOGIN------------
        //codigo Post aca:
        
        //traer datos registro empleado
        int numPiso = Integer.parseInt(request.getParameter("numPiso"));
        String temaHabitacion = request.getParameter("temaHabitacion");
        String tipoHabitacion = request.getParameter("tipoHabitacion");
        int cantMultiple = Integer.parseInt(request.getParameter("inputText"));
        float precioXnoche = Float.parseFloat(request.getParameter("precioXnoche"));
        String disponible = request.getParameter("disponible");

        //traer sesion y asignar atributos registro
        request.getSession().setAttribute("numPiso", numPiso);
        request.getSession().setAttribute("temaHabitacion", temaHabitacion);
        request.getSession().setAttribute("tipoHabitacion", tipoHabitacion);
        request.getSession().setAttribute("inputText", cantMultiple);
        request.getSession().setAttribute("precioXnoche", precioXnoche);
        request.getSession().setAttribute("disponible", disponible);

        //conecta con logica registro
        Controladora control = new Controladora();
        
        control.crearHabitacion(numPiso, temaHabitacion, tipoHabitacion, cantMultiple, precioXnoche, disponible);

        //respuesta
        response.sendRedirect("mainMenu.jsp");

        //processRequest(request, response);
        //-------------FIN LOGIN-------------
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
