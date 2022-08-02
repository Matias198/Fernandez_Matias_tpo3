package Logica;

import Logica.Empleado;
import Logica.Habitacion;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2022-08-01T23:36:11")
@StaticMetamodel(Reserva.class)
public class Reserva_ { 

    public static volatile SingularAttribute<Reserva, String> checkIn;
    public static volatile SingularAttribute<Reserva, Empleado> empleado;
    public static volatile SingularAttribute<Reserva, String> checkOut;
    public static volatile SingularAttribute<Reserva, Float> precioTotal;
    public static volatile SingularAttribute<Reserva, Integer> idReserva;
    public static volatile SingularAttribute<Reserva, Habitacion> habitacion;

}