/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.sql.ResultSet;
import java.sql.SQLException;
import modelo.Conexion;

/**
 *
 * @author Articuno
 */
public class clsConcepto {
    private Integer intAño;
    private Integer intMes;
    private String strCodigo;
    private String strDescripcion;
    private Integer intObligatorio;
    private Integer intMonto;
    private Integer intCalculo;
    private String strTipoConcepto;
    private String strModo;
    private Integer intImponible;
    private Integer intTributable;
    private String strFormula;
    private String strDesde;
    private String strHasta;
    private String strError;
    
    String strSql;
    
    //public clsConcepto(Integer intAño, Integer intMes, String strCodigo, String strDescripcion, Integer intObligatorio, Long lngMonto, Long lngCalculo, String strTipoConcepto, String strModo, Integer intImponible, Integer intTributable) {
    public clsConcepto(Integer intAño, Integer intMes,  String strCodigo, String strDescripcion) {
        this.intAño = intAño;
        this.intMes = intMes;
        this.strCodigo = strCodigo;
        this.strDescripcion = strDescripcion;
        /*this.intObligatorio = intObligatorio;
        this.lngMonto = lngMonto;
        this.lngCalculo = lngCalculo;
        this.strTipoConcepto = strTipoConcepto;
        this.strModo = strModo;
        this.intImponible = intImponible;
        this.intTributable = intTributable;*/
    }
    
    public clsConcepto(){
        
    }

    public Integer getMes() {
        return intMes;
    }

    public void setMes(Integer intMes) {
        this.intMes = intMes;
    }

    public String getCodigo( ){
        return this.strCodigo;
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

    public Integer getObligatorio() {
        return intObligatorio;
    }

    public void setObligatorio(Integer intObligatorio) {
        this.intObligatorio = intObligatorio;
    }

    public Integer getMonto() {
        return intMonto;
    }

    public void setMonto(Integer intMonto) {
        this.intMonto = intMonto;
    }

    public Integer getCalculo() {
        return intCalculo;
    }

    public void setCalculo(Integer intCalculo) {
        this.intCalculo = intCalculo;
    }

    public String getTipoConcepto() {
        return strTipoConcepto;
    }

    public void setTipoConcepto(String strTipoConcepto) {
        this.strTipoConcepto = strTipoConcepto;
    }

    public String getModo() {
        return strModo;
    }

    public void setModo(String strModo) {
        this.strModo = strModo;
    }

    public Integer getImponible() {
        return intImponible;
    }

    public void setImponible(Integer intImponible) {
        this.intImponible = intImponible;
    }

    public Integer getTributable() {
        return intTributable;
    }

    public void setTributable(Integer intTributable) {
        this.intTributable = intTributable;
    }
    
    public Integer getAño() {
        return intAño;
    }

    public void setAño(Integer intAño) {
        this.intAño = intAño;
    }
    
    public String getFormula() {
        return strFormula;
    }

    public void setFormula(String strFormula) {
        this.strFormula = strFormula;
    }
    
    public String getDesde() {
        return strDesde;
    }

    public void setDesde(String strDesde) {
        this.strDesde = strDesde;
    }
    
    public String getHasta() {
        return strHasta;
    }

    public void setHasta(String strHasta) {
        this.strHasta = strHasta;
    }
    
    public String getError() {
        return strError;
    }

    public void setError(String strError) {
        this.strError = strError;
    }
    
    public ResultSet ListarConceptos(Integer intTipo){
        String strSql= "call listarconceptos(" + intTipo + "," + intAño + "," + intMes + ")";;  
        try{ 
            Conexion.getDbCon();
            ResultSet resultado = Conexion.db.query(strSql);
            return resultado;
        } catch (Exception e) {
            e.getMessage();    
        }
        return null;
    }
    
    public ResultSet ListarConceptosNoObligatorio(String strTipo){
        String strSql= "call listaconceptos(" + intMes + "," + intAño + ",'" + strTipo+ "')";;  
        try{ 
            Conexion.getDbCon();
            ResultSet resultado = Conexion.db.query(strSql);
            return resultado;
        } catch (Exception e) {
            e.getMessage();    
        }
        return null;
    }
    
    public boolean GuardarConcepto(){
        strSql= "insert into tconcepto (año,mes,codigo,descripcion,obligatorio,monto,tipoconcepto,modo,imponible,tributable,formula) values (" + intAño + "," + intMes + ",'" + strCodigo + "','" + strDescripcion + "'," + intObligatorio +"," + intMonto + ",'" + strTipoConcepto + "','" + strModo + "'," + intImponible + "," + intTributable + ",'" + strFormula + "')";
        
        try{
            Conexion.getDbCon();
            Conexion.db.insert(strSql);
            return true;  
        } catch (Exception e) {
            e.getMessage();
            return false;
        }
    }
    
    public void CargarConceptos() throws SQLException{
        String strSql= "call cargarconcepto('" + strCodigo + "'," + intAño + "," + intMes +")";
        
        try{
            Conexion.getDbCon();   
            ResultSet resultado = Conexion.db.query(strSql);
            while (resultado.next()){
                strDescripcion = resultado.getObject("descripcion").toString(); 
                intObligatorio = Integer.valueOf(resultado.getObject("obligatorio").toString());
                strModo = resultado.getObject("modo").toString();
                if ("M".equals(strModo)){
                    intMonto=Integer.parseInt(String.valueOf(resultado.getObject("monto").toString()));
                }else{
                    intMonto=0;
                }
                strTipoConcepto = resultado.getObject("tipoconcepto").toString();               
                intImponible = Integer.valueOf(resultado.getObject("imponible").toString());
                intTributable = Integer.valueOf(resultado.getObject("tributable").toString());
                strFormula = resultado.getObject("formula").toString();  
            }         
        } catch (Exception e) {
            e.getMessage();    
        }
    }
    
    public boolean ModificarConcepto(){
        strSql= "update tconcepto set descripcion='" + strDescripcion + "', obligatorio=" + intObligatorio + ", monto=" + intMonto + ", tipoconcepto='" + strTipoConcepto + "', modo='" + strModo + "', imponible=" + intImponible + ", tributable=" + intTributable + ", formula='" + strFormula +"' where codigo='" + strCodigo + "' and año=" + intAño + " and mes=" + intMes;
        
        try{
            Conexion.getDbCon();
            Conexion.db.insert(strSql);
            return true;  
        } catch (Exception e) {
            e.getMessage();
            return false;
        }
    }
    
    public boolean EliminarConcepto(){
        strSql= "delete from tconcepto where codigo='" + strCodigo + "' and mes=" + intMes + " and año=" + intAño;
      
        try{
            Conexion.getDbCon();
            Conexion.db.insert(strSql);
            return true;  
        } catch (Exception e) {
            e.getMessage();
            return false;
        }
    }
    
    public boolean GuardarRango(){
        strSql= "call actualizarangoconcepto (" + intMes + ", "+ intAño + ", '" + strCodigo + "', '" + strDesde + "'," + strHasta + "," + intMonto + ")";
        try{
            Conexion.getDbCon();
            Conexion.db.insert(strSql);
            return true;  
        } catch (Exception e) {
            e.getMessage();
            return false;
        }
    }
    
    public ResultSet ListarRangos(String strCodigo){
        String strSql= "call listarrangos('" + strCodigo + "')";
        
        try{
            Conexion.getDbCon();                   
            return Conexion.db.query(strSql);       
        } catch (Exception e) {
            e.getMessage();    
        }
        return null;
    }
    
    public boolean EliminarRangosConcepto(){
        strSql= "delete from trangoconcepto where codigoconcepto='" + strCodigo + "' and año=" + intAño + " and mes=" + intMes + " and desde='" + strDesde + "' and hasta='" + strHasta + "';";
        
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
    public void LlenaComboConceptos(JComboBox Combo, String strTipo){
        String strSql= "call listaconceptos(" + intMes + "," + intAño + ",'" + strTipo + "')";
        
        try{
            MysqlConnection.getDbCon();
            
            Combo.removeAllItems();
        
            ResultSet resultado = MysqlConnection.db.query(strSql);
            while (resultado.next()){
                Combo.addItem(
                        new clsConcepto(resultado.getInt("mes"),
                                       resultado.getInt("año"),
                                       resultado.getString("codigo"),
                                       resultado.getString("descripcion")
                        )
                );
            }
        } catch (Exception e) {
            e.getMessage();
            
        }
    }
    
    @Override
    public String toString(){
        return strDescripcion;
    }
    
    
    public void NombrarConceptos(Integer intTipo, JList Listado){
        DefaultListModel modeloLista=new DefaultListModel();
        String strSql= "call listarconceptos(" + intTipo + "," + intAño + "," + intMes +")";
        
        try{
            MysqlConnection.getDbCon();

            ResultSet resultado = MysqlConnection.db.query(strSql);
            while (resultado.next()){
                modeloLista.addElement(resultado.getObject("descripcion"));
            }
            Listado.setModel(modeloLista);
                    
        } catch (Exception e) {
            e.getMessage();    
        }
    }

*/
}
