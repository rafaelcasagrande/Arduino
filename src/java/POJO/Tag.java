package POJO;
// Generated 07/05/2015 20:45:22 by Hibernate Tools 4.3.1



/**
 * Tag generated by hbm2java
 */
public class Tag  implements java.io.Serializable {


     private Integer tagCodigo;
     private Veiculo veiculo;
     private String tagId;

    public Tag() {
    }

    public Tag(Veiculo veiculo, String tagId) {
       this.veiculo = veiculo;
       this.tagId = tagId;
    }
   
    public Integer getTagCodigo() {
        return this.tagCodigo;
    }
    
    public void setTagCodigo(Integer tagCodigo) {
        this.tagCodigo = tagCodigo;
    }
    public Veiculo getVeiculo() {
        return this.veiculo;
    }
    
    public void setVeiculo(Veiculo veiculo) {
        this.veiculo = veiculo;
    }
    public String getTagId() {
        return this.tagId;
    }
    
    public void setTagId(String tagId) {
        this.tagId = tagId;
    }




}


