package POJO;
// Generated 02/04/2015 21:42:12 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Cidade generated by hbm2java
 */
public class Cidade  implements java.io.Serializable {


     private String cidadeCodigo;
     private Estado estado;
     private String cidadeNome;
     private Set bairros = new HashSet(0);

    public Cidade() {
    }

	
    public Cidade(String cidadeCodigo) {
        this.cidadeCodigo = cidadeCodigo;
    }
    public Cidade(String cidadeCodigo, Estado estado, String cidadeNome, Set bairros) {
       this.cidadeCodigo = cidadeCodigo;
       this.estado = estado;
       this.cidadeNome = cidadeNome;
       this.bairros = bairros;
    }
   
    public String getCidadeCodigo() {
        return this.cidadeCodigo;
    }
    
    public void setCidadeCodigo(String cidadeCodigo) {
        this.cidadeCodigo = cidadeCodigo;
    }
    public Estado getEstado() {
        return this.estado;
    }
    
    public void setEstado(Estado estado) {
        this.estado = estado;
    }
    public String getCidadeNome() {
        return this.cidadeNome;
    }
    
    public void setCidadeNome(String cidadeNome) {
        this.cidadeNome = cidadeNome;
    }
    public Set getBairros() {
        return this.bairros;
    }
    
    public void setBairros(Set bairros) {
        this.bairros = bairros;
    }




}


