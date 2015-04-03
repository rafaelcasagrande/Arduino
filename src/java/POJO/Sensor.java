package POJO;
// Generated 02/04/2015 21:42:12 by Hibernate Tools 4.3.1



/**
 * Sensor generated by hbm2java
 */
public class Sensor  implements java.io.Serializable {


     private Integer sensorCodigo;
     private Logradouro logradouro;
     private String sensorIp;
     private String sensorLongitude;
     private String sensorLatitude;
     private String sensorNumeroLogradouro;

    public Sensor() {
    }

    public Sensor(Logradouro logradouro, String sensorIp, String sensorLongitude, String sensorLatitude, String sensorNumeroLogradouro) {
       this.logradouro = logradouro;
       this.sensorIp = sensorIp;
       this.sensorLongitude = sensorLongitude;
       this.sensorLatitude = sensorLatitude;
       this.sensorNumeroLogradouro = sensorNumeroLogradouro;
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
    public String getSensorIp() {
        return this.sensorIp;
    }
    
    public void setSensorIp(String sensorIp) {
        this.sensorIp = sensorIp;
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




}


