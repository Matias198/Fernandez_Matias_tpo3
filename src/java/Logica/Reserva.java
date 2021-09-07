
package Logica;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class Reserva implements Serializable {
    
    @Id
    @GeneratedValue (strategy = GenerationType.AUTO)
    int idReserva;
    
    @Basic
    String checkIn;
    String checkOut;
    float precioTotal;
    
    @OneToOne
    Habitacion habitacion;
    @OneToOne
    Empleado empleado;

    public Reserva() {
    }

    public Reserva(int idReserva, String checkIn, String checkOut, float precioTotal, Habitacion habitacion, Empleado empleado, Huesped huesped) {
        this.idReserva = idReserva;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
        this.precioTotal = precioTotal;
        this.habitacion = habitacion;
        this.empleado = empleado;
    }

    public int getIdReserva() {
        return idReserva;
    }

    public void setIdReserva(int idReserva) {
        this.idReserva = idReserva;
    }

    public String getCheckIn() {
        return checkIn;
    }

    public void setCheckIn(String checkIn) {
        this.checkIn = checkIn;
    }

    public String getCheckOut() {
        return checkOut;
    }

    public void setCheckOut(String checkOut) {
        this.checkOut = checkOut;
    }

    public float getPrecioTotal() {
        return precioTotal;
    }

    public void setPrecioTotal(float precioTotal) {
        this.precioTotal = precioTotal;
    }

    public Habitacion getHabitacion() {
        return habitacion;
    }

    public void setHabitacion(Habitacion habitacion) {
        this.habitacion = habitacion;
    }

    public Empleado getEmpleado() {
        return empleado;
    }

    public void setEmpleado(Empleado empleado) {
        this.empleado = empleado;
    }

}
