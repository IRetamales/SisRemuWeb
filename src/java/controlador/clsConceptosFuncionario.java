/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.sql.ResultSet;
import java.text.DecimalFormat;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import modelo.Conexion;

/**
 *
 * @author Articuno
 */
public class clsConceptosFuncionario {
    ScriptEngineManager manager = new ScriptEngineManager();
    private String strRut;
    private String strNombre;
    private Integer intAño;
    private Integer intMes;
    private String strCodigo;
    private Long lngMonto;
    private Long lngCalculo;
    private String strDescripcion;
    
    public clsConceptosFuncionario(Integer intAño, Integer intMes,  String strCodigo, String strRut, String strDescripcion) {
        this.intAño = intAño;
        this.intMes = intMes;
        this.strCodigo = strCodigo;
        this.strRut = strRut;
        this.strDescripcion = strDescripcion;
        /*this.intObligatorio = intObligatorio;
        this.lngMonto = lngMonto;
        this.lngCalculo = lngCalculo;
        this.strTipoConcepto = strTipoConcepto;
        this.strModo = strModo;
        this.intImponible = intImponible;
        this.intTributable = intTributable;*/
    }
    
    public clsConceptosFuncionario(){
        
    }
    
    public String getRut() {
        return strRut;
    }

    public void setRut(String sRut) {
        this.strRut = sRut;
    }
    
    public String getNombre() {
        return strNombre;
    }

    public void setNombre(String sNombre) {
        this.strNombre = sNombre;
    }
    
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

    public String getCodigo( ) {
        return this.strCodigo;
    }

    public void setCodigo(String strCodigo) {
        this.strCodigo = strCodigo;
    }
    
    public Long getMonto() {
        return lngMonto;
    }

    public void setMonto(Long lngMonto) {
        this.lngMonto = lngMonto;
    }

    public Long getCalculo() {
        return lngCalculo;
    }

    public void setCalculo(Long lngCalculo) {
        this.lngCalculo = lngCalculo;
    }
    
    public String getDescripcion( ) {
        return this.strDescripcion;
    }

    public void setDescripcion(String strDescripcion) {
        this.strDescripcion = strDescripcion;
    }
    
    public ResultSet ListarConceptosFuncionario(String strTipo){
        //DecimalFormat formateador = new DecimalFormat("#,###");
        String strSql= "call listaconceptofuncionario ('" + strTipo + "', '" + strRut + "', " + intMes + ", " + intAño +");";
        
        try{
            Conexion.getDbCon();
            ResultSet resultado = Conexion.db.query(strSql);
            return resultado;
        } catch (Exception e) {
            e.getMessage(); 
        }
        return null;
    }
    
    public Integer SumaConceptos(String strTipoConcepto, Integer strTipo){
    //Pediremos tipo de haber (0= total haberes y descuentos, 1=totalimponible, 2=totaltributable)
        String strSql="";
        Integer Suma=0;
        System.out.println("tipo: " + strTipo );
        try{
            if (strTipo==1){
                strSql= "select sum(tc.valor) as Suma from tconceptofuncionario tc"
                            + " join tconcepto c on tc.codigo=c.codigo and tc.mes=c.mes and tc.año=c.año"
                            + " where c.tipoconcepto='" + strTipoConcepto + "' and c.imponible=1 and tc.rut='" + strRut + "'"
                            + " and tc.mes= " + intMes + " and tc.año=" + intAño + "";
            }
            if (strTipo==2){
                strSql= "select sum(tc.valor) as Suma from tconceptofuncionario tc"
                            + " join tconcepto c on tc.codigo=c.codigo and tc.mes=c.mes and tc.año=c.año"
                            + " where c.tipoconcepto='" + strTipoConcepto + "' and c.tributable=1 and tc.rut='" + strRut + "'"
                            + " and tc.mes= " + intMes + " and tc.año=" + intAño + "";
            }
            if (strTipo==0){
                strSql= "select sum(tc.valor) as Suma from tconceptofuncionario tc"
                            + " join tconcepto c on tc.codigo=c.codigo and tc.mes=c.mes and tc.año=c.año"
                            + " where c.tipoconcepto='" + strTipoConcepto + "' and tc.rut='" + strRut + "'"
                            + " and tc.mes= " + intMes + " and tc.año=" + intAño + "";
            }
            //System.out.println("string: " + strSql);
            Conexion.getDbCon();
            ResultSet resultado = Conexion.db.query(strSql);
            if (resultado.next()){
                Suma = resultado.getInt("Suma");
            }
            return Suma;
           
        } catch (Exception e) {
            e.getMessage();
            return 0;
        }
    }
    
    public boolean GuardarConceptoFuncionario(){
        String strSql= "insert into tconceptofuncionario (año,mes,codigo,rut,monto,valor) values (" + intAño + "," + intMes + ",'" + strCodigo + "','" + strRut +"',0,0)";
        
        try{
            Conexion.getDbCon();
            Conexion.db.insert(strSql);
            return true;  
        } catch (Exception e) {
            e.getMessage();
            return false;
        }
    }
    
    public boolean RevisaLiquidada(){
        String strSql= "select liquidado from tconceptofuncionario where rut='" + strRut + "' and mes=" + intMes + " and año=" + intAño +";";
        
        try{
            Conexion.getDbCon();
                   
            ResultSet resultado = Conexion.db.query(strSql);
            resultado.next();
            if(resultado.getInt("liquidado")==1){
                return true;
            }else{
                return false;
            }
       
        } catch (Exception e) {
            e.getMessage();
            return false;
        }
    }
    
    public void CalculaMonto(Integer intOpcion){
        Integer i=0;
        String strSql;
        
        strSql= "call cargaconceptofuncionario (" + intOpcion + ", '" + strRut + "', " + intAño + ", " + intMes + ");"; 

        try{
            Conexion.getDbCon();
            
            ResultSet resultado = Conexion.db.query(strSql);
            while (resultado.next()){
                strCodigo=resultado.getString("codigo");
                if ("F".equals(resultado.getString("modo"))){
                    lngMonto=ObtenerValorFormula(resultado.getString("formula"));
                }
                
                if ("M".equals(resultado.getString("modo"))){
                    resultado.getString("codigo");
                    lngMonto=0L;     
                }
                
                if ("R".equals(resultado.getString("modo"))){
                    
                }
                AsignaMontoConcepto(resultado.getString("codigo"));
                i=i+1;
            }
            CalculaSueldoBase();
            CalculaMontoGratificacion();
            CalculaMontoCargas();
            CalculaImpuesto();
            CalculaMontoPrevisionPension();
            CalculaMontoPrevisionSalud();
            CalculaSeguroCesantia();
        } catch (Exception e) {
            e.getMessage(); 
        }   
    }
    
    public Long ObtenerValorFormula(String strFormula){
        Long val=0L;
        Integer j=0;
        double doble;
        String Concepto;
        String ValorFormula="",strSql;
        try{
            for(int i=0;i<=strFormula.length();i++){
                if (i==strFormula.length() || strFormula.substring(i,i+1).matches("([a-z]|[A-Z]|\\s)+")==false){
                    Concepto=strFormula.substring(j,i);
                    strSql= "Select modo, monto, formula from tconcepto where codigo='" + Concepto + "' and año= " + intAño + " and mes=" + intMes + ";";

                    Conexion.getDbCon();

                    ResultSet resultado = Conexion.db.query(strSql);
                    while (resultado.next()){
                        if ("F".equals(resultado.getString("modo"))){
                            ValorFormula=ValorFormula+(ObtenerValorFormula(resultado.getString("formula"))).toString();
                        }else{
                            ValorFormula=ValorFormula+resultado.getString("monto");
                        }
                    }
                    if (i<strFormula.length()){
                        ValorFormula=ValorFormula+strFormula.substring(i,i+1);
                    }
                    j=i+1;
                }
            } 
            ScriptEngine engine = manager.getEngineByName("js");        
            Object result = engine.eval(ValorFormula);
            String strObj = result.toString();
            doble=Double.valueOf(strObj).doubleValue();
            val = Double.valueOf(doble).longValue();
               
            return val;
        } catch (Exception e) {
            e.getMessage(); 
            return val;
        } 
    }
    
    public void CalculaMontoPrevisionPension(){
        String strSql;
       
        strSql= "call calculaprevisionpension (" + intMes + ", " + intAño + ", '" + strRut + "')";
        try{
            Conexion.getDbCon();
            Conexion.db.insert(strSql);
        } catch (Exception e) {
            e.getMessage(); 
        }
    }
    
    public void CalculaMontoPrevisionSalud(){
        String strSql;
       
        strSql= "call calculaprevisionsalud (" + intMes + ", " + intAño + ", '" + strRut + "')";
        try{ 
            Conexion.getDbCon();
            Conexion.db.insert(strSql);
        } catch (Exception e) {
            e.getMessage(); 
        }
    }
    
    public void CalculaMontoCargas(){
        String strSql;
        
        strSql= "call calculamontocargas (" + intMes + ", " + intAño + ", '" + strRut + "')";
        try{
            Conexion.getDbCon();
            Conexion.db.insert(strSql);
        } catch (Exception e) {
            e.getMessage(); 
        }
    }
    
    public void CalculaSeguroCesantia(){
        String strSql;
        
        strSql= "call calculasegurocesantia (" + intMes + ", " + intAño + ", '" + strRut + "')";
        try{
            Conexion.getDbCon();
            Conexion.db.insert(strSql);
        } catch (Exception e) {
            e.getMessage(); 
        }
    }
    
    public void CalculaMontoGratificacion(){
        String strSql;
        
        strSql= "call calculamontogratificacion (" + intMes + ", " + intAño + ", '" + strRut + "')";
        try{
            Conexion.getDbCon();
            Conexion.db.insert(strSql);
        } catch (Exception e) {
            e.getMessage(); 
        }
    }
    
    public void CalculaSueldoBase(){
        Integer i=0;
        String strSql;
        
        strSql= "call calculasueldobase (" + intMes + ", " + intAño + ", '" + strRut + "')";
        try{
            Conexion.getDbCon();
            Conexion.db.insert(strSql);
        } catch (Exception e) {
            e.getMessage(); 
        }
    }
    
    public void CalculaImpuesto(){
        String strSql;
       
        strSql= "call calculaimpuesto (" + intMes + ", " + intAño + ", '" + strRut + "')";
        try{
            Conexion.getDbCon();
            Conexion.db.insert(strSql);
        } catch (Exception e) {
            e.getMessage(); 
        }
    }
    
    public boolean AsignaMontoConcepto(String strCodigo){
        String strSql="call asignamontoconcepto ('" + strCodigo + "', '" + strRut + "', " + lngMonto + ", " + intMes + ", " + intAño + ");";
                          
        try{
            Conexion.getDbCon();
            Conexion.db.insert(strSql);
            return true;     
        } catch (Exception e) {
            e.getMessage();
            return false;
        }
    }
    
    public boolean Reliquidar(){
        String strSql= "update tconceptofuncionario set valor=0, liquidado=0 where rut='" + strRut + "' and mes=" + intMes + " and año=" + intAño + ";";
                          
        try{
            Conexion.getDbCon();
            Conexion.db.insert(strSql);
            return true;     
        } catch (Exception e) {
            e.getMessage();
            return false;
        }
    }
    
    public ResultSet LibroRemuneraciones(){
        DecimalFormat formateador = new DecimalFormat("#,###");
        String strSql= "call libroremuneraciones (" + intAño + ", " + intMes +");";
        
        try{
            Conexion.getDbCon();
            return Conexion.db.query(strSql);
        } catch (Exception e) {
            e.getMessage(); 
        }
        return null;
    }
    
    /*
    

    
    public boolean EliminaConceptoFuncionario(){
        String strSql= "call eliminaconceptofuncionario ('" + strCodigo + "', '" + strRut + "'," + intMes + "," + intAño + ");";
                
        try{
            MysqlConnection.getDbCon();
            MysqlConnection.db.insert(strSql);
            return true;     
        } catch (Exception e) {
            e.getMessage();
            return false;
        }
    }
    
    
    

    public void LibroRemuneracionesExcel(){
        Integer i=1;
        String strSql= "call libroremuneraciones (" + intAño + ", " + intMes + ");";
        
        javax.swing.filechooser.FileNameExtensionFilter filterXls = new javax.swing.filechooser.FileNameExtensionFilter("Documentosxcel 95/2003", "xls");

        //instanciamos una ventana de seleccion de archivo
        final JFileChooser fc = new JFileChooser();

        //agregamos el filtro al filechooser
        fc.setFileFilter(filterXls);

        //capturamos la respuesta del usuario
        int returnVal = fc.showSaveDialog(null);

        //definimos el comportamiento de la ventana
        fc.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);

        if (returnVal == JFileChooser.APPROVE_OPTION) {

            FileOutputStream fileOut = null;
            File fileXLS = null;
        
            try{
                MysqlConnection.getDbCon();

                HSSFWorkbook libro = new HSSFWorkbook();
                Sheet hoja = libro.createSheet();
     
                Row fila = hoja.createRow(0);
                Cell celda = fila.createCell(0);
                celda.setCellValue("RUT");
                celda = fila.createCell(1);
                celda.setCellValue("NOMBRES");
                celda = fila.createCell(2);
                celda.setCellValue("BASE");
                celda = fila.createCell(3);
                celda.setCellValue("H. IMPONIBLE");
                celda = fila.createCell(4);
                celda.setCellValue("GRATIF.");
                celda = fila.createCell(5);
                celda.setCellValue("TOTAL IMP");
                celda = fila.createCell(6);
                celda.setCellValue("ASIG. FAM.");
                celda = fila.createCell(7);
                celda.setCellValue("MOV/LOC");                
                celda = fila.createCell(8);
                celda.setCellValue("H. NO IMP.");
                celda = fila.createCell(9);
                celda.setCellValue("TOTAL NO IMP.");
                celda = fila.createCell(10);
                celda.setCellValue("TIPO AFP");
                celda = fila.createCell(11);
                celda.setCellValue("DCTO AFP");
                celda = fila.createCell(12);
                celda.setCellValue("TIPO SALUD");
                celda = fila.createCell(13);
                celda.setCellValue("DCTO SALUD");
                celda = fila.createCell(14);
                celda.setCellValue("LIQUIDO");
                celda = fila.createCell(15);
                celda.setCellValue("ANTICIPO");
                celda = fila.createCell(16);
                celda.setCellValue("LIQUIDO PAGO");
                //celda = fila.createCell(17);
                
                ResultSet resultado = MysqlConnection.db.query(strSql);
                while (resultado.next()){
                    //hoja.createRow(i);
                    fila = hoja.createRow(i);
                    celda = fila.createCell(0);
                    celda.setCellValue(resultado.getObject("Rut").toString());
                    celda = fila.createCell(1);
                    celda.setCellValue(resultado.getObject("Nombre").toString());
                    celda = fila.createCell(2);
                    celda.setCellValue(resultado.getObject("Base").toString());
                    celda = fila.createCell(3);
                    celda.setCellValue(resultado.getObject("Extra").toString());
                    celda = fila.createCell(4);
                    celda.setCellValue(resultado.getObject("Gratif").toString());
                    celda = fila.createCell(5);
                    celda.setCellValue(resultado.getObject("TotalImp").toString());
                    celda = fila.createCell(6);
                    celda.setCellValue(resultado.getObject("AFamiliar").toString());
                    celda = fila.createCell(7);
                    celda.setCellValue(resultado.getObject("MovLoc").toString());
                    celda = fila.createCell(8);
                    celda.setCellValue(resultado.getObject("HaberNImp").toString());
                    celda = fila.createCell(9);
                    celda.setCellValue(resultado.getObject("TotalHaber").toString());
                    celda = fila.createCell(10);
                    celda.setCellValue(resultado.getObject("TipoAFP").toString());
                    celda = fila.createCell(11);
                    celda.setCellValue(resultado.getObject("DctoAFP").toString());
                    celda = fila.createCell(12);
                    celda.setCellValue(resultado.getObject("TipoSalud").toString());
                    celda = fila.createCell(13);
                    celda.setCellValue(resultado.getObject("DctoSalud").toString());
                    celda = fila.createCell(14);
                    celda.setCellValue(resultado.getObject("Liquido").toString());
                    celda = fila.createCell(15);
                    celda.setCellValue(resultado.getObject("Anticipo").toString());
                    celda = fila.createCell(16);
                    celda.setCellValue(resultado.getObject("LiquidoPago").toString());  
                    i++;
                }

                fileXLS = fc.getSelectedFile();
                String name = fileXLS.getName();
                if (name.indexOf('.') == -1) {
                //De no ser asi le agregamos
                    name += ".xls";
                    fileXLS = new File(fileXLS.getParentFile(), name);
                }
                fileOut = new FileOutputStream(fileXLS);

                libro.write(fileOut);
                
                fileOut.close();
                if (System.getProperty("os.name").equals("Linux")){
                        Runtime.getRuntime().exec("libreoffice " + fileXLS.getAbsolutePath());
                    } else {
                        Runtime.getRuntime().exec("rundll32 url.dll,FileProtocolHandler " + fileXLS.getAbsolutePath());
                    }
            } catch (Exception e) {
                e.getMessage();    
            }
        }
    }*/   
}
