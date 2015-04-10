package POJO;
// Generated 09/04/2015 21:22:21 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Estado generated by hbm2java
 */
public class Estado  implements java.io.Serializable {


     private int estadoCodigo;
     private String estadoSigla;
     private String estadoNome;
     private Set cidades = new HashSet(0);

    public Estado() {
    }

	
    public Estado(int estadoCodigo) {
        this.estadoCodigo = estadoCodigo;
    }
    public Estado(int estadoCodigo, String estadoSigla, String estadoNome, Set cidades) {
       this.estadoCodigo = estadoCodigo;
       this.estadoSigla = estadoSigla;
       this.estadoNome = estadoNome;
       this.cidades = cidades;
    }
   
    public int getEstadoCodigo() {
        return this.estadoCodigo;
    }
    
    public void setEstadoCodigo(int estadoCodigo) {
        this.estadoCodigo = estadoCodigo;
    }
    public String getEstadoSigla() {
        return this.estadoSigla;
    }
    
    public void setEstadoSigla(String estadoSigla) {
        this.estadoSigla = estadoSigla;
    }
    public String getEstadoNome() {
        return this.estadoNome;
    }
    
    public void setEstadoNome(String estadoNome) {
        this.estadoNome = estadoNome;
    }
    public Set getCidades() {
        return this.cidades;
    }
    
    public void setCidades(Set cidades) {
        this.cidades = cidades;
    }




}


