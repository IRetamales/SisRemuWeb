/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;
//import java.sql.*;

import java.sql.ResultSet;
import modelo.Conexion;


/**
 *
 * @author Sylar
 */
public class clsUsuario {
    private String strLogin;
    private String strPassword;
    private String strError;

    public String getError() {
        return strError;
    }

    public void setError(String strError) {
        this.strError = strError;
    }
    
    public String getLogin( ){
        return this.strLogin;
    }
 
    public void setLogin(String login){
        this.strLogin = login;
    }
    
    public String getPassword( ){
        return this.strPassword;
    }
 
    public void setPassword(String password){
        this.strPassword = password;
    }
    
    public boolean BuscarUsuario(){
        String strSql= "call buscarusuario ('" + strLogin + "', '" + strPassword + "');";
        
        try{
            Conexion.getDbCon();
            ResultSet resultado = Conexion.db.query(strSql);
            if (resultado.next()) {
                return true;
            }else{
                strError="Datos Incorrectos...";
                return false;
            }
        } catch (Exception e) {
            System.err.println("Error: " + e);
            strError=Conexion.getDbCon().getStrError();
            e.getMessage();
            return false;
        }
    }
}
