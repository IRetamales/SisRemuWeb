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
public class clsNacionalidad{
    private Integer intIdNacionalidad;
    private String strNombre;
    private Integer intHabilitado;
    
    public clsNacionalidad(Integer intIdNacionalidad, String strNombre){
        this.intIdNacionalidad=intIdNacionalidad;
        this.strNombre=strNombre;
    }
    
    public clsNacionalidad(){
        
    }

    public Integer getIdNacionalidad() {
        return intIdNacionalidad;
    }

    public void setIdNacionalidad(Integer intIdNacionalidad) {
        this.intIdNacionalidad = intIdNacionalidad;
    }

    public String getNombre( ) {
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
    
    public List<clsNacionalidad> LlenarNacionalidad(clsNacionalidad nacionalidad){
        List<clsNacionalidad> nac = new ArrayList<clsNacionalidad>();
        
        String strSql= "call listarnacionalidad";
        
        try{
            Conexion.getDbCon();
            ResultSet resultado = Conexion.db.query(strSql);
            while (resultado.next()) {
                nacionalidad = new clsNacionalidad();
                nacionalidad.setIdNacionalidad(resultado.getInt(1));
                nacionalidad.setNombre(resultado.getString(2));
                nac.add(nacionalidad);
            }        
        } catch (Exception e) {
            e.printStackTrace();
        } 
        return nac;
    }
    
    @Override
    public String toString(){
        return strNombre;
    }
    
    public String NombreNacionalidad(){
        String strSql= "Select nombre from tnacionalidad where idnacionalidad= (" + intIdNacionalidad + ");";
         
        try{
            Conexion.getDbCon();
            ResultSet resultado = Conexion.db.query(strSql);
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
    
    public ResultSet ListarNacionalidad(){
        String strSql= "Select * from tnacionalidad";
        
        try{         
            Conexion.getDbCon();                   
            return Conexion.db.query(strSql);      
        } catch (Exception e) {
            e.getMessage();    
        }
        return null;
    }
    
    public boolean ActualizarNacionalidad(){
        try{
            String strSql= "call actualizarnacionalidad (" + intIdNacionalidad + ", '" + strNombre + "', " + intHabilitado + ");";

            Conexion.getDbCon();
            Conexion.db.insert(strSql);
            return true;  
        } catch (Exception e) {
            e.getMessage();
            return false;
        }
    }
    
    public void CargaNacionalidad(){
        String strSql= "Select * from tnacionalidad where idnacionalidad= (" + intIdNacionalidad + ");";
         
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
    
    public boolean EliminarNacionalidad(){
        try{
            String strSql= "delete from tnacionalidad where idnacionalidad=" + intIdNacionalidad + ";";

            Conexion.getDbCon();
            Conexion.db.insert(strSql);
            return true;  
        } catch (Exception e) {
            e.getMessage();
            return false;
        }
    }
}
