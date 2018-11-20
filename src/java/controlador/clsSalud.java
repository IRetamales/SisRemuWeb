/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.Conexion;
//import javax.swing.*;

/**
 *
 * @author Sylar
 */
public class clsSalud{
    private Integer intIdInstitucion;
    private String strNombre;
    
    public clsSalud(Integer intIdInstitucion, String strNombre){
        this.intIdInstitucion=intIdInstitucion;
        this.strNombre=strNombre;
    }
    
    public clsSalud(){
        
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
    
    public List<clsSalud> ListarInstitucionSalud(clsSalud salud){
        List<clsSalud> sal = new ArrayList<clsSalud>();
        
        String strSql= "call listarinstitucionsalud";
        
        try{
            Conexion.getDbCon();
            ResultSet resultado = Conexion.db.query(strSql);
            while (resultado.next()) {
                salud = new clsSalud();
                salud.setIdInstitucion(resultado.getInt(1));
                salud.setNombre(resultado.getString(2));
                sal.add(salud);
            }        
        } catch (Exception e) {
            e.printStackTrace();
        } 
        return sal;
    }
    
    @Override
    public String toString(){
        return strNombre;
    }
    
    public ResultSet ListarSalud(){
        String strSql= "Select * from tsalud";
        
        try{         
            Conexion.getDbCon();
            return Conexion.db.query(strSql);       
        } catch (Exception e) {
            e.getMessage();    
        }
        return null;
    }
    
    public boolean ActualizarSalud(){
        try{
            String strSql= "call actualizarsalud (" + intIdInstitucion + ", '" + strNombre + "');";
            Conexion.getDbCon();
            Conexion.db.insert(strSql);
            return true;  
        } catch (Exception e) {
            e.getMessage();
            return false;
        }
    }
    
    public void CargaInstitucionSalud(){
        String strSql= "call cargarInstitucionSalud (" + intIdInstitucion + ");";
        
        try{
            Conexion.getDbCon();
            ResultSet resultado = Conexion.db.query(strSql);
            while (resultado.next()) {
                intIdInstitucion=resultado.getInt(1);
                strNombre=resultado.getString(2);
            }        
        } catch (Exception e) {
            e.printStackTrace();
        } 
    }
    
    public boolean EliminaSalud(){
        try{
            String strSql= "delete from tsalud where idInstitucion=" + intIdInstitucion + ";";
            Conexion.getDbCon();
            Conexion.db.insert(strSql);
            return true;  
        } catch (Exception e) {
            e.getMessage();
            return false;
        }
    }
    /*
    public String NombreInstitucionSalud(){
        String strSql= "call nombreinstitucionsalud (" + intIdInstitucion + ");";
         
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
    
    
    
    public boolean LimpiarSalud(){
        String strSql= "delete from tsalud";
      
        try{
            MysqlConnection.getDbCon();

            MysqlConnection.db.insert(strSql);
            return true;  
        } catch (Exception e) {
            e.getMessage();
            return false;
        }
    }
    
    */
}
