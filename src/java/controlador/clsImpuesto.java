/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import modelo.Conexion;

/**
 *
 * @author Articuno
 */
public class clsImpuesto {
    Integer intMes;
    Integer intAño;
    Integer intIdTramo;
    Double dblDesde;
    Double dblHasta;
    Double dblFactor;
    Double dblRebaja;
    
    String strSql;

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

    public Integer getIdTramo() {
        return intIdTramo;
    }

    public void setIdTramo(Integer intIdTramo) {
        this.intIdTramo = intIdTramo;
    }

    public Double getDesde() {
        return dblDesde;
    }

    public void setDesde(Double dblDesde) {
        this.dblDesde = dblDesde;
    }

    public Double getHasta() {
        return dblHasta;
    }

    public void setHasta(Double dblHasta) {
        this.dblHasta = dblHasta;
    }

    public Double getFactor() {
        return dblFactor;
    }

    public void setFactor(Double dblFactor) {
        this.dblFactor = dblFactor;
    }

    public Double getRebaja() {
        return dblRebaja;
    }

    public void setRebaja(Double dblRebaja) {
        this.dblRebaja = dblRebaja;
    }
    
    public boolean ActualizaImpuesto(){
        strSql= " call actualizaimpuestos (" + intMes + "," + intAño + "," + intIdTramo + "," + dblDesde + "," + dblHasta +"," + dblFactor + "," + dblRebaja + ");";
        
        try{
            Conexion.getDbCon();
            Conexion.db.insert(strSql);
            return true;  
        } catch (Exception e) {
            e.getMessage();
            return false;
        }
    }
}
