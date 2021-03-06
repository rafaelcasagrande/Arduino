package POJO;
// Generated 07/05/2015 20:45:22 by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Ocorrencia generated by hbm2java
 */
public class Ocorrencia  implements java.io.Serializable {


     private Integer ocorrenciaCodigo;
     private Veiculo veiculo;
     private Date ocorrenciaInicio;
     private Date ocorrenciaTermino;
     private String ocorrenciaStatus;
     private Set registros = new HashSet(0);

    public Ocorrencia() {
    }

    public Ocorrencia(Veiculo veiculo, Date ocorrenciaInicio, Date ocorrenciaTermino, String ocorrenciaStatus, Set registros) {
       this.veiculo = veiculo;
       this.ocorrenciaInicio = ocorrenciaInicio;
       this.ocorrenciaTermino = ocorrenciaTermino;
       this.ocorrenciaStatus = ocorrenciaStatus;
       this.registros = registros;
    }
   
    public Integer getOcorrenciaCodigo() {
        return this.ocorrenciaCodigo;
    }
    
    public void setOcorrenciaCodigo(Integer ocorrenciaCodigo) {
        this.ocorrenciaCodigo = ocorrenciaCodigo;
    }
    public Veiculo getVeiculo() {
        return this.veiculo;
    }
    
    public void setVeiculo(Veiculo veiculo) {
        this.veiculo = veiculo;
    }
    public Date getOcorrenciaInicio() {
        return this.ocorrenciaInicio;
    }
    
    public void setOcorrenciaInicio(Date ocorrenciaInicio) {
        this.ocorrenciaInicio = ocorrenciaInicio;
    }
    public Date getOcorrenciaTermino() {
        return this.ocorrenciaTermino;
    }
    
    public void setOcorrenciaTermino(Date ocorrenciaTermino) {
        this.ocorrenciaTermino = ocorrenciaTermino;
    }
    public String getOcorrenciaStatus() {
        return this.ocorrenciaStatus;
    }
    
    public void setOcorrenciaStatus(String ocorrenciaStatus) {
        this.ocorrenciaStatus = ocorrenciaStatus;
    }
    public Set getRegistros() {
        return this.registros;
    }
    
    public void setRegistros(Set registros) {
        this.registros = registros;
    }




}


