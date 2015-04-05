package POJO;
// Generated 05/04/2015 09:40:23 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Logradouro generated by hbm2java
 */
public class Logradouro  implements java.io.Serializable {


     private int logradouroCodigo;
     private Bairro bairro;
     private Integer logradouroTipo;
     private String logradouroNome;
     private String logradouroCep;
     private Set sensors = new HashSet(0);
     private Set condutors = new HashSet(0);

    public Logradouro() {
    }

	
    public Logradouro(int logradouroCodigo) {
        this.logradouroCodigo = logradouroCodigo;
    }
    public Logradouro(int logradouroCodigo, Bairro bairro, Integer logradouroTipo, String logradouroNome, String logradouroCep, Set sensors, Set condutors) {
       this.logradouroCodigo = logradouroCodigo;
       this.bairro = bairro;
       this.logradouroTipo = logradouroTipo;
       this.logradouroNome = logradouroNome;
       this.logradouroCep = logradouroCep;
       this.sensors = sensors;
       this.condutors = condutors;
    }
   
    public int getLogradouroCodigo() {
        return this.logradouroCodigo;
    }
    
    public void setLogradouroCodigo(int logradouroCodigo) {
        this.logradouroCodigo = logradouroCodigo;
    }
    public Bairro getBairro() {
        return this.bairro;
    }
    
    public void setBairro(Bairro bairro) {
        this.bairro = bairro;
    }
    public Integer getLogradouroTipo() {
        return this.logradouroTipo;
    }
    
    public void setLogradouroTipo(Integer logradouroTipo) {
        this.logradouroTipo = logradouroTipo;
    }
    public String getLogradouroNome() {
        return this.logradouroNome;
    }
    
    public void setLogradouroNome(String logradouroNome) {
        this.logradouroNome = logradouroNome;
    }
    public String getLogradouroCep() {
        return this.logradouroCep;
    }
    
    public void setLogradouroCep(String logradouroCep) {
        this.logradouroCep = logradouroCep;
    }
    public Set getSensors() {
        return this.sensors;
    }
    
    public void setSensors(Set sensors) {
        this.sensors = sensors;
    }
    public Set getCondutors() {
        return this.condutors;
    }
    
    public void setCondutors(Set condutors) {
        this.condutors = condutors;
    }




}


