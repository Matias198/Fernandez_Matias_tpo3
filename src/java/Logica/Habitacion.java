
package Logica;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Habitacion implements Serializable {
    
    @Id
    @GeneratedValue (strategy = GenerationType.AUTO)
    int idHabitacion;
    
    @Basic
    int numPiso;
    String nombreTematica;
    String tipoHabitacion;
    int cantPersonas;
    float precioXnoche;
    String disponible;

    public Habitacion() {
    }

    public Habitacion(int idHabitacion, int numPiso, String nombreTematica, String tipoHabitacion, int cantPersonas, float precioXnoche, String disponible) {
        this.idHabitacion = idHabitacion;
        this.numPiso = numPiso;
        this.nombreTematica = nombreTematica;
        this.tipoHabitacion = tipoHabitacion;
        this.cantPersonas = cantPersonas;
        this.precioXnoche = precioXnoche;
        this.disponible = disponible;
    }

    public int getIdHabitacion() {
        return idHabitacion;
    }

    public void setIdHabitacion(int idHabitacion) {
        this.idHabitacion = idHabitacion;
    }

    public int getNumPiso() {
        return numPiso;
    }

    public void setNumPiso(int numPiso) {
        this.numPiso = numPiso;
    }

    public String getNombreTematica() {
        return nombreTematica;
    }

    public void setNombreTematica(String nombreTematica) {
        this.nombreTematica = nombreTematica;
    }

    public String getTipoHabitacion() {
        return tipoHabitacion;
    }

    public void setTipoHabitacion(String tipoHabitacion) {
        this.tipoHabitacion = tipoHabitacion;
    }

    public int getCantPersonas() {
        return cantPersonas;
    }

    public void setCantPersonas(int cantPersonas) {
        this.cantPersonas = cantPersonas;
    }

    public float getPrecioXnoche() {
        return precioXnoche;
    }

    public void setPrecioXnoche(float precioXnoche) {
        this.precioXnoche = precioXnoche;
    }

    public String getDisponible() {
        return disponible;
    }

    public void setDisponible(String disponible) {
        this.disponible = disponible;
    }

    
    
}
