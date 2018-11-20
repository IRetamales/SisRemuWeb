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
public class clsCargo{
    private Integer intIdCargo;
    private String strNombre;
    private Integer intHabilitado;
    
    public clsCargo(Integer intIdCargo, String strNombre){
        this.intIdCargo=intIdCargo;
        this.strNombre=strNombre;
        //this.intHabilitado=intHabilitado;
    }
    
    public clsCargo(){
        
    }
    
    public Integer getIdCargo() {
        return intIdCargo;
    }

    public void setIdCargo(Integer intIdCargo) {
        this.intIdCargo = intIdCargo;
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

    public List<clsCargo> ListaCargos(clsCargo cargo){
        String strSql= "call listacargos";
        List<clsCargo> car = new ArrayList<clsCargo>();
        
        try{            
            Conexion.getDbCon();
            ResultSet resultado = Conexion.db.query(strSql);
            while (resultado.next()) {
                cargo = new clsCargo();
                cargo.setIdCargo(resultado.getInt("idcargo"));
                cargo.setNombre(resultado.getString("nombre"));
                car.add(cargo);
            }   
        }  catch (Exception e) {
            e.printStackTrace();
        }
        return car;
    }
    
    @Override
    public String toString(){
        return strNombre;
    }
    
    /*
    public String NombreCargo(){
        String strSql= "call nombrecargo (" + intIdCargo + ");";
         
        try{
            MysqlConnection.db.insert(strSql);
                    
            ResultSet resultado = MysqlConnection.db.query(strSql);
            if (resultado.next()){
                return resultado.getString("Nombre");
            }else{
                return "";
            }
        } catch (Exception e) {
            e.getMessage();
            return "";
        }
    }*/
}
