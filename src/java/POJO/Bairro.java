package POJO;
// Generated 09/04/2015 21:22:21 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Bairro generated by hbm2java
 */
public class Bairro  implements java.io.Serializable {


     private String bairroCodigo;
     private Cidade cidade;
     private String bairroNome;
     private Set logradouros = new HashSet(0);

    public Bairro() {
    }

	
    public Bairro(String bairroCodigo) {
        this.bairroCodigo = bairroCodigo;
    }
    public Bairro(String bairroCodigo, Cidade cidade, String bairroNome, Set logradouros) {
       this.bairroCodigo = bairroCodigo;
       this.cidade = cidade;
       this.bairroNome = bairroNome;
       this.logradouros = logradouros;
    }
   
    public String getBairroCodigo() {
        return this.bairroCodigo;
    }
    
    public void setBairroCodigo(String bairroCodigo) {
        this.bairroCodigo = bairroCodigo;
    }
    public Cidade getCidade() {
        return this.cidade;
    }
    
    public void setCidade(Cidade cidade) {
        this.cidade = cidade;
    }
    public String getBairroNome() {
        return this.bairroNome;
    }
    
    public void setBairroNome(String bairroNome) {
        this.bairroNome = bairroNome;
    }
    public Set getLogradouros() {
        return this.logradouros;
    }
    
    public void setLogradouros(Set logradouros) {
        this.logradouros = logradouros;
    }




}


