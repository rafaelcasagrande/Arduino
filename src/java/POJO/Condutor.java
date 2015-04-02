package POJO;
// Generated 01/04/2015 21:00:11 by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Condutor generated by hbm2java
 */
public class Condutor  implements java.io.Serializable {


     private Integer condutorCodigo;
     private Logradouro logradouro;
     private String condutorHabilitacao;
     private String condutorCpf;
     private Date condutorDataNascimento;
     private String condutorNome;
     private String condutorNumeroLogradouro;
     private Set veiculos = new HashSet(0);

    public Condutor() {
    }

    public Condutor(Logradouro logradouro, String condutorHabilitacao, String condutorCpf, Date condutorDataNascimento, String condutorNome, String condutorNumeroLogradouro, Set veiculos) {
       this.logradouro = logradouro;
       this.condutorHabilitacao = condutorHabilitacao;
       this.condutorCpf = condutorCpf;
       this.condutorDataNascimento = condutorDataNascimento;
       this.condutorNome = condutorNome;
       this.condutorNumeroLogradouro = condutorNumeroLogradouro;
       this.veiculos = veiculos;
    }
   
    public Integer getCondutorCodigo() {
        return this.condutorCodigo;
    }
    
    public void setCondutorCodigo(Integer condutorCodigo) {
        this.condutorCodigo = condutorCodigo;
    }
    public Logradouro getLogradouro() {
        return this.logradouro;
    }
    
    public void setLogradouro(Logradouro logradouro) {
        this.logradouro = logradouro;
    }
    public String getCondutorHabilitacao() {
        return this.condutorHabilitacao;
    }
    
    public void setCondutorHabilitacao(String condutorHabilitacao) {
        this.condutorHabilitacao = condutorHabilitacao;
    }
    public String getCondutorCpf() {
        return this.condutorCpf;
    }
    
    public void setCondutorCpf(String condutorCpf) {
        this.condutorCpf = condutorCpf;
    }
    public Date getCondutorDataNascimento() {
        return this.condutorDataNascimento;
    }
    
    public void setCondutorDataNascimento(Date condutorDataNascimento) {
        this.condutorDataNascimento = condutorDataNascimento;
    }
    public String getCondutorNome() {
        return this.condutorNome;
    }
    
    public void setCondutorNome(String condutorNome) {
        this.condutorNome = condutorNome;
    }
    public String getCondutorNumeroLogradouro() {
        return this.condutorNumeroLogradouro;
    }
    
    public void setCondutorNumeroLogradouro(String condutorNumeroLogradouro) {
        this.condutorNumeroLogradouro = condutorNumeroLogradouro;
    }
    public Set getVeiculos() {
        return this.veiculos;
    }
    
    public void setVeiculos(Set veiculos) {
        this.veiculos = veiculos;
    }




}


