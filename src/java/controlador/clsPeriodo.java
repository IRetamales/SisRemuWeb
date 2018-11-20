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
public class clsPeriodo {
    Integer intAño;
    Integer intMes;

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
    
    public ResultSet ListarPeriodos(){
        String strSql= "call listarperiodos;";
        
        try{
            Conexion.getDbCon();
            ResultSet resultado = Conexion.db.query(strSql);
            return resultado;
        } catch (Exception e) {
            e.getMessage();    
        }
        return null;
    }
    
    public void BuscaMaxPeriodo(){
        String strSql= "call buscamaxperiodo;";
        
        try{           
            ResultSet resultado = Conexion.db.query(strSql);
            while (resultado.next()){
                intAño=resultado.getInt("año");
                intMes=resultado.getInt("mes");
            }                     
        } catch (Exception e) {
            e.getMessage();    
        }
    }
    
    public boolean GuardarPeriodo(){
        String strSql= "call guardarperiodo (" + intAño + "," + intMes + ")";

        try{
            Conexion.getDbCon(); 
            Conexion.db.insert(strSql);
            return true;  
        } catch (Exception e) {
            e.getMessage();
            return false;
        }
    }
  /*     
    public boolean AsignaConceptosIniciales(Integer intOrden){
        String strSql="";
        String strMes;
        
        if (intMes<10){
            strMes="0"+String.valueOf(intMes);
        }else{
            strMes=String.valueOf(intMes);
        }
        switch (intOrden) {
            case 1: strSql= "call asignaconceptoAFPfuncionarios ('"+ strMes + "', " + intAño + ");";
                    break;
            case 2: strSql= "call asignavariablesfuncionarios ('"+ strMes + "', " + intAño + ");";
                    break;  
            case 3: strSql= "call asignaconceptoSaludfuncionarios ('"+ strMes + "', " + intAño + ");";
                    break;
            case 4: strSql= "call asignasueldobasefuncionario ('"+ strMes + "', " + intAño + ");";
                    break;
            case 5: strSql= "call asignagratificacionfuncionario ('"+ strMes + "', " + intAño + ");";
                    break;
            case 6: strSql= "call asignasegurocesantia ('"+ strMes + "', " + intAño + ");";
                    break;
        }
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
