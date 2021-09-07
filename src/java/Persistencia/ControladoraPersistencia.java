package Persistencia;

import Logica.Empleado;
import Logica.Habitacion;
import Logica.Huesped;
import Logica.Reserva;
import Logica.Usuario;
import Persistencia.exceptions.NonexistentEntityException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ControladoraPersistencia {

    HuespedJpaController huespedJPA = new HuespedJpaController();
    EmpleadoJpaController empleadoJPA = new EmpleadoJpaController();
    UsuarioJpaController usuarioJPA = new UsuarioJpaController();
    HabitacionJpaController habitacionJPA = new HabitacionJpaController();
    ReservaJpaController reservaJPA = new ReservaJpaController();

    public void crearHuesped(Huesped huesped) {
        try {
            huespedJPA.create(huesped);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void crearEmpleado(Empleado empleado) {
        try {
            empleadoJPA.create(empleado);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void crearUsuario(Usuario usuario) {
        try {
            usuarioJPA.create(usuario);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Usuario> obtenerUsuarios() {
        if (usuarioJPA.findUsuarioEntities() != null) {
            return usuarioJPA.findUsuarioEntities();
        }
        return null;
    }

    public List<Huesped> obtenerHuespedes() {
        if (huespedJPA.findHuespedEntities() != null) {
            return huespedJPA.findHuespedEntities();
        }
        return null;
    }

    public void crearHabitacion(Habitacion habitacion) {
        habitacionJPA.create(habitacion);
    }

    public List<Habitacion> obtenerHabitaciones() {
        if (habitacionJPA.findHabitacionEntities() != null) {
            return habitacionJPA.findHabitacionEntities();
        }
        return null;
    }

    public void crearReserva(Reserva reserva) {
        reservaJPA.create(reserva);
    }

    public List<Empleado> obtenerEmpleados() {
        if (empleadoJPA.findEmpleadoEntities() != null) {
            return empleadoJPA.findEmpleadoEntities();
        }
        return null;
    }   
        

    public List<Reserva> obtenerReservas() {
        if (reservaJPA.findReservaEntities()!= null) {
            return reservaJPA.findReservaEntities();
        }
        return null;
    }
    
    public void borrarReserva(int idReserva){
        try {
            reservaJPA.destroy(idReserva);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void editarHabitacion( Habitacion habitacion){
        try {
            habitacionJPA.edit(habitacion);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void borrarHuesped(int idHuesped){
        try {
            huespedJPA.destroy(idHuesped);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void borrarHabitacion(int idHabitacion){
        try {
            habitacionJPA.destroy(idHabitacion);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Huesped buscarHuesped (int idHuesped){
        return huespedJPA.findHuesped(idHuesped);
    }
    
    public void modificarHuesped (Huesped huesped){
        try {
            huespedJPA.edit(huesped);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
