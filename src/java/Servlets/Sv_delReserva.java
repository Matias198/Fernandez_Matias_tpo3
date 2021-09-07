package Servlets;

import Logica.Controladora;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Sv_delReserva", urlPatterns = {"/Sv_delReserva"})
public class Sv_delReserva extends HttpServlet {

    
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
        int id = Integer.parseInt(request.getParameter("id"));
        int idH = Integer.parseInt(request.getParameter("idH"));
        
        Controladora control = new Controladora();
        control.borrarHuesped(idH);
        control.borrarReservaId(id);
        request.getSession().setAttribute("listaReservas", control.verReserva());
        request.getSession().setAttribute("listaHuespedes", control.verHuespedes());
        response.sendRedirect("verReservas.jsp");
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
