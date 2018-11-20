<%-- 
    Document   : ProcesaConsultas
    Created on : 10-ago-2018, 15:44:00
    Author     : Articuno
--%>
<%@page import="controlador.clsConcepto"%>
<%@page import="controlador.clsPreviRed"%>
<%@page import="net.sf.jasperreports.engine.JRException"%>
<%@page import="net.sf.jasperreports.engine.JasperExportManager"%>
<%@page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@page import="net.sf.jasperreports.engine.JasperFillManager"%>
<%@page import="net.sf.jasperreports.engine.JasperReport"%>
<%@page import="net.sf.jasperreports.engine.JasperCompileManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.File"%>
<%@page import="modelo.Conexion"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="controlador.clsFuncionario"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.LinkedList"%>
<%@page import="controlador.clsConceptosFuncionario"%>
<%@page import="controlador.clsParametros"%>
<%@page import="controlador.clsImpuesto"%>
<%@page import="controlador.clsPension"%>
<%@page import="controlador.clsContrato"%>
<%@page import="controlador.clsPeriodo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="controlador.clsCargasFamiliares"%>
<%@ include file="js/FuncionesJSP.jsp" %>
<%
HttpSession sesion=request.getSession();
SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
    //AGREGAR CARGA FAMILIAR
    if ("1".equals(request.getParameter("llamado"))){
        clsCargasFamiliares Cargas = new clsCargasFamiliares();
        Cargas.setRutFuncionario(request.getParameter("rutfun"));
        Cargas.setRutCarga(request.getParameter("rut"));
        Cargas.setNombre(request.getParameter("nombre"));
        Cargas.setApellidoPaterno(request.getParameter("paterno"));
        Cargas.setApellidoMaterno(request.getParameter("materno"));
        Cargas.setFechaNacimiento(request.getParameter("nacimiento"));
        Cargas.setFechaInicio(request.getParameter("inicio"));
        Cargas.setFechaTermino(request.getParameter("termino"));
        Cargas.setGenero(request.getParameter("gen"));
        Cargas.setVinculo(Integer.parseInt(request.getParameter("vinc")));

        Cargas.ActualizarCargasFamiliares();
    }
    
    //LISTAR CARGAS FAMILIARES
    if ("2".equals(request.getParameter("llamado"))){%>
        <table class="table" id="tabla">
            <thead class="thead-inverse">
                <tr>
                  <th scope="col">Rut</th>
                  <th scope="col">Nombre</th>
                  <th scope="col">Ap. Paterno</th>
                  <th scope="col">Ap. Materno</th>
                  <th scope="col">Fec. Nac.</th>
                  <th scope="col">Inicio</th>
                  <th scope="col">Termino</th>
                  <th scope="col">Genero</th>
                  <th scope="col" style="display:none">CodVin</th><!--Oculto-->
                  <th scope="col">Vinculo</th>
                </tr>
            </thead>
            <tbody>
                <%  clsCargasFamiliares carga = new clsCargasFamiliares();
                
                    //carga.setRutFuncionario(request.getParameter("rut"));
                    carga.setRutFuncionario((String) session.getAttribute("rutper"));
                    ResultSet rss = carga.ListarCargasFamiliares();
                    while (rss.next()){
                %>
                    <tr>
                        <td> <%= rss.getString(1)%></td> 
                        <td> <%= rss.getString(3)%></td> 
                        <td> <%= rss.getString(4)%></td> 
                        <td> <%= rss.getString(5)%></td>
                        <td> <%= rss.getString(6)%></td>
                        <td> <%= rss.getString(8)%></td>
                        <td> <%= rss.getString(9)%></td> 
                        <td> <%= rss.getString(7)%></td>
                        <td style="display:none"> <%= rss.getString(10)%></td>
                        <td> <%= rss.getString(11)%></td>
                        <td><a href='#' class='btnPasarDato' onclick='EditarCarga(this)'><span class='glyphicon glyphicon-pencil'></span></a></td>
                        <td><a href='#' name="go" id="go" onclick='EliminaCarga(<%= rss.getString(1)%>)'><span class='glyphicon glyphicon-remove'></span></a></td>
                    </tr>
                <%}%>
            </tbody>
        </table>
    <%}

    //ELIMINAR CARGA DEL LISTADO
    if ("3".equals(request.getParameter("llamado"))){
        clsCargasFamiliares Cargas = new clsCargasFamiliares();
        Cargas.setRutCarga(request.getParameter("rut"));
        Cargas.EliminarCarga();
    }
    
    //AGREGAR CONTRATOS
    if ("4".equals(request.getParameter("llamado"))){
        clsContrato con = new clsContrato();
        con.setRut(request.getParameter("rutfun"));
        con.setCargo(Integer.parseInt(request.getParameter("car")));
        con.setTipoContrato(Integer.parseInt(request.getParameter("tip")));
        con.setFechaDesde(request.getParameter("des"));
        con.setFechaHasta(request.getParameter("has"));
        con.setSueldoBase(Integer.parseInt(request.getParameter("sue")));
        con.setSubsidioJoven(Integer.parseInt(request.getParameter("sub")));

        con.ActualizarHistorial();
    }

    //LISTAR CONTRATOS
    if ("5".equals(request.getParameter("llamado"))){%>
        <table class="table" id="tablaContratos">
            <thead class="thead-inverse">
                <tr>
                  <th scope="col" style="display:none">ID</th>
                  <th scope="col" style="display:none">CodCargo</th>
                  <th scope="col">Cargo</th>
                  <th scope="col" style="display:none">CodContrato</th>
                  <th scope="col">Tipo Contrato</th>
                  <th scope="col">Desde</th>
                  <th scope="col">Hasta</th>
                  <th scope="col">Sueldo</th>
                  <th scope="col" style="display:none">CodSub</th>
                  <th scope="col">Subsidio</th>
                </tr>
            </thead>
            <tbody>
                <%  clsContrato cont = new clsContrato();
                
                    //carga.setRutFuncionario(request.getParameter("rut"));
                    cont.setRut((String) session.getAttribute("rutper"));
                    ResultSet rss = cont.ListarContratos();
                    while (rss.next()){
                %>
                    <tr>
                        <td style="display:none"> <%= rss.getString(1)%></td> 
                        <td style="display:none"> <%= rss.getString(3)%></td> 
                        <td> <%= rss.getString(4)%></td> 
                        <td style="display:none"> <%= rss.getString(9)%></td>
                        <td> <%= rss.getString(10)%></td>
                        <td> <%= rss.getString(5)%></td> 
                        <td> <%= rss.getString(6)%></td>
                        <td> <%= rss.getString(7)%></td>
                        <td style="display:none"> <%= rss.getString(8)%></td>
                        <td> <%= rss.getString(11)%></td>
                        <td><a href='#' class='btnPasarDato' onclick='EditarContrato(this)'><span class='glyphicon glyphicon-pencil'></span></a></td>
                        <td><a href='#' onclick='EliminaContrato(<%= rss.getString(1)%>)'><span class='glyphicon glyphicon-remove'></span></a></td>
                    </tr>
                <%}%>
            </tbody>
        </table>
    <%}
    
    //ELIMINA CONTRATOS
    if ("6".equals(request.getParameter("llamado"))){
        clsContrato cont = new clsContrato();
        cont.setRut((String) session.getAttribute("rutper"));
        cont.setIdHistorial(Integer.parseInt(request.getParameter("idcont")));
        cont.EliminaContrato();
    }
    
    //LISTA PERIODOS

                
    if ("8".equals(request.getParameter("llamado"))){
        String Mes=request.getParameter("mes").trim();
        String Año=request.getParameter("año").trim();

        sesion.setAttribute("Año", Año);
        sesion.setAttribute("Mes", Mes);
    }
    
    //GUARDAR DATOS DE PENSION EN MES
    if ("9".equals(request.getParameter("llamado"))){       
        clsPension pen = new clsPension();
        pen.setAño(Integer.parseInt(session.getAttribute("Año").toString()));
        pen.setMes(Integer.parseInt(session.getAttribute("Mes").toString()));

        pen.setIdInstitucion(1);
        pen.setValor(Double.parseDouble(request.getParameter("cap").toString().trim().replace(",",".")));
        pen.ActualizarValorInstitucionPension();

        pen.setIdInstitucion(2);
        pen.setValor(Double.parseDouble(request.getParameter("cup").toString().trim().replace(",",".")));
        pen.ActualizarValorInstitucionPension();

        pen.setIdInstitucion(3);
        pen.setValor(Double.parseDouble(request.getParameter("hab").toString().trim().replace(",",".")));
        pen.ActualizarValorInstitucionPension();

        pen.setIdInstitucion(4);
        pen.setValor(Double.parseDouble(request.getParameter("pla").toString().trim().replace(",",".")));
        pen.ActualizarValorInstitucionPension();

        pen.setIdInstitucion(5);
        pen.setValor(Double.parseDouble(request.getParameter("pro").toString().trim().replace(",",".")));
        pen.ActualizarValorInstitucionPension();
        
        pen.setIdInstitucion(6);
        pen.setValor(Double.parseDouble(request.getParameter("mod").toString().trim().replace(",",".")));
        pen.ActualizarValorInstitucionPension();
    }
    
    //GUARDAR TRAMOS DE CARGAS FAMILIARES
    if ("10".equals(request.getParameter("llamado"))){   
        clsCargasFamiliares car = new clsCargasFamiliares();
        car.setAño(Integer.parseInt(session.getAttribute("Año").toString()));
        car.setMes(Integer.parseInt(session.getAttribute("Mes").toString()));
        car.setIdTramo(request.getParameter("tra").toString().trim().toUpperCase());
        car.setMonto(Integer.parseInt(request.getParameter("mon").toString().trim()));
        car.setTramoDesde(Integer.parseInt(request.getParameter("des").toString().trim()));
        car.setTramoHasta(Integer.parseInt(request.getParameter("has").toString().trim()));
        car.ActualizarValoresCargasFamiliares();
    }
    
    //GUARDAR TRAMOS DE IMPUESTOS
    if ("11".equals(request.getParameter("llamado"))){
        clsImpuesto imp = new clsImpuesto();
        imp.setAño(Integer.parseInt(session.getAttribute("Año").toString()));
        imp.setMes(Integer.parseInt(session.getAttribute("Mes").toString()));

        imp.setIdTramo(Integer.parseInt(request.getParameter("tra").toString().trim().replace(",",".")));
        imp.setDesde(Double.parseDouble(request.getParameter("des").toString().trim().replace(",",".")));
        imp.setHasta(Double.parseDouble(request.getParameter("has").toString().trim().replace(",",".")));
        imp.setFactor(Double.parseDouble(request.getParameter("fac").toString().trim().replace(",",".")));
        imp.setRebaja(Double.parseDouble(request.getParameter("reb").toString().trim().replace(",",".")));
        imp.ActualizaImpuesto();
    }
    
    //GUARDAR DATOS ECONOMICOS DEL SISTEMA
    if ("12".equals(request.getParameter("llamado"))){
        clsParametros par = new clsParametros();
        par.setAño(Integer.parseInt(session.getAttribute("Año").toString()));
        par.setMes(Integer.parseInt(session.getAttribute("Mes").toString()));
        par.setCodigo(request.getParameter("nom"));
        par.setNumerico(Double.parseDouble(request.getParameter("val").replace(",",".")));
        par.ActualizaValorNumero();
    }

    //LISTAR HABERES FUNCIONARIO
    if ("13".equals(request.getParameter("llamado"))){%>
        <div class="panel-heading" style="text-align: center">HABERES</div>
            <table style="width: 100%" class="table table-bordered">
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Valor</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        Integer pos=Integer.parseInt(request.getParameter("pos"));
                        LinkedList<String> lista=(LinkedList)session.getAttribute("seslistado");
                        
                        request.getSession().setAttribute("rutper", lista.get(pos));//LE AGREGO VARIABLE DE SESION PARA INDICAR QUE CON ESTE FUNCIONARIO SE TRABAJA
                        
                        clsConceptosFuncionario con = new clsConceptosFuncionario();
                        con.setAño(Integer.parseInt(session.getAttribute("Año").toString()));
                        con.setMes(Integer.parseInt(session.getAttribute("Mes").toString()));
                        con.setRut(lista.get(pos));
                        
                        clsFuncionario fun = new clsFuncionario();
                        fun.setRut(lista.get(pos));
                        fun.CargarFuncionario();
                        
                        ResultSet rss = con.ListarConceptosFuncionario("H");
                        while (rss.next()){
                            if (rss.getInt(4)==1){
                    %>
                        <tr>
                            <td style="font-size:12px; padding: 2px; background-color: #98CCB8"> <%= rss.getString(2)%></td>
                            <td style="font-size:12px; padding: 2px; background-color: #98CCB8"> <%= rss.getString(3)%></td>
                        </tr>
                        <%}else{%>
                        <tr>
                            <td style="font-size:12px; padding: 2px"> <%= rss.getString(2)%></td>
                            <td style="font-size:12px; padding: 2px"> <%= rss.getString(3)%></td>
                        </tr>
                        <%}}%>
                    <script>
                        $(document).ready(function(){
                            $("#rutpersona").html("<%= lista.get(pos) %>");
                            $("#nombrepersona").html("<%= fun.getNombre() + " " + fun.getApellidoPaterno() + " " + fun.getApellidoMaterno() %>");
                        });
                    </script>
                </tbody>
            </table>
        
    <%}
    
    //LISTAR DESCUENTOS FUNCIONARIO
    if ("14".equals(request.getParameter("llamado"))){%>
        <div class="panel-heading" style="text-align: center">DESCUENTOS</div>
            <table style="width: 100%"  class="table table-bordered">
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Valor</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Integer pos=Integer.parseInt(request.getParameter("pos"));
                        LinkedList<String> lista=(LinkedList)session.getAttribute("seslistado");
                        
                        request.getSession().setAttribute("rutper", lista.get(pos));//LE AGREGO VARIABLE DE SESION PARA INDICAR QUE CON ESTE FUNCIONARIO SE TRABAJA
                        
                        clsConceptosFuncionario con = new clsConceptosFuncionario();
                        con.setAño(Integer.parseInt(session.getAttribute("Año").toString()));
                        con.setMes(Integer.parseInt(session.getAttribute("Mes").toString()));
                        con.setRut(lista.get(pos));
                        ResultSet rss = con.ListarConceptosFuncionario("D");
                        while (rss.next()){
                            if (rss.getInt(4)==1){
                    %>
                        <tr>
                            <td style="font-size:12px; padding: 2px; background-color: #98CCB8"> <%= rss.getString(2)%></td>
                            <td style="font-size:12px; padding: 2px; background-color: #98CCB8"> <%= rss.getString(3)%></td>
                        </tr>
                        <%}else{%>
                        <tr>
                            <td style="font-size:12px; padding: 2px"> <%= rss.getString(2)%></td>
                            <td style="font-size:12px; padding: 2px"> <%= rss.getString(3)%></td>
                        </tr>
                        <%}}%>
                </tbody>
            </table>
    <%}
    
    //CALCULA TOTALES
    if ("15".equals(request.getParameter("llamado"))){
        Integer pos=Integer.parseInt(request.getParameter("pos"));
        LinkedList<String> lista=(LinkedList)session.getAttribute("seslistado");

        clsConceptosFuncionario con = new clsConceptosFuncionario();

        con.setAño(Integer.parseInt(session.getAttribute("Año").toString()));
        con.setMes(Integer.parseInt(session.getAttribute("Mes").toString()));
        con.setRut(lista.get(pos));
    %>
        <table>
            <tr>
                <td>
                    <label for="TotalHaberes" class="control-label">TOTAL HABERES</label>
                    <label id="TotalHaberes" class="control-label">Nombre </label>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="TotalImponible" class="control-label">TOTAL IMPONIBLE</label>
                    <label id="TotalImponible" class="control-label">Nombre </label>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="TotalTributable" class="control-label">TOTAL TRIBUTBLE</label>
                    <label id="TotalTributable" class="control-label">Nombre </label>
                </td>
            </tr>
        </table>
        <Script>
            $(document).ready(function(){              
                $("#TotalHaberes").html("<%= con.SumaConceptos("H",0) %>");
                $("#TotalImponible").html("<%= con.SumaConceptos("H",1) %>");
                $("#TotalTributable").html("<%= con.SumaConceptos("H",2) %>");
            });
        </Script>
    <%}
    
    //DESCUENTO Y LIQUIDO
    if ("16".equals(request.getParameter("llamado"))){
        Integer pos=Integer.parseInt(request.getParameter("pos"));
        LinkedList<String> lista=(LinkedList)session.getAttribute("seslistado");

        clsConceptosFuncionario conf = new clsConceptosFuncionario();

        conf.setAño(Integer.parseInt(session.getAttribute("Año").toString()));
        conf.setMes(Integer.parseInt(session.getAttribute("Mes").toString()));
        conf.setRut(lista.get(pos));
    %>
        <Table>
            <tr>
                <td>
                    <label for="TotalDescuentos" class="control-label">TOTAL DESCUENTOS</label>
                    <label id="TotalDescuentos" class="control-label">Nombre </label>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="Liquido" class="control-label">LIQUIDO A PAGAR</label>
                    <label id="Liquido" class="control-label">Nombre </label>
                </td>
            </tr>
            <tr>
                <td></td>
            </tr>
        </Table>
        <Script>
        $(document).ready(function(){              
            $("#TotalDescuentos").html("<%= conf.SumaConceptos("D",0) %>");
            $("#Liquido").html("<%= conf.SumaConceptos("H",0)-conf.SumaConceptos("D",0) %>");
        });
        </Script>
    <%}


    //LIMPIAR FUNCIONARIOS SELECCIONADOS
    if ("17".equals(request.getParameter("llamado"))){
        LinkedList<String> lista = new LinkedList();
        session.setAttribute("seslistado", lista);
    }
    
    //LISTAR LINKEDLIST EN SELECCIONADOS
    if ("18".equals(request.getParameter("llamado"))){%>
        <table class="table table-bordered" style="font-size:10px" id="TablaSel">
            <tr>
                <th style="text-align: center">Rut Persona</th>
                <th style="text-align: center">Nombre</th>
            </tr>
        <%  
            clsFuncionario fun = new clsFuncionario();
            LinkedList<String> lista=(LinkedList)session.getAttribute("seslistado");
            for (int i=0; i<lista.size(); i++){%>
            <tr>
                <td>
                    <%=lista.get(i)%>
                    <% 
                        fun.setRut(lista.get(i).toString().trim());
                        fun.CargarFuncionario();
                    %>
                </td>
                <td>
                    <%= fun.getApellidoPaterno() + " " + fun.getApellidoMaterno() + " " + fun.getNombre() %>
                </td>
            </tr>
            <%}%>
        </table>
        <script>
            function eliminaSeleccionados(rut) {
                var urlRUT='ProcesaConsultas.jsp?llamado=20&rut='+rut.toString();
                    $.ajax({
                      type: 'POST',
                      url: [urlRUT],
                      dataType  : 'html',
                      success: function(){
                        listarSeleccionados();
                      }
                    });
                
            };// limpiarSeleccionados
            
            $("#TablaSel td").click(function(){
                id = $(this);
                eliminaSeleccionados(id.html());
                //$(this).closest('tr').remove();
            });
        </script>
    <%}

    //AGREGAR A LINKEDLIST EN SELECCIONADOS
    if ("19".equals(request.getParameter("llamado"))){
        LinkedList<String> lista=(LinkedList)session.getAttribute("seslistado");
        if (lista.contains(request.getParameter("rut").trim())==false){
            lista.add(request.getParameter("rut").trim());
        }
    }
    
    //ELIMINA DE LINKEDLIST EN SELECCIONADOS
    if ("20".equals(request.getParameter("llamado"))){
        LinkedList<String> lista=(LinkedList)session.getAttribute("seslistado");
        lista.remove(request.getParameter("rut").trim());
    }
    
    //ASIGNA CONCEPTOS A FUNCIONARIOS
    if ("21".equals(request.getParameter("llamado"))){
        clsConceptosFuncionario con= new clsConceptosFuncionario();
        con.setAño(Integer.parseInt(session.getAttribute("Año").toString()));
        con.setMes(Integer.parseInt(session.getAttribute("Mes").toString()));
        con.setCodigo(request.getParameter("cod"));
        
        if ("1".equals(request.getParameter("gru"))){
            con.setRut(session.getAttribute("rutper").toString());
            if (con.RevisaLiquidada()==false){
                con.GuardarConceptoFuncionario();
            }
        }

        if ("2".equals(request.getParameter("gru"))){
            LinkedList<String> lista=(LinkedList)session.getAttribute("seslistado");
            for (int i=0; i<lista.size(); i++){
                con.setRut(lista.get(i).toString().trim());
                if (con.RevisaLiquidada()==false){
                    con.GuardarConceptoFuncionario();
                }
            }
        }

        if ("3".equals(request.getParameter("gru"))){
            clsFuncionario fun = new clsFuncionario();
            ResultSet rss=fun.ListarFuncionario();
            while (rss.next()) {
                con.setRut(rss.getString(1));
                if (con.RevisaLiquidada()==false){
                    con.GuardarConceptoFuncionario();
                }
            }
        }
    }
    
    //LIQUIDAR FUNCIONARIOS
    if ("22".equals(request.getParameter("llamado"))){
        Integer grupo=Integer.parseInt(request.getParameter("gru"));
        clsConceptosFuncionario conFun = new clsConceptosFuncionario();
        conFun.setAño(Integer.parseInt(session.getAttribute("Año").toString()));
        conFun.setMes(Integer.parseInt(session.getAttribute("Mes").toString()));
        
        if(grupo==1){
            conFun.setRut(session.getAttribute("rutper").toString());
            if (conFun.RevisaLiquidada()==false){
                conFun.CalculaMonto(1);
            }else{
                conFun.Reliquidar();
            }
        }

        if(grupo==2){
            LinkedList<String> lista=(LinkedList)session.getAttribute("seslistado");
            for (int i=0; i<lista.size(); i++){
                conFun.setRut(lista.get(i).toString().trim());
                if (conFun.RevisaLiquidada()==false){
                    conFun.CalculaMonto(1);
                }else{
                    conFun.Reliquidar();
                }
            }
        }

        if(grupo==3){
            clsFuncionario fun = new clsFuncionario();
            ResultSet rss=fun.ListarFuncionario();
            while (rss.next()) {
                conFun.setRut(rss.getString(1));
                if (conFun.RevisaLiquidada()==false){
                    conFun.CalculaMonto(2);
                }else{
                    conFun.Reliquidar();
                }
            }
        }
    }

    //IMPRIMIR LIQUIDACION
    if ("23".equals(request.getParameter("llamado"))){
        try{
            Map par = new HashMap();
            par.put("anoliqui", session.getAttribute("Año").toString());
            par.put("mesliqui", session.getAttribute("Mes").toString());
            par.put("rutliqui", session.getAttribute("rutper").toString());
            par.put("totalhaberes", request.getParameter("tothab").toString());
            par.put("totalimponible", request.getParameter("totimp").toString());
            par.put("totaltributable", request.getParameter("tottri").toString());
            par.put("totaldescuentos", request.getParameter("totdes").toString());
            par.put("liquidopagar", request.getParameter("liq").toString());
            par.put("nombremes",  NombreMes(Integer.parseInt(session.getAttribute("Mes").toString())));
            
            String dir = "C:\\Users\\Articuno\\Documents\\NetBeansProjects\\sisRemuWeb\\src\\java\\reportes\\Liquidacion.jrxml";
            //String dir = "C:\\Reportes\\Liquidacion.jrxml";

            JasperReport reporteJasper = JasperCompileManager.compileReport(dir);
            JasperPrint jasperPrint = JasperFillManager.fillReport(reporteJasper, par, Conexion.db.conn);
            JasperExportManager.exportReportToPdfFile(jasperPrint,"C:\\Ra\\Reporte_Sin_Titulo_1.pdf");
        }catch (JRException x){
            System.out.println("Error:" + x.getMessage());
        }catch (Exception e){
            System.out.println("Error:" + e.getMessage());
        }
    }

    //IMPRIME ARCHIVO PREVIRED
    if ("24".equals(request.getParameter("llamado"))){
        String Mes=request.getParameter("mes").trim();
        String Año=request.getParameter("año").trim();
        
        clsPreviRed previ = new clsPreviRed();
        previ.setAño(Integer.parseInt(Año));
        previ.setMes(Integer.parseInt(Mes));
        previ.CreaArchivoPreviRed();
    }

    //IMPRIME LIBRO REMUNERACIONES
    if ("25".equals(request.getParameter("llamado"))){
        //String Mes=request.getParameter("mes").trim();
        //String Año=request.getParameter("año").trim();
        
        //clsConceptosFuncionario conFun = new clsConceptosFuncionario();
        //conFun.setMes(Integer.parseInt(Mes));
        //conFun.setAño(Integer.parseInt(Año));
        
        try{
            Map par = new HashMap();
            par.put("ano", session.getAttribute("Año").toString());
            par.put("mes", session.getAttribute("Mes").toString());
            
            String dir = "C:\\Users\\Articuno\\Documents\\NetBeansProjects\\sisRemuWeb\\src\\java\\reportes\\LibroRemuneraciones.jrxml";
            //String dir = "C:\\Reportes\\LibroRemuneraciones.jrxml";

            JasperReport reporteJasper = JasperCompileManager.compileReport(dir);
            JasperPrint jasperPrint = JasperFillManager.fillReport(reporteJasper, par, Conexion.db.conn);
            JasperExportManager.exportReportToPdfFile(jasperPrint,"C:\\Ra\\LibroRemuneraciones.pdf");
        }catch (JRException x){
            System.out.println("Error:" + x.getMessage());
        }catch (Exception e){
            System.out.println("Error:" + e.getMessage());
        }
    }

    //LISTAR RANGOS
    if ("26".equals(request.getParameter("llamado"))){
    %>
    <table class="table table-borderless">
                    <div class="panel-heading">
                        <h3 class="panel-title">Rango</h3>
                    </div>
                    <tr>
                        <td>
                            <label for="Desde" class="control-label">Desde: </label>
                            <input type="text" name="Desde" id="Desde" placeholder="Desde" class="form-control"/>
                        </td>
                        <td rowspan="4">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>DESDE</th>
                                        <th>HASTA</th>
                                        <th>VALOR</th>
                                    </tr>
                                </thead>
                                <%
                                    clsConcepto con = new clsConcepto();
                                    con.setMes(Integer.parseInt(session.getAttribute("Mes").toString()));
                                    con.setAño(Integer.parseInt(session.getAttribute("Año").toString()));
                                    ResultSet rs=con.ListarRangos(request.getParameter("cod").trim());
                                    while (rs.next()){ 
                                %>
                                <tr>
                                    <td><%=rs.getString(1)%></td>
                                    <td><%=rs.getString(2)%></td>
                                    <td><%=rs.getString(3)%></td>
                                    <td><a href='#' onclick='EditarRango(this)'><span class='glyphicon glyphicon-edit'></span></a></td>
                                    <td><a href='#' onclick='EliminaRango(<%= rs.getString(1)%>,<%= rs.getString(2)%>)'><span class='glyphicon glyphicon-remove'></span></a></td>
                                </tr>
                                <%}%>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="Hasta" class="control-label">Hasta: </label>
                            <input type="text" name="Hasta" id="Hasta" placeholder="Hasta" class="form-control"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="Valor" class="control-label">Valor: </label>
                            <input type="text" name="Valor" id="Valor" placeholder="Valor" class="form-control"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <button type="button" class="btn btn-primary" aria-label="Left Align" id="ActualizaRango" value="ActualizaRango" onclick="actualizaRango()">
                                <span class="glyphicon glyphicon-plus"></span>Actualizar Rango
                            </button>
                        </td>
                    </tr>
                </table>
                <script>
                    $("#ActualizaRango").click(function(){
                        listarRango('<%=request.getParameter("cod").trim()%>');
                    });
                </script>
    <%}
    
    //GUARDA RANGOS
    if ("27".equals(request.getParameter("llamado"))){
        clsConcepto con = new clsConcepto();
        con.setMes(Integer.parseInt(session.getAttribute("Mes").toString()));
        con.setAño(Integer.parseInt(session.getAttribute("Año").toString()));
        con.setCodigo(request.getParameter("cod").trim());
        con.setDesde(request.getParameter("des"));
        con.setHasta(request.getParameter("des"));
        con.setMonto(Integer.parseInt(request.getParameter("val").toString().trim()));
        con.GuardarRango();
    }
    
    //ELIMINA RANGOS
    if ("28".equals(request.getParameter("llamado"))){
        clsConcepto con = new clsConcepto();
        con.setMes(Integer.parseInt(session.getAttribute("Mes").toString()));
        con.setAño(Integer.parseInt(session.getAttribute("Año").toString()));
        con.setCodigo(request.getParameter("cod").trim());
        con.setDesde(request.getParameter("des"));
        con.setHasta(request.getParameter("des"));
        con.EliminarRangosConcepto();
    }%>