package Servlets;

import Logica.Controladora;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Sv_mainLogin", urlPatterns = {"/Sv_mainLogin"})
public class Sv_mainLogin extends HttpServlet {

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
        //-----------INICIO LOGIN------------
        Controladora control = new Controladora();
        if (control.verUsuarios().isEmpty() == false){
            //-- Trae datos de usuario y contraseña:
            String usuario = request.getParameter("usuario");
            String contrasenia = request.getParameter("clave");

            //-- Crea controladora y autorización:
            
            boolean auth = control.findUserPass(usuario, contrasenia);

            //-- Obtiene sesion si el login es correcto,
            //-- Asigna Usuario y Contraseña para validar:
            if (auth == true) {
                HttpSession httpSession = request.getSession(true);
                httpSession.setAttribute("usuario", usuario);
                httpSession.setAttribute("clave", contrasenia);
                response.sendRedirect("mainMenu.jsp");
            } else {
                response.sendRedirect("mainLogin.jsp");
            }
        }
        else{
            response.sendRedirect("mainLogin.jsp");
        }

        //-------------FIN LOGIN-------------        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
