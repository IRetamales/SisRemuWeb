/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.ResultSet;
import modelo.Conexion;

/**
 *
 * @author Articuno
 */
public class clsPreviRed {
    Integer intAño;
    Integer intMes;
    String strRut;
    FileReader fr = null;
    File archivo;
    BufferedWriter bfw;

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
    
    public String getRut() {
        return strRut;
    }

    public void setRut(String strRut) {
        this.strRut = strRut;
    }
    
    public void CreaArchivoPreviRed(){
        String strSql="";
        String rutaGuardar="C:\\Ra\\texto.txt";
        
        try {
            //seleccionamos la ruta del archivo que vamos a guardar el archivo
            archivo = new File (rutaGuardar);
            
            /*Validamos si el archivo existe si no existe lo creamos con el 
            * metodo createNewFile
            */
            if(!archivo.exists()){
                archivo.createNewFile();
            }

            // Abrimos el archivo
            fr = new FileReader (archivo);
            bfw=new BufferedWriter(new FileWriter(rutaGuardar));
                        
            strSql= "select * from tfuncionario";

            Conexion.getDbCon();
            ResultSet resultado1 = Conexion.db.query(strSql);
            while (resultado1.next()){
                strSql= "call archivoprevired ('" + String.valueOf(resultado1.getObject("rut")) + "', " + intMes + "," + intAño + ");";
                ResultSet resultado = Conexion.db.query(strSql);
                while (resultado.next()){
                    for (int i = 1; i <= resultado.getMetaData().getColumnCount(); ++i) {
                        //Escribimos en el archivo
                        bfw.append(resultado.getObject(i).toString());
                        bfw.append(";");
                    }
                    bfw.flush();
                    bfw.newLine();// crea una nueva linea  
                }
            }
        }catch(IOException e){
            System.out.println(e.toString());
        }catch(Exception e){
            System.out.println(e.toString());
        }finally{  
            try {
                //Cerramos el archivo
                 fr.close();
                 bfw.close();
            } catch (IOException ex) {

            }
        }
    }
}
