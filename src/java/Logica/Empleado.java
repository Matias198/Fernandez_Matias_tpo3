package Logica;

import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.OneToOne;

@Entity

public class Empleado extends Persona {
    
    @Basic
    String cargo;
    @OneToOne
    Usuario user;
    
       
    public Empleado() {
    }

    public Empleado(String cargo, Usuario user, int idPersona, int dniPersona, String nombre, String apellido, String fechaNac, String direccion) {
        super(idPersona, dniPersona, nombre, apellido, fechaNac, direccion);
        this.cargo = cargo;
        this.user = user;
    }
    
     public Usuario getUser() {
        return user;
    }

    public void setUser(Usuario user) {
        this.user = user;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }  
}
