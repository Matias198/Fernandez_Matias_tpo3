package Logica;

import Persistencia.ControladoraPersistencia;
import java.util.List;

public class Controladora {

    ControladoraPersistencia ControlPersist = new ControladoraPersistencia();

    public void crearHuesped(int dniPersona, String nombre, String apellido, String fechaNac, String direccion, String profesion, Reserva reserva) {
        try {
            Huesped huesped = new Huesped();
            huesped.setDniPersona(dniPersona);
            huesped.setNombre(nombre);
            huesped.setApellido(apellido);
            huesped.setFechaNac(fechaNac);
            huesped.setDireccion(direccion);
            huesped.setProfesion(profesion);
            huesped.setReserva(reserva);
            ControlPersist.crearHuesped(huesped);
        } catch (Exception ex) {
            System.out.println("Error al crear objeto Huesped. Mensaje: " + ex.getMessage());
        }

    }

    public void crearEmpleado(int dniPersona, String nombre, String apellido, String fechaNac, String direccion, String cargo, Usuario usuario) {
        Empleado empleado = new Empleado();
        empleado.setDniPersona(dniPersona);
        empleado.setNombre(nombre);
        empleado.setApellido(apellido);
        empleado.setFechaNac(fechaNac);
        empleado.setDireccion(direccion);
        empleado.setCargo(cargo);
        empleado.setUser(usuario);
        ControlPersist.crearEmpleado(empleado);
    }

    public Usuario crearUsuario(int dniUsuario, String claveUsuario) {
        Usuario usuario = new Usuario();

        usuario.setUsuario(dniUsuario);
        usuario.setClave(claveUsuario);
        ControlPersist.crearUsuario(usuario);
        return usuario;
    }

    public boolean findUserPass(String usuario, String clave) {
        boolean salida = false;
        List<Usuario> listaUsuarios = ControlPersist.obtenerUsuarios();
        if (listaUsuarios != null) {
            for (int i = 0; i < listaUsuarios.size(); i++) {
                if (Integer.parseInt(usuario) == listaUsuarios.get(i).dniUsuario) {
                    if (clave.equals(listaUsuarios.get(i).clave)) {
                        salida = true;
                    }
                }
            }
        }
        return salida;
    }

    public List<Usuario> verUsuarios() {
        List<Usuario> listaUsuarios = ControlPersist.obtenerUsuarios();
        if (listaUsuarios != null) {
            return listaUsuarios;
        }
        return null;
    }

    public List<Huesped> verHuespedes() {
        List<Huesped> listaHuespedes = ControlPersist.obtenerHuespedes();
        if (listaHuespedes != null) {
            return listaHuespedes;
        }
        return null;
    }

    public List<Habitacion> verHabitaciones() {
        List<Habitacion> listaHabitaciones = ControlPersist.obtenerHabitaciones();
        if (listaHabitaciones != null) {
            return listaHabitaciones;
        }
        return null;
    }

    public void crearHabitacion(int numPiso, String nombreTematica, String tipoHabitacion, int cantPersonas, float precioXnoche, String disponible) {
        Habitacion habitacion = new Habitacion();
        habitacion.setNumPiso(numPiso);
        habitacion.setNombreTematica(nombreTematica);
        habitacion.setTipoHabitacion(tipoHabitacion);
        habitacion.setCantPersonas(cantPersonas);
        habitacion.setPrecioXnoche(precioXnoche);
        habitacion.setDisponible(disponible);
        ControlPersist.crearHabitacion(habitacion);
    }

    public void crearReserva(String checkIn, String checkOut, float precioTotal, Habitacion habitacion, Empleado empleado) {
        Reserva reserva = new Reserva();
        reserva.setCheckIn(checkIn);
        reserva.setCheckOut(checkOut);
        reserva.setPrecioTotal(precioTotal);
        reserva.setEmpleado(empleado);
        reserva.setHabitacion(habitacion);
        ControlPersist.crearReserva(reserva);
    }

    public Empleado buscarEmpleado(int idEmpleado) {
        List<Empleado> listaEmpleados = ControlPersist.obtenerEmpleados();
        if (listaEmpleados != null) {
            for (int i = 0; i < listaEmpleados.size(); i++) {
                if (idEmpleado == listaEmpleados.get(i).dniPersona) {
                    return listaEmpleados.get(i);
                }
            }
        }
        return null;
    }

    public Habitacion buscarHabitacion(int idHabitacion) {
        List<Habitacion> listaHabitacion = ControlPersist.obtenerHabitaciones();
        if (listaHabitacion != null) {
            for (int i = 0; i < listaHabitacion.size(); i++) {
                if (idHabitacion == listaHabitacion.get(i).idHabitacion) {
                    return listaHabitacion.get(i);
                }
            }
        }
        return null;
    }

    public Reserva buscarReserva(int idHabitacion, String checkIn, String checkOut) {
        List<Reserva> listaReserva = ControlPersist.obtenerReservas();
        if (listaReserva != null) {
            for (int i = 0; i < listaReserva.size(); i++) {
                if ((idHabitacion == listaReserva.get(i).getHabitacion().idHabitacion) && (checkIn == listaReserva.get(i).getCheckIn()) && (checkOut == listaReserva.get(i).getCheckOut())) {
                    return listaReserva.get(i);
                }
            }
        }
        return null;
    }

    public void borrarReserva(int idHabitacion, int idEmpleado) {
        List<Reserva> listaReserva = ControlPersist.obtenerReservas();
        if (listaReserva != null) {
            for (int i = 0; i < listaReserva.size(); i++) {
                if ((idHabitacion == listaReserva.get(i).getHabitacion().idHabitacion) && (idEmpleado == listaReserva.get(i).getEmpleado().dniPersona)) {
                    ControlPersist.borrarReserva(listaReserva.get(i).idReserva);
                }
            }
        }

    }
    public void borrarReservaId(int idReserva) {
        List<Reserva> listaReserva = ControlPersist.obtenerReservas();
        if (listaReserva != null) {
            for (int i = 0; i < listaReserva.size(); i++) {
                if (idReserva == listaReserva.get(i).getIdReserva()) {
                    ControlPersist.borrarReserva(idReserva);
                }
            }
        }

    }

    public List<Reserva> verReserva() {
        List<Reserva> listaReserva = ControlPersist.obtenerReservas();
        if (listaReserva != null) {
            return listaReserva;
        }
        return null;
    }
    
    public List<Empleado> verEmpleados() {
        List<Empleado> listaEmpleados = ControlPersist.obtenerEmpleados();
        if (listaEmpleados != null) {
            return listaEmpleados;
        }
        return null;
    }
    
    public void borrarHuesped(int idHuesped){
        ControlPersist.borrarHuesped(idHuesped);
    }
    
     public void borrarHabitacionId(int idHabitacion) {
        List<Habitacion> listaHabitacion = ControlPersist.obtenerHabitaciones();
        List<Huesped> listaHuesped = ControlPersist.obtenerHuespedes();
        
     
        if (listaHuesped != null){
            for (int i=0; i < listaHuesped.size(); i++){
                if (listaHuesped.get(i).getReserva().getHabitacion().getIdHabitacion() == idHabitacion){
                    int idHuesped = listaHuesped.get(i).getIdPersona();
                    int idReserva = listaHuesped.get(i).getReserva().getIdReserva();
                    borrarHuesped(idHuesped);
                    borrarReservaId(idReserva);
                }
            }
        }
        if (listaHabitacion != null) {
            for (int i = 0; i < listaHabitacion.size(); i++) {
                if (idHabitacion == listaHabitacion.get(i).getIdHabitacion()) {
                    ControlPersist.borrarHabitacion(idHabitacion);
                }
            }
        }
    }
     
     public Huesped buscarHuesped(int idHuesped){
         return ControlPersist.buscarHuesped(idHuesped);
     }

     
     public void editarHuesped(Huesped huesped) {
        ControlPersist.modificarHuesped(huesped);
    }
}
