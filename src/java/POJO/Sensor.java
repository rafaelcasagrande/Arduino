package POJO;
// Generated 09/04/2015 21:22:21 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Sensor generated by hbm2java
 */
public class Sensor  implements java.io.Serializable {


     private Integer sensorCodigo;
     private Logradouro logradouro;
     private String sensorMacAddress;
     private String sensorLongitude;
     private String sensorLatitude;
     private String sensorNumeroLogradouro;
     private Set registros = new HashSet(0);

    public Sensor() {
    }

    public Sensor(Logradouro logradouro, String sensorMacAddress, String sensorLongitude, String sensorLatitude, String sensorNumeroLogradouro, Set registros) {
       this.logradouro = logradouro;
       this.sensorMacAddress = sensorMacAddress;
       this.sensorLongitude = sensorLongitude;
       this.sensorLatitude = sensorLatitude;
       this.sensorNumeroLogradouro = sensorNumeroLogradouro;
       this.registros = registros;
    }
   
    public Integer getSensorCodigo() {
        return this.sensorCodigo;
    }
    
    public void setSensorCodigo(Integer sensorCodigo) {
        this.sensorCodigo = sensorCodigo;
    }
    public Logradouro getLogradouro() {
        return this.logradouro;
    }
    
    public void setLogradouro(Logradouro logradouro) {
        this.logradouro = logradouro;
    }
    public String getSensorMacAddress() {
        return this.sensorMacAddress;
    }
    
    public void setSensorMacAddress(String sensorMacAddress) {
        this.sensorMacAddress = sensorMacAddress;
    }
    public String getSensorLongitude() {
        return this.sensorLongitude;
    }
    
    public void setSensorLongitude(String sensorLongitude) {
        this.sensorLongitude = sensorLongitude;
    }
    public String getSensorLatitude() {
        return this.sensorLatitude;
    }
    
    public void setSensorLatitude(String sensorLatitude) {
        this.sensorLatitude = sensorLatitude;
    }
    public String getSensorNumeroLogradouro() {
        return this.sensorNumeroLogradouro;
    }
    
    public void setSensorNumeroLogradouro(String sensorNumeroLogradouro) {
        this.sensorNumeroLogradouro = sensorNumeroLogradouro;
    }
    public Set getRegistros() {
        return this.registros;
    }
    
    public void setRegistros(Set registros) {
        this.registros = registros;
    }




}


