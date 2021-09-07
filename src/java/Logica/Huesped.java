package Logica;

import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.OneToOne;


@Entity

public class Huesped extends Persona{
    
    @Basic
    String profesion;
    @OneToOne
    Reserva reserva;

    public Huesped() {
    }

    public Huesped(String profesion, Reserva reserva, int idPersona, int dniPersona, String nombre, String apellido, String fechaNac, String direccion) {
        super(idPersona, dniPersona, nombre, apellido, fechaNac, direccion);
        this.profesion = profesion;
        this.reserva = reserva;
    }

    public String getProfesion() {
        return profesion;
    }

    public void setProfesion(String profesion) {
        this.profesion = profesion;
    }

    public Reserva getReserva() {
        return reserva;
    }

    public void setReserva(Reserva reserva) {
        this.reserva = reserva;
    }

    

}
