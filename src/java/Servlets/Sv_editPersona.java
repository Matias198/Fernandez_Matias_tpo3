package Servlets;

import Logica.Controladora;
import Logica.Huesped;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Sv_editPersona", urlPatterns = {"/Sv_editPersona"})
public class Sv_editPersona extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int idHuesped = Integer.parseInt(request.getParameter("idP"));
        
        int dniHuesped = Integer.parseInt(request.getParameter("dni"));
        String nombreHuesped = request.getParameter("nombre");
        String apellidoHuesped = request.getParameter("apellido");
        String fechaNacHuesped = request.getParameter("fechaNac");
        String direccionHuesped = request.getParameter("direccion");
        String profesionHuesped = request.getParameter("cargo");
        
        Controladora control = new Controladora();
        Huesped huesped = control.buscarHuesped(idHuesped);
        
        huesped.setDniPersona(dniHuesped);
        huesped.setNombre(nombreHuesped);
        huesped.setApellido(apellidoHuesped);
        huesped.setFechaNac(fechaNacHuesped);
        huesped.setDireccion(direccionHuesped);
        huesped.setProfesion(profesionHuesped);
        
        control.editarHuesped(huesped);
        
        request.getSession().setAttribute("listaHuespedes", control.verHuespedes());
        response.sendRedirect("verHuespedes.jsp");
  
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        Controladora control = new Controladora();
        Huesped huesped = control.buscarHuesped(id);
        HttpSession misession = request.getSession();
        misession.setAttribute("huesped", huesped);
        response.sendRedirect("modHuesped.jsp");
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
