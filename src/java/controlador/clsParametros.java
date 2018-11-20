/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.sql.ResultSet;
import modelo.Conexion;

/**
 *
 * @author Articuno
 */
public class clsParametros {
    Integer intAño;
    Integer intMes;
    String strCodigo;
    String strDescripcion;
    Double dblNumerico;
    String strAlfanumerico;
    String strFecha;
    String strSql;

    public Integer getAño() {
        return intAño;
    }

    public void setAño(Integer intAño) {
        this.intAño = intAño;
    }

    public Integer getMes() {
        return intMes;
    }

    public void setMes(Integer intMes) {
        this.intMes = intMes;
    }

    public String getCodigo() {
        return strCodigo;
    }

    public void setCodigo(String strCodigo) {
        this.strCodigo = strCodigo;
    }

    public String getDescripcion() {
        return strDescripcion;
    }

    public void setDescripcion(String strDescripcion) {
        this.strDescripcion = strDescripcion;
    }

    public Double getNumerico() {
        return dblNumerico;
    }

    public void setNumerico(Double dNumerico) {
        this.dblNumerico = dNumerico;
    }

    public String getAlfanumerico() {
        return strAlfanumerico;
    }

    public void setAlfanumerico(String strAlfanumerico) {
        this.strAlfanumerico = strAlfanumerico;
    }

    public String getFecha() {
        return strFecha;
    }

    public void setFecha(String strFecha) {
        this.strFecha = strFecha;
    }
    
    public boolean ActualizaValorNumero(){
        strSql= "update tparametros set numero=" + dblNumerico + " where año=" + intAño + " and mes=" + intMes + " and codigo='" + strCodigo + "';";
        
        try{
            Conexion.getDbCon();
            Conexion.db.insert(strSql);
            return true;  
        } catch (Exception e) {
            e.getMessage();
            return false;
        }
    }
    
    public boolean ActualizaValorAlfanumerico(){
        strSql= "update tparametros set alfanumerico=" + strAlfanumerico + " where año=" + intAño + " and mes=" + intMes + " and codigo='" + strCodigo + "';";
        
        try{
            Conexion.getDbCon();
            Conexion.db.insert(strSql);
            return true;  
        } catch (Exception e) {
            e.getMessage();
            return false;
        }
    }
    
    public boolean ActualizaValorFecha(){
        strSql= "update tparametros set fecha=" + strFecha + " where año=" + intAño + " and mes=" + intMes + " and codigo='" + strCodigo + "';";
        
        try{
            Conexion.getDbCon();
            Conexion.db.insert(strSql);
            return true;  
        } catch (Exception e) {
            e.getMessage();
            return false;
        }
    }
    
    public ResultSet ListarParametros(){
        String strSql= "Select * from tparametros where mes=" + intMes + " and año=" + intAño + ";";
        
        try{         
            Conexion.getDbCon();                   
            return Conexion.db.query(strSql);      
        } catch (Exception e) {
            e.getMessage();    
        }
        return null;
    }
    
    public boolean ActualizarParametro(){
        try{
            String strSql= "call actualizaparametro (" + intMes + ", " + intAño + ", '" + strCodigo + "', '" + strDescripcion + "', " + dblNumerico + ", '" + strAlfanumerico + "', '" + strFecha + "');";

            Conexion.getDbCon();
            Conexion.db.insert(strSql);
            return true;  
        } catch (Exception e) {
            e.getMessage();
            return false;
        }
    }
    
    public void CargaParametro(){
        String strSql= "Select * from tparametros where mes= " + intMes + " and año=" + intAño + " and codigo='" + strCodigo +"';";
         
        try{
            Conexion.getDbCon();  
            ResultSet resultado = Conexion.db.query(strSql);
            if (resultado.next()){
                strDescripcion=resultado.getString("descripcion");
                dblNumerico = resultado.getDouble("numero");
                strAlfanumerico = resultado.getString("alfanumerico");
                strFecha=resultado.getString("fecha");
            }
        } catch (Exception e) {
            e.getMessage();
        }
    }
    
    public boolean EliminarParametro(){
        try{
            String strSql= "delete from tparametros where mes=" + intMes + " and año= " + intAño + " and codigo='" + strCodigo + "';";

            Conexion.getDbCon();
            Conexion.db.insert(strSql);
            return true;  
        } catch (Exception e) {
            e.getMessage();
            return false;
        }
    }
}