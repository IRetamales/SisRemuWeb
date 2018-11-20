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
 * @author Articuno
 */
public class clsTipoTrabajador{
    private Integer intIdTipoTrabajador;
    private String strNombre;
    private Integer intHabilitado;
    
    public clsTipoTrabajador(Integer intTipoTrabajador, String strNombre){
        this.intIdTipoTrabajador=intTipoTrabajador;
        this.strNombre=strNombre;
    }
    
    public clsTipoTrabajador(){
        
    }

    public Integer getIdTipoTrabajador() {
        return intIdTipoTrabajador;
    }

    public void setIdTipoTrabajador(Integer intIdTipoTrabajador) {
        this.intIdTipoTrabajador = intIdTipoTrabajador;
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
    
    public List<clsTipoTrabajador> LlenaTipoTrabajador(clsTipoTrabajador tipotrabajador){
        List<clsTipoTrabajador> tra = new ArrayList<clsTipoTrabajador>();
        String strSql= "call listartipotrabajador";
        
        try{
            Conexion.getDbCon();
            ResultSet resultado = Conexion.db.query(strSql);
            while (resultado.next()){
                tipotrabajador = new clsTipoTrabajador();
                tipotrabajador.setIdTipoTrabajador(resultado.getInt(1));
                tipotrabajador.setNombre(resultado.getString(2));
                tra.add(tipotrabajador);
            }         
        } catch (Exception e) {
            e.getMessage();
        }
        return tra;
    }
    
    @Override
    public String toString(){
        return strNombre;
    }
    
    public ResultSet ListarTipoTrabajador(){
        String strSql= "Select * from ttipotrabajador";
        
        try{         
            Conexion.getDbCon();                   
            return Conexion.db.query(strSql);      
        } catch (Exception e) {
            e.getMessage();    
        }
        return null;
    }
    
    public boolean ActualizarTipoTrabajador(){
        try{
            String strSql= "call actualizartipotrabajador (" + intIdTipoTrabajador + ", '" + strNombre + "', " + intHabilitado + ");";

            Conexion.getDbCon();
            Conexion.db.insert(strSql);
            return true;  
        } catch (Exception e) {
            e.getMessage();
            return false;
        }
    }
    
    public void CargaTipoTrabajador(){
        String strSql= "Select * from ttipotrabajador where idtipotrabajador= " + intIdTipoTrabajador + ";";
         
        try{
            Conexion.getDbCon();  
            ResultSet resultado = Conexion.db.query(strSql);
            if (resultado.next()){
                strNombre = resultado.getString("nombre");
                intHabilitado = resultado.getInt("habilitado");
            }
        } catch (Exception e) {
            e.getMessage();
        }
    }
    
    public boolean EliminarTipoTrabajador(){
        try{
            String strSql= "delete from ttipotrabajador where idtipotrabajador=" + intIdTipoTrabajador + ";";

            Conexion.getDbCon();
            Conexion.db.insert(strSql);
            return true;  
        } catch (Exception e) {
            e.getMessage();
            return false;
        }
    }
    
}
