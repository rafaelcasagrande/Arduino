package POJO;
// Generated 18/04/2015 23:57:11 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Modelo generated by hbm2java
 */
public class Modelo  implements java.io.Serializable {


     private String modeloCodigo;
     private Marca marca;
     private String modeloNome;
     private Set veiculos = new HashSet(0);

    public Modelo() {
    }

	
    public Modelo(String modeloCodigo) {
        this.modeloCodigo = modeloCodigo;
    }
    public Modelo(String modeloCodigo, Marca marca, String modeloNome, Set veiculos) {
       this.modeloCodigo = modeloCodigo;
       this.marca = marca;
       this.modeloNome = modeloNome;
       this.veiculos = veiculos;
    }
   
    public String getModeloCodigo() {
        return this.modeloCodigo;
    }
    
    public void setModeloCodigo(String modeloCodigo) {
        this.modeloCodigo = modeloCodigo;
    }
    public Marca getMarca() {
        return this.marca;
    }
    
    public void setMarca(Marca marca) {
        this.marca = marca;
    }
    public String getModeloNome() {
        return this.modeloNome;
    }
    
    public void setModeloNome(String modeloNome) {
        this.modeloNome = modeloNome;
    }
    public Set getVeiculos() {
        return this.veiculos;
    }
    
    public void setVeiculos(Set veiculos) {
        this.veiculos = veiculos;
    }




}


