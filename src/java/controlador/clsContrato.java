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
public class clsContrato {
    private Integer intIdHistorial;
    private Integer intCargo;
    private String strRut;
    private String strFechaDesde;
    private String strFechaHasta;
    private Integer intSueldoBase;
    private Integer intSubsidioJoven;
    private Integer intTipoContrato;
    
    public Integer getIdHistorial() {
        return intIdHistorial;
    }

    public void setIdHistorial(Integer intIdHistorial) {
        this.intIdHistorial = intIdHistorial;
    }
    
    public Integer getCargo() {
        return intCargo;
    }

    public void setCargo(Integer intCargo) {
        this.intCargo = intCargo;
    }

    public String getRut() {
        return strRut;
    }

    public void setRut(String strRut) {
        this.strRut = strRut;
    }

    public String getFechaDesde() {
        return strFechaDesde;
    }

    public void setFechaDesde(String strFechaDesde) {
        this.strFechaDesde = strFechaDesde;
    }

    public String getFechaHasta() {
        return strFechaHasta;
    }

    public void setFechaHasta(String strFechaHasta) {
        this.strFechaHasta = strFechaHasta;
    }

    public Integer getSueldoBase() {
        return intSueldoBase;
    }

    public void setSueldoBase(Integer intSueldoBase) {
        this.intSueldoBase = intSueldoBase;
    }
    
    public Integer getSubsidioJoven() {
        return intSubsidioJoven;
    }

    public void setSubsidioJoven(Integer intSubsidioJoven) {
        this.intSubsidioJoven = intSubsidioJoven;
    }
    
    public Integer getTipoContrato() {
        return intTipoContrato;
    }

    public void setTipoContrato(Integer intTipoContrato) {
        this.intTipoContrato = intTipoContrato;
    }
    
    public boolean ActualizarHistorial(){
        try{
            
            String strDesde=strFechaDesde.substring(6, 10)+strFechaDesde.substring(3, 5)+strFechaDesde.substring(0, 2);
            String strHasta=strFechaHasta.substring(6, 10)+strFechaHasta.substring(3, 5)+strFechaHasta.substring(0, 2);

            String strSql= "call actualizarhistorialfuncionario (" + intIdHistorial + ", " + intCargo + ", '" + strRut + "', '" + strDesde + "', '" + strHasta + "', " + intSueldoBase + ", " + intSubsidioJoven + ", " + intTipoContrato + ");";

            Conexion.getDbCon();
            Conexion.db.insert(strSql);
            return true;  
        } catch (Exception e) {
            e.getMessage();
            return false;
        }
    }
    
    public ResultSet ListarContratos(){
        String strSql= "call listarhistorial('" + strRut + "');";
        
        try{
            Conexion.getDbCon();
            ResultSet resultado = Conexion.db.query(strSql);
            return resultado;
        } catch (Exception e) {
            e.getMessage();    
        }
        return null;
    }
    
    public boolean EliminaContrato(){
        String strSql= "delete from thistorialfuncionario where rut='" + strRut + "' and idhistorial=" + intIdHistorial + ";";
        
        try{
            Conexion.getDbCon();
            Conexion.db.insert(strSql);
            return true;
        } catch (Exception e) {
            e.getMessage();    
        }
        return false;
    }
    /*
    public boolean LimpiarHistorial(){
        String strSql= "delete from thistorialfuncionario where rut='" + strRut+ "'";
      
        try{
            Conexion.getDbCon();

            Conexion.db.insert(strSql);
            return true;  
        } catch (Exception e) {
            e.getMessage();
            return false;
        }
    }
    
    public boolean ActualizarHistorial(){
        try{
            
            String strDesde=strFechaDesde.substring(6, 10)+strFechaDesde.substring(3, 5)+strFechaDesde.substring(0, 2);
            String strHasta=strFechaHasta.substring(6, 10)+strFechaHasta.substring(3, 5)+strFechaHasta.substring(0, 2);

            String strSql= "call actualizarhistorialfuncionario (" + intIdHistorial + ", " + intCargo + ", '" + strRut + "', '" + strDesde + "', '" + strHasta + "', " + intSueldoBase + ", " + intSubsidioJoven + ", " + intTipoContrato + ");";

            Conexion.getDbCon();

            Conexion.db.insert(strSql);
            return true;  
        } catch (Exception e) {
            e.getMessage();
            return false;
        }
    }
    
   
    */
}
