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
public class clsVinculo{
    private Integer intIdVinculo;
    private String strNombre;
    private Integer intHabilitado;
    
    public clsVinculo(Integer intIdVinculo, String strNombre){
        this.intIdVinculo=intIdVinculo;
        this.strNombre=strNombre;
    }
    
    public clsVinculo(){
        
    }

    public Integer getIdVinculo() {
        return intIdVinculo;
    }

    public void setIdVinculo(Integer intIdVinculo) {
        this.intIdVinculo = intIdVinculo;
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
    
    public List<clsVinculo> LlenaVinculo(clsVinculo vinculo){
        List<clsVinculo> vin = new ArrayList<clsVinculo>();
        String strSql= "call listarvinculo";
        
        try{
            Conexion.getDbCon();
            ResultSet resultado = Conexion.db.query(strSql);
            while (resultado.next()){
                vinculo = new clsVinculo();
                vinculo.setIdVinculo(resultado.getInt("idvinculo"));
                vinculo.setNombre(resultado.getString("nombre"));
                vin.add(vinculo);
            }         
        } catch (Exception e) {
            e.printStackTrace();
        }
        return vin;
    }
    
    @Override
    public String toString(){
        return strNombre;
    }
    
    public ResultSet ListarVinculo(){
        String strSql= "Select * from tvinculo";
        
        try{         
            Conexion.getDbCon();                   
            return Conexion.db.query(strSql);      
        } catch (Exception e) {
            e.getMessage();    
        }
        return null;
    }
    
    public boolean ActualizarVinculo(){
        try{
            String strSql= "call actualizarvinculo (" + intIdVinculo + ", '" + strNombre + "', " + intHabilitado + ");";

            Conexion.getDbCon();
            Conexion.db.insert(strSql);
            return true;  
        } catch (Exception e) {
            e.getMessage();
            return false;
        }
    }
    
    public void CargaVinculo(){
        String strSql= "Select * from tvinculo where idvinculo= " + intIdVinculo + ";";
         
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
    
    public boolean EliminarVinculo(){
        try{
            String strSql= "delete from tvinculo where idvinculo=" + intIdVinculo + ";";

            Conexion.getDbCon();
            Conexion.db.insert(strSql);
            return true;  
        } catch (Exception e) {
            e.getMessage();
            return false;
        }
    }
}
