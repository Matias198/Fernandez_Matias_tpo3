package Servlets;

import Logica.Controladora;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Sv_delPersona", urlPatterns = {"/Sv_delPersona"})
public class Sv_delPersona extends HttpServlet {


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
        int idr = Integer.parseInt(request.getParameter("idr"));
        
        Controladora control = new Controladora();
        control.borrarHuesped(id);
        control.borrarReservaId(idr);
        request.getSession().setAttribute("listaHuespedes", control.verHuespedes());
        response.sendRedirect("verHuespedes.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
