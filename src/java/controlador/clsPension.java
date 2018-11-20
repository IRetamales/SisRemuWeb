/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.Conexion;

/**
 *
 * @author Sylar
 */
public class clsPension{
    private Integer intMes;
    private Integer intAño;
    private Integer intIdInstitucion;
    private String strNombre;
    private String strTipo;
    private Double dblValor;
    private String strSql;
    
    public clsPension(Integer intMes, Integer intAño, Integer intIdInstitucion, String strNombre, String strTipo){
        this.intMes=intMes;
        this.intAño=intAño;
        this.intIdInstitucion=intIdInstitucion;
        this.strNombre=strNombre;
        this.strTipo=strTipo;
    }
    
    public clsPension(){
        
    }
    
    public Integer getMes( ){
        return this.intMes;
    }
 
    public void setMes(Integer Mes){
        this.intMes = Mes;
    }
    
    public Integer getAño( ){
        return this.intAño;
    }
 
    public void setAño(Integer Año){
        this.intAño = Año;
    }
    
    public Integer getIdInstitucion( ){
        return this.intIdInstitucion;
    }
 
    public void setIdInstitucion(Integer IdInstitucion){
        this.intIdInstitucion = IdInstitucion;
    }
    
    public String getNombre( ){
        return this.strNombre;
    }
 
    public void setNombre(String Nombre){
        this.strNombre = Nombre;
    }
    
    public String getTipo( ){
        return this.strTipo;
    }
 
    public void setTipo(String Tipo){
        this.strTipo = Tipo;
    }
    
    public Double getValor(){
        return this.dblValor;
    }
 
    public void setValor(Double dValor){
        this.dblValor = dValor;
    }
    
    public List<clsPension> LlenaComboInstitucionPension(clsPension pension, String strTipo){
        strSql= "Select mes, año, idInstitucion, Nombre, tiposistema from tpension where Mes=" + intMes + " and Año=" + intAño + " and tiposistema='" + strTipo + "'";
        List<clsPension> pen = new ArrayList<clsPension>();
        
        try{
            Conexion.getDbCon();
            ResultSet resultado = Conexion.db.query(strSql);
            while (resultado.next()){
                pension = new clsPension();
                pension.setMes(resultado.getInt("mes"));
                pension.setAño(resultado.getInt("año"));
                pension.setIdInstitucion(resultado.getInt("idinstitucion"));
                pension.setNombre(resultado.getString("nombre"));
                pen.add(pension);
            }
        } catch (Exception e) {
            e.getMessage();
        }
        return pen;
    }
     
    @Override
    public String toString(){
        return strNombre;
    }
    
    public boolean ActualizarValorInstitucionPension(){
        strSql= "call actualizavalorinstitucionpension (" + intMes + ", " + intAño + ", " + intIdInstitucion + ", " + dblValor + ");";
        
        try{
            Conexion.getDbCon();
            Conexion.db.insert(strSql);
            return true;  
        } catch (Exception e) {
            e.getMessage();
            return false;
        }
    }
    
    public ResultSet ListarPension(){
        String strSql= "Select * from tpension where Mes=" + intMes + " and Año=" + intAño + "";
        
        try{         
            Conexion.getDbCon();              
            return Conexion.db.query(strSql);      
        } catch (Exception e) {
            e.getMessage();    
        }
        return null;
    }
    
    public void CargaInstitucionPension(Integer intID){
       strSql= "Select mes, año, idInstitucion, nombre, tiposistema, valor from tpension where Mes=" + intMes + " and Año=" + intAño + " and idinstitucion='" + intID + "'";
                
        try{
            Conexion.getDbCon();
            ResultSet resultado = Conexion.db.query(strSql);
            while (resultado.next()){
                intMes=resultado.getInt("mes");
                intAño= resultado.getInt("año");
                intIdInstitucion=resultado.getInt("idinstitucion");
                strNombre=resultado.getString("nombre");
                strTipo=resultado.getString("tiposistema");
                dblValor=resultado.getDouble("valor");
            }
        }catch(Exception e) {
            e.getMessage();
        }    
    }
        
    public boolean ActualizarPension(){
        try{
            String strSql= "call actualizarpension (" + intMes + ", " + intAño + ", " + intIdInstitucion + ", '" + strNombre + "', " + Integer.parseInt(strTipo) + ", " + dblValor + ");";

            Conexion.getDbCon();
            Conexion.db.insert(strSql);
            return true;  
        } catch (Exception e) {
            e.getMessage();
            return false;
        }
    }
    
    public boolean EliminaPension(){
        try{
            String strSql= "delete from tpension where mes=" + intMes + " and año=" + intAño + " and idinstitucion=" + intIdInstitucion + ";";

            Conexion.getDbCon();
            Conexion.db.insert(strSql);
            return true;  
        }catch (Exception e) {
            e.getMessage();
            return false;
        }
    }
    
    /*
      
    public String NombrePension(){
        strSql= "call nombrepension (" + intIdInstitucion + "," + intMes + ", " + intAño + ");";
        
        try{
            MysqlConnection.getDbCon();
            ResultSet resultado = MysqlConnection.db.query(strSql);
             if (resultado.next()){
                return resultado.getString("nombre");
            }else{
                return "";
            }
        } catch (Exception e) {
            e.getMessage();
            return "";
        }
    }
    
    public boolean LimpiarPension(){
        String strSql= "delete from tpension where Mes=" + intMes + " and Año=" + intAño + "";
      
        try{
            MysqlConnection.getDbCon();

            MysqlConnection.db.insert(strSql);
            return true;  
        } catch (Exception e) {
            e.getMessage();
            return false;
        }
    }
    

    }*/
}
