/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import modelo.Conexion;
/*
 *
 * @author Sylar
 */
public class clsFuncionario {
    String strRut;
    String strNombres;
    String strApellidoPaterno;
    String strApellidoMaterno;
    String strFechaNacimiento;
    String strDireccion;
    String strTelefono;
    String strCelular;
    String strMail;
    Integer intSalud;
    Integer intPension;
    Double intMontoPactado;
    String strGenero;
    Integer intNacionalidad;
    Integer intTipoTrabajador;
    
    String strFechaIngresoIsapre;
    Integer intTipoMonedaSalud;
    Double intMontoAhorroAFP;
    Integer intTipoMonedaAhorroAFP;
    Double intMontoAPV;
    Integer intTipoMonedaAPV;
    String strNumContratoIsapre;
    Integer intInstitucionAPV;
    
    String strError;
    String strSql;
        
    public String getRut( ){
        return this.strRut;
    }
 
    public void setRut(String Rut){
        this.strRut = Rut;
    }
    
    public String getNombre( ){
        return this.strNombres;
    }
 
    public void setNombre(String Nombre){
        this.strNombres = Nombre;
    }
    
    public String getApellidoPaterno( ){
        return this.strApellidoPaterno;
    }
 
    public void setApellidoPaterno(String ApellidoPaterno){
        this.strApellidoPaterno = ApellidoPaterno;
    }
    
    public String getApellidoMaterno( ){
        return this.strApellidoMaterno;
    }
 
    public void setApellidoMaterno(String ApellidoMaterno){
        this.strApellidoMaterno = ApellidoMaterno;
    }
    
    public String getFechaNacimiento( ){
        return this.strFechaNacimiento;
    }
 
    public void setFechaNacimiento(String strFechaNacimiento){
        this.strFechaNacimiento = strFechaNacimiento;
    }
    
    public String getDireccion( ){
        return this.strDireccion;
    }
 
    public void setDireccion(String Direccion){
        this.strDireccion = Direccion;
    }
    
    public String getTelefono( ){
        return this.strTelefono;
    }
 
    public void setTelefono(String Telefono){
        this.strTelefono = Telefono;
    }
    
    public String getCelular( ){
        return this.strCelular;
    }
 
    public void setCelular(String Celular){
        this.strCelular = Celular;
    }
    
    public String getMail( ){
        return this.strMail;
    }
 
    public void setMail(String Mail){
        this.strMail = Mail;
    }
    
    public Integer getSalud( ){
        return this.intSalud;
    }
 
    public void setSalud(Integer Salud){
        this.intSalud = Salud;
    }
    
    public Integer getPension( ){
        return this.intPension;
    }
 
    public void setPension(Integer Pension){
        this.intPension = Pension;
    }
    
    public Double getMontoPactado(){
        return this.intMontoPactado;
    }
 
    public void setMontoPactado(Double MontoPactado){
        this.intMontoPactado = MontoPactado;
    }
    
    public String getGenero( ){
        return this.strGenero;
    }
 
    public void setGenero(String sGenero){
        this.strGenero = sGenero;
    }

    public Integer getNacionalidad() {
        return intNacionalidad;
    }

    public void setNacionalidad(Integer intNacionalidad) {
        this.intNacionalidad = intNacionalidad;
    }

    public Integer getTipoTrabajador() {
        return intTipoTrabajador;
    }

    public void setTipoTrabajador(Integer intTipoTrabajador) {
        this.intTipoTrabajador = intTipoTrabajador;
    }

    public String getFechaIngresoIsapre() {
        return strFechaIngresoIsapre;
    }

    public void setFechaIngresoIsapre(String strFechaIngresoIsapre) {
        this.strFechaIngresoIsapre = strFechaIngresoIsapre;
    }

    public Integer getTipoMonedaSalud() {
        return intTipoMonedaSalud;
    }

    public void setTipoMonedaSalud(Integer intTipoMonedaSalud) {
        this.intTipoMonedaSalud = intTipoMonedaSalud;
    }

    public Double getMontoAhorroAFP() {
        return intMontoAhorroAFP;
    }

    public void setMontoAhorroAFP(Double intMontoAhorroAFP) {
        this.intMontoAhorroAFP = intMontoAhorroAFP;
    }

    public Integer getTipoMonedaAhorroAFP() {
        return intTipoMonedaAhorroAFP;
    }

    public void setTipoMonedaAhorroAFP(Integer intTipoMonedaAhorroAFP) {
        this.intTipoMonedaAhorroAFP = intTipoMonedaAhorroAFP;
    }

    public Double getMontoAPV() {
        return intMontoAPV;
    }

    public void setMontoAPV(Double intMontoAPV) {
        this.intMontoAPV = intMontoAPV;
    }

    public Integer getTipoMonedaAPV() {
        return intTipoMonedaAPV;
    }

    public void setTipoMonedaAPV(Integer intTipoMonedaAPV) {
        this.intTipoMonedaAPV = intTipoMonedaAPV;
    }

    public String getNumContratoIsapre() {
        return strNumContratoIsapre;
    }

    public void setNumContratoIsapre(String strNumContratoIsapre) {
        this.strNumContratoIsapre = strNumContratoIsapre;
    }

    public Integer getInstitucionAPV() {
        return intInstitucionAPV;
    }

    public void setInstitucionAPV(Integer intInstitucionAPV) {
        this.intInstitucionAPV = intInstitucionAPV;
    }
    
    public String getError( ){
        return this.strError;
    }
 
    public void setError(String sError){
        this.strError = sError;
    }
     
    public boolean GuardarFuncionario(){
        String strNacimiento=strFechaNacimiento.substring(6, 10)+strFechaNacimiento.substring(3, 5)+strFechaNacimiento.substring(0, 2);
        strSql= "insert into tfuncionario (rut,nombres,apellidopaterno,apellidomaterno,fechanacimiento,direccion,telefono,celular,mail,genero,nacionalidad,tipotrabajador) values ('" + strRut + "','" + strNombres + "','" + strApellidoPaterno + "','" + strApellidoMaterno +"','" + strNacimiento + "','" + strDireccion + "','" + strTelefono + "','" + strCelular + "','" + strMail + "', '" + strGenero + "', " + intNacionalidad + "," + intTipoTrabajador + ");";
        
        try{
            Conexion.getDbCon();
            Conexion.db.insert(strSql);
            return true;  
        } catch (Exception e) {
            e.getMessage();
            return false;
        }
    }
    
    public boolean ModificarFuncionarioPrevisionSalud(){
        String strFecha=strFechaIngresoIsapre.substring(6, 10)+strFechaIngresoIsapre.substring(3, 5)+strFechaIngresoIsapre.substring(0, 2);
        strSql="update TFuncionario set salud=" + intSalud + ", montopactado=" + intMontoPactado + ", fechaingresoisapre='" + strFecha + "', tipomonedasalud=" + intTipoMonedaSalud + ", numcontratoisapre='" + strNumContratoIsapre + "' where rut='" + strRut + "';";
        try{
            Conexion.getDbCon();
            Conexion.db.insert(strSql);
            return true; 
        } catch (Exception e) {
            e.getMessage();
            return false;
        }
    }
    
    public boolean ModificarFuncionarioPrevisionPension(){
        strSql="update TFuncionario set pension=" + intPension + ", montoapv=" + intMontoAPV + ", tipomonedaapv=" + intTipoMonedaAPV + ", institucionapv=" + intInstitucionAPV + ", montoahorroAFP=" + intMontoAhorroAFP + ", tipomonedaahorroafp=" + intTipoMonedaAhorroAFP + " where rut='" + strRut + "';";
        try{
            Conexion.getDbCon();
            Conexion.db.insert(strSql);
            return true; 
        } catch (Exception e) {
            e.getMessage();
            return false;
        }
    }
    
    public ResultSet ListarFuncionario(){
        strRut="";
        strNombres="";
        strApellidoPaterno="";
        strApellidoMaterno="";
        strSql= "call listarfuncionarios ('" + strRut + "', '" + strNombres + "', '" + strApellidoPaterno + "', '" + strApellidoMaterno + "');";   
        try{ 
            Conexion.getDbCon();
            ResultSet resultado = Conexion.db.query(strSql);
            return resultado;
        } catch (Exception e) {
             strError=Conexion.getDbCon().getStrError();
            e.getMessage();    
        }
        return null;
    }
    
    public void CargarFuncionario(){
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        strSql= "Select * from tfuncionario where rut='" + strRut + "'";
        
        try{
            Conexion.getDbCon();
            ResultSet resultado = Conexion.db.query(strSql);
            while (resultado.next()){
                strRut=resultado.getString("rut");
                strNombres=resultado.getString("nombres");
                strApellidoPaterno=resultado.getString("apellidopaterno");
                strApellidoMaterno=resultado.getString("apellidomaterno");
                strFechaNacimiento=dateFormat.format(resultado.getObject("fechanacimiento"));
                strDireccion=resultado.getString("direccion");
                strTelefono=resultado.getString("telefono");
                strCelular=resultado.getString("celular");
                strMail=resultado.getString("mail");
                strGenero=resultado.getString("genero");
                intNacionalidad=resultado.getInt("nacionalidad");
                intTipoTrabajador=resultado.getInt("tipotrabajador");
                
                intSalud=resultado.getInt("salud");
                intPension=resultado.getInt("pension");
                intMontoPactado=resultado.getDouble("montopactado");
                strFechaIngresoIsapre=dateFormat.format(resultado.getObject("fechaingresoisapre"));
                intTipoMonedaSalud=resultado.getInt("tipomonedasalud");
                intMontoAhorroAFP=resultado.getDouble("montoahorroafp");
                intTipoMonedaAhorroAFP=resultado.getInt("tipomonedaahorroafp");
                intMontoAPV=resultado.getDouble("montoapv");
                intTipoMonedaAPV=resultado.getInt("tipomonedaapv");
                strNumContratoIsapre=resultado.getString("numcontratoisapre");
                intInstitucionAPV=resultado.getInt("institucionapv");
            }
        }catch(Exception e) {
            e.getMessage();       
        }  
    }
    
    public boolean ModificarFuncionario(){
        String strNacimiento=strFechaNacimiento.substring(6, 10)+strFechaNacimiento.substring(3, 5)+strFechaNacimiento.substring(0, 2);
        strSql= "update tfuncionario set nombres='" + strNombres + "', apellidopaterno='" + strApellidoPaterno + "', apellidomaterno='" + strApellidoMaterno +"', fechanacimiento='" + strNacimiento + "', direccion='" + strDireccion + "', telefono='" + strTelefono + "', celular='" + strCelular + "', mail='" + strMail + "', genero='" + strGenero + "', nacionalidad=" + intNacionalidad + ", tipotrabajador=" + intTipoTrabajador + " where rut='" + strRut + "'";
        
        try{   
            Conexion.getDbCon();
            Conexion.db.insert(strSql);
            return true;
        } catch (Exception e) {
            e.getMessage();
            return false;
        }
    }
    
    public boolean EliminarFuncionario(){
        strSql= "delete from tfuncionario where rut='" + strRut + "'";
        
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
