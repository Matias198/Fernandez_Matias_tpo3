package Logica;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity

public class Usuario implements Serializable {
    
    @Id
    int dniUsuario;
    
    @Basic
    String clave;

    public Usuario() {
    }

    public Usuario(int usuario, String clave) {
        this.dniUsuario = usuario;
        this.clave = clave;
    }

    public int getUsuario() {
        return dniUsuario;
    }

    public void setUsuario(int usuario) {
        this.dniUsuario = usuario;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }
}
