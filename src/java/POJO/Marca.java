package POJO;
// Generated 01/04/2015 21:00:11 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Marca generated by hbm2java
 */
public class Marca  implements java.io.Serializable {


     private String marcaCodigo;
     private String marcaNome;
     private Set modelos = new HashSet(0);

    public Marca() {
    }

	
    public Marca(String marcaCodigo) {
        this.marcaCodigo = marcaCodigo;
    }
    public Marca(String marcaCodigo, String marcaNome, Set modelos) {
       this.marcaCodigo = marcaCodigo;
       this.marcaNome = marcaNome;
       this.modelos = modelos;
    }
   
    public String getMarcaCodigo() {
        return this.marcaCodigo;
    }
    
    public void setMarcaCodigo(String marcaCodigo) {
        this.marcaCodigo = marcaCodigo;
    }
    public String getMarcaNome() {
        return this.marcaNome;
    }
    
    public void setMarcaNome(String marcaNome) {
        this.marcaNome = marcaNome;
    }
    public Set getModelos() {
        return this.modelos;
    }
    
    public void setModelos(Set modelos) {
        this.modelos = modelos;
    }




}


