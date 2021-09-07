package Servlets;

import Logica.Controladora;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Sv_regHuesped", urlPatterns = {"/Sv_regHuesped"})
public class Sv_regHuesped extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //codigo Get aca:

        //processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Controladora control = new Controladora();
        
        //-----------CREAR RESERVA------------
        
        int usuario = Integer.parseInt(request.getParameter("dniEmp"));
        int idHabitacion = Integer.parseInt(request.getParameter("idHabitadName"));
        
        String tipoHabitacion = request.getParameter("tipoHabitacionName");
        float precioXnoche = Float.parseFloat(request.getParameter("precioXnocheName"));
        String checkIn = request.getParameter("fechaDesdeName");
        
        String checkOut = request.getParameter("fechaHastaName");
        float precioTotal = Float.parseFloat(request.getParameter("precioTotalName"));
        

        request.getSession().setAttribute("tipoHabitacionName", tipoHabitacion);
        request.getSession().setAttribute("precioXnocheName", precioXnoche);
        request.getSession().setAttribute("fechaDesdeName", checkIn);
        request.getSession().setAttribute("fechaHastaName", checkOut);
        request.getSession().setAttribute("precioTotalName", precioTotal);
        
        try{
            control.crearReserva(checkIn, checkOut, precioTotal, control.buscarHabitacion(idHabitacion), control.buscarEmpleado(usuario));
            
        }catch(Exception ex){
            System.out.println("Error reserva: " + ex.getMessage());
            response.sendRedirect("mainMenu.jsp");
        }
        
        //-----------CREAR HUESPED------------
        
        int dniHuesped = Integer.parseInt(request.getParameter("dni"));
        String nombreHuesped = request.getParameter("nombre");
        String apellidoHuesped = request.getParameter("apellido");
        String fechaNacHuesped = request.getParameter("fechaNac");
        String direccionHuesped = request.getParameter("direccion");
        String profesionHuesped = request.getParameter("profesion");

        request.getSession().setAttribute("dni", dniHuesped);
        request.getSession().setAttribute("nombre", nombreHuesped);
        request.getSession().setAttribute("apellido", apellidoHuesped);
        request.getSession().setAttribute("fechaNac", fechaNacHuesped);
        request.getSession().setAttribute("direccion", direccionHuesped);
        request.getSession().setAttribute("profesion", profesionHuesped);

        
        try{
            control.crearHuesped(dniHuesped, nombreHuesped, apellidoHuesped, fechaNacHuesped, direccionHuesped, profesionHuesped, control.buscarReserva(idHabitacion, checkIn, checkOut));
            response.sendRedirect("mainMenu.jsp");
        }catch(IOException ex){
            control.borrarReserva(idHabitacion, usuario);
            System.out.println("Error huesped: " + ex.getMessage());
            response.sendRedirect("mainMenu.jsp");
        }


        //-------------FIN-------------
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
