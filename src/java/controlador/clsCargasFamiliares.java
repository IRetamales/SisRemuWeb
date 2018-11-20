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
public class clsCargasFamiliares {
    private String strIdTramo;
    private Integer intMes;
    private Integer intAño;
    private Integer intMonto;
    private Integer intTramoDesde;
    private Integer intTramoHasta;
    private String strSql;
    
    private String strRutCarga;
    private String strRutFuncionario;
    private String strNombre;
    private String strApellidoPaterno;
    private String strApellidoMaterno;
    private String strGenero;
    private String strFechaNacimiento;
    private String strFechaInicio;
    private Integer intVinculo;

    public Integer getVinculo() {
        return intVinculo;
    }

    public void setVinculo(Integer intVinculo) {
        this.intVinculo = intVinculo;
    }

    public String getGenero() {
        return strGenero;
    }

    public void setGenero(String strGenero) {
        this.strGenero = strGenero;
    }

    public String getRutCarga() {
        return strRutCarga;
    }

    public void setRutCarga(String strRutCarga) {
        this.strRutCarga = strRutCarga;
    }

    public String getRutFuncionario() {
        return strRutFuncionario;
    }

    public void setRutFuncionario(String strRutFuncionario) {
        this.strRutFuncionario = strRutFuncionario;
    }

    public String getNombre() {
        return strNombre;
    }

    public void setNombre(String strNombre) {
        this.strNombre = strNombre;
    }

    public String getApellidoPaterno() {
        return strApellidoPaterno;
    }

    public void setApellidoPaterno(String strApellidoPaterno) {
        this.strApellidoPaterno = strApellidoPaterno;
    }

    public String getApellidoMaterno() {
        return strApellidoMaterno;
    }

    public void setApellidoMaterno(String strApellidoMaterno) {
        this.strApellidoMaterno = strApellidoMaterno;
    }

    public String getFechaNacimiento() {
        return strFechaNacimiento;
    }

    public void setFechaNacimiento(String strFechaNacimiento) {
        this.strFechaNacimiento = strFechaNacimiento;
    }

    public String getFechaInicio() {
        return strFechaInicio;
    }

    public void setFechaInicio(String strFechaInicio) {
        this.strFechaInicio = strFechaInicio;
    }

    public String getFechaTermino() {
        return strFechaTermino;
    }

    public void setFechaTermino(String strFechaTermino) {
        this.strFechaTermino = strFechaTermino;
    }
    private String strFechaTermino;
    
    public String getIdTramo() {
        return strIdTramo;
    }

    public void setIdTramo(String strIdTramo) {
        this.strIdTramo = strIdTramo;
    }

    public Integer getMes() {
        return intMes;
    }

    public void setMes(Integer intMes) {
        this.intMes = intMes;
    }

    public Integer getAño() {
        return intAño;
    }

    public void setAño(Integer intAño) {
        this.intAño = intAño;
    }

    public Integer getMonto() {
        return intMonto;
    }

    public void setMonto(Integer intMonto) {
        this.intMonto = intMonto;
    }

    public Integer getTramoDesde() {
        return intTramoDesde;
    }

    public void setTramoDesde(Integer intTramoDesde) {
        this.intTramoDesde = intTramoDesde;
    }

    public Integer getTramoHasta() {
        return intTramoHasta;
    }

    public void setTramoHasta(Integer intTramoHasta) {
        this.intTramoHasta = intTramoHasta;
    }
    
    public boolean ActualizarCargasFamiliares(){
        try{
            String strNacimiento=strFechaNacimiento.substring(6, 10)+strFechaNacimiento.substring(3, 5)+strFechaNacimiento.substring(0, 2);
            String strDesde=strFechaInicio.substring(6, 10)+strFechaInicio.substring(3, 5)+strFechaInicio.substring(0, 2);
            String strHasta=strFechaTermino.substring(6, 10)+strFechaTermino.substring(3, 5)+strFechaTermino.substring(0, 2);

            String strSql= "call actualizarcargasfuncionario ('" + strRutCarga + "', '" + strRutFuncionario + "', '" + strNombre + "', '" + strApellidoPaterno + "', '" + strApellidoMaterno + "', '" + strNacimiento + "', '" + strGenero + "', '" + strDesde + "', '" + strHasta + "', " + intVinculo + ");";

            Conexion.getDbCon();     
            Conexion.db.insert(strSql);
            return true;  
        } catch (Exception e) {
            e.getMessage();
            return false;
        }
    }
    
    public ResultSet ListarCargasFamiliares(){
        String strSql= "call listarcargasfamiliares('" + strRutFuncionario + "');";
        
        try{
            Conexion.getDbCon();
            ResultSet resultado = Conexion.db.query(strSql);
            return resultado;
        } catch (Exception e) {
            e.getMessage();    
        }
        return null;
    }
    
    public boolean EliminarCarga(){
        String strSql= "delete from tcargafamiliar where rutcarga='" + strRutCarga + "';";
        
        try{
            Conexion.getDbCon();
            Conexion.db.insert(strSql);
            return true;
        } catch (Exception e) {
            e.getMessage();    
        }
        return false;
    }
    
    public boolean ActualizarValoresCargasFamiliares(){
        strSql= "call actualizavalorcargasfamiliares (" + intMes + ", " + intAño + ", '" + strIdTramo + "', " + intMonto + ", " + intTramoDesde + ", " + intTramoHasta + ");";
        
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
    public boolean ActualizarValoresCargasFamiliares(){
        strSql= "call actualizavalorcargasfamiliares (" + intMes + ", " + intAño + ", '" + strIdTramo + "', " + intMonto + ", " + intTramoDesde + ", " + intTramoHasta + ");";
        
        try{
            Conexion.getDbCon();     
            Conexion.db.insert(strSql);
            return true;  
        } catch (Exception e) {
            e.getMessage();
            return false;
        }
    } 
    
    public boolean LimpiarCargas(){
        String strSql= "delete from tcargafamiliar where rutfuncionario='" + strRutFuncionario + "'";
      
        try{
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
