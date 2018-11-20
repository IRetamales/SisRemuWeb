/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.Conexion;

/**
 *
 * @author Sylar
 */
public class clsTipoContrato{
    Integer intId;
    String strNombre;
    Integer intHabilitado;
        
    public clsTipoContrato(Integer intId, String strNombre){
        this.intId=intId;
        this.strNombre=strNombre;
    }
    
    public clsTipoContrato(){
        
    }

    public Integer getId() {
        return intId;
    }

    public void setId(Integer intId) {
        this.intId = intId;
    }

    public String getNombre() {
        return strNombre;
    }

    public void setNombre(String strNombre) {
        this.strNombre = strNombre;
    }
    
    public Integer getHabilitado() {
        return intHabilitado;
    }

    public void setHabilitado(Integer intHabilitado) {
        this.intHabilitado = intHabilitado;
    }
    
    public List<clsTipoContrato> LlenaTipoContrato(clsTipoContrato tipocontrato){
        String strSql= "call listartiposcontrato";
        List<clsTipoContrato> con = new ArrayList<clsTipoContrato>();
        
        try{
            Conexion.getDbCon();
            ResultSet resultado = Conexion.db.query(strSql);
            while (resultado.next()){
                tipocontrato = new clsTipoContrato();
                tipocontrato.setId(resultado.getInt("idtipocontrato"));
                tipocontrato.setNombre(resultado.getString("nombre"));
                con.add(tipocontrato);
            }         
        }  catch (Exception e) {
            e.printStackTrace();
        } 
        return con;
    }
    
    @Override
    public String toString(){
        return strNombre;
    }
    
    public ResultSet ListarTipoContrato(){
        String strSql= "Select * from ttipocontrato";
        
        try{         
            Conexion.getDbCon();
            return Conexion.db.query(strSql);       
        } catch (Exception e) {
            e.getMessage();    
        }
        return null;
    }
    
    public void CargarTipoContrato(){
        String strSql= "call cargatipocontrato (" + intId + ");";
         
        try{
            Conexion.getDbCon();                  
            ResultSet resultado = Conexion.db.query(strSql);
            if (resultado.next()){
                strNombre = resultado.getString("nombre");
                intHabilitado=resultado.getInt("Habilitado");
            }
        } catch (Exception e) {
            e.getMessage();
        }
    }
    
    public boolean ActualizarTipoContrato(){
        try{
            String strSql= "call actualizartipocontrato (" + intId + ", '" + strNombre + "', " + intHabilitado + ");";

            Conexion.getDbCon();
            Conexion.db.insert(strSql);
            return true;  
        } catch (Exception e) {
            e.getMessage();
            return false;
        }
    }
    
    public boolean EliminaTipoContrato(){
        try{
            String strSql= "delete from ttipocontrato where idtipocontrato=" + intId + ";";

            Conexion.getDbCon();
            Conexion.db.insert(strSql);
            return true;  
        } catch (Exception e) {
            e.getMessage();
            return false;
        }
    }
    /*
    public boolean LimpiarTipoContrato(){
        String strSql= "delete from ttipocontrato";
      
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
