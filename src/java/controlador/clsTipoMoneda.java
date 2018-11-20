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
public class clsTipoMoneda {
    Integer intIdTipoMoneda;
    String strNombre;
    Integer intHabilitado;
    
    public clsTipoMoneda(Integer intIdTipoMoneda, String strNombre){
        this.intIdTipoMoneda=intIdTipoMoneda;
        this.strNombre=strNombre;
    }
    
    public clsTipoMoneda(){
        
    }
    
    @Override
    public String toString(){
        return strNombre;
    }

    public Integer getIdTipoMoneda() {
        return intIdTipoMoneda;
    }

    public void setIdTipoMoneda(Integer intIdTipoMoneda) {
        this.intIdTipoMoneda = intIdTipoMoneda;
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
    
    public List<clsTipoMoneda> CargaComboTipoMoneda(clsTipoMoneda moneda){
        String strSql= "call listartipomoneda";
        List<clsTipoMoneda> mon = new ArrayList<clsTipoMoneda>();
        
        try{
            Conexion.getDbCon();
            ResultSet resultado = Conexion.db.query(strSql);
            while (resultado.next()){
                moneda = new clsTipoMoneda();
                moneda.setIdTipoMoneda(resultado.getInt("idtipomoneda"));
                moneda.setNombre(resultado.getString("nombre"));
                mon.add(moneda);
            }         
        }  catch (Exception e) {
            e.getMessage();
        }
        return mon;
    }
    
    public ResultSet ListarTipoMoneda(){
        String strSql= "Select * from ttipomoneda";
        try{         
            Conexion.getDbCon();
            return Conexion.db.query(strSql);         
        } catch (Exception e) {
            e.getMessage();    
        }
        return null;
    }
    
    public void CargaTipoMoneda(){
        String strSql= "call cargatipomoneda(" + intIdTipoMoneda + ");";
         
        try{
            Conexion.getDbCon();
            ResultSet resultado = Conexion.db.query(strSql);
            if (resultado.next()){
                strNombre= resultado.getString("nombre");
                intHabilitado=resultado.getInt("Habilitado");
            }
        } catch (Exception e) {
            e.getMessage();
        }
    }
        
    public boolean ActualizarTipoMoneda(){
        try{
            String strSql= "call actualizartipomoneda (" + intIdTipoMoneda+ ", '" + strNombre + "', " + intHabilitado + ");";

            Conexion.getDbCon();
            Conexion.db.insert(strSql);
            return true;  
        } catch (Exception e) {
            e.getMessage();
            return false;
        }
    }
    
    public boolean EliminarTipoMoneda(){
        try{
            String strSql= "delete from ttipomoneda where idtipomoneda=" + intIdTipoMoneda+ ";";

            Conexion.getDbCon();
            Conexion.db.insert(strSql);
            return true;  
        } catch (Exception e) {
            e.getMessage();
            return false;
        }
    }
    
    
    /*
    public boolean LimpiarTipoMoneda(){
        String strSql= "delete from ttipomoneda";
      
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
