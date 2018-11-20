<%-- 
    Document   : PruebaTablaEditable
    Created on : 23-ago-2018, 16:44:31
    Author     : Articuno
--%>

<%@page import="net.sf.jasperreports.engine.JasperExportManager"%>
<%@page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@page import="net.sf.jasperreports.engine.JasperReport"%>
<%@page import="net.sf.jasperreports.engine.JasperFillManager"%>
<%@page import="net.sf.jasperreports.engine.JasperCompileManager"%>
<%@page import="net.sf.jasperreports.engine.JasperCompileManager"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="controlador.clsFuncionario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="menu.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/Funciones.js" type="text/javascript"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <%
            clsFuncionario fun = new clsFuncionario();
            LinkedList<String> lista=(LinkedList)session.getAttribute("seslistado");
            
            if ((lista==null)||(lista.size()==0)){
                LinkedList<String> listado = new LinkedList();
            
                ResultSet rss = fun.ListarFuncionario();
                while (rss.next()){
                    listado.add(rss.getString(1));
                }

                session.setAttribute("seslistado", listado);
                lista=(LinkedList)session.getAttribute("seslistado");
            }
        %>
        <div class="panel panel-default center-block" style="width: 735px">
            <table>
                <tr>
                    <td style="text-align: center" colspan="2">
                        <label id="rutpersona" class="control-label"></label>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center" colspan="2">
                        <label id="nombrepersona" class="control-label"></label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="panel panel-default" style="width: 300px; height: 300px; max-height: 300px;overflow-y: scroll;" id="Haberes" style="">
                            
                        </div>
                    </td>
                    <td>
                        <div class="panel panel-default" style="width: 300px; height: 300px; max-height: 300px;overflow-y: scroll;" id="Descuentos">
         
                        </div>
                    </td>
                    <td>
                        <button type="button"  class="btn btn-sm btn-primary" data-toggle="modal" data-target="#myModale" onclick="cargarModal('#Seleccionar','SeleccionFuncionarios.jsp');"><span class="glyphicon glyphicon-share"></span>Obt. Funcionarios</button></br></br>
                        <button type="button"  class="btn btn-sm btn-primary" data-toggle="modal" data-target="#AsignaConceptos" onclick="cargarModal('#Asigna','SeleccionConceptos.jsp');"><span class="glyphicon glyphicon-share"></span>Asignar Concepto</button></br></br>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center" colspan="2">
                        <label id="registros" class="control-label"></label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div id="Totales">
                            
                        </div>
                    </td>
                    <td>
                        <div id="DescuentosLiquido">
                            
                        </div>
                    </td>
                </tr> 
                <tr>
                    <td style="text-align:right">
                        <button type="button" id="anterior" class="btn btn-default">
                            <span class="glyphicon glyphicon-backward"></span>
                        </button>
                    </td>
                    <td>
                        <button type="button" id="siguiente" class="btn btn-default">
                            <span class="glyphicon glyphicon-forward"></span>
                        </button>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right" colspan="3">
                        <button type="button"  class="btn btn-sm btn-primary" data-toggle="modal" data-target="#LiquidarFuncionarios" onclick="cargarModal('#Liquida','LiquidarFuncionarios.jsp');"><span class="glyphicon glyphicon-share"></span>Liquidar</button>
                        <button type="button"  id="Imprimir" class="btn btn-default" onclick="ImprimirLiquidaciones()"><span class="glyphicon glyphicon-share"></span>Imprimir Liquidacion</button>
                    </td>
                </tr>
            </table>
        </div>
        <div class="modal fade" id="myModale" role="dialog">
            <div class="modal-dialog">
              <!-- Modal content-->
                <div class="modal-content">
                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal">&times;</button>
                          <h4 class="modal-title">Seleccionar Funcionario</h4>
                        </div>
                    <div class="modal-body" id="modal-body">
                            <div id="Seleccionar"></div>
                        </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="AsignaConceptos" role="dialog">
            <div class="modal-dialog">
              <!-- Modal content-->
                <div class="modal-content">
                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal">&times;</button>
                          <h4 class="modal-title">Asignar Conceptos</h4>
                        </div>
                    <div class="modal-body" id="modal-body">
                            <div id="Asigna"></div>
                        </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="LiquidarFuncionarios" role="dialog">
            <div class="modal-dialog">
              <!-- Modal content-->
                <div class="modal-content">
                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal">&times;</button>
                          <h4 class="modal-title">Seleccionar Grupo</h4>
                        </div>
                    <div class="modal-body" id="modal-body">
                            <div id="Liquida"></div>
                        </div>
                </div>
            </div>
        </div>
        <script>
            function cargarModal(div, destino){
                $(div).load(destino);   
            }
            
            $(document).ready(function(){              
                listarHaberes(0);
                listarDescuentos(0);
                listarTotales(0);
                listarLiquido(0);
                $("#registros").html("Registro: " + (i+1) + " de " + <%= lista.size() %>);
            });
            
            $("#myModale").on('hidden.bs.modal', function () {
                location.reload();
            });

            $("#AsignaConceptos").on('hidden.bs.modal', function () {
                location.reload();
            });

            $("#LiquidarFuncionarios").on('hidden.bs.modal', function () {
                location.reload();
            });
            
            function listarHaberes(pos) {
                var urlRUT='ProcesaConsultas.jsp?llamado=13&pos='+pos;
                    $.ajax({
                      type: 'POST',
                      url: [urlRUT],
                      dataType  : 'html',
                      success: function(data){
                        $('#Haberes').html(data);
                      }
                    });
            }  // listarHaberes
            
            function listarDescuentos(pos) {
                var urlRUT='ProcesaConsultas.jsp?llamado=14&pos='+pos;
                    $.ajax({
                      type: 'POST',
                      url: [urlRUT],
                      dataType  : 'html',
                      success: function(data){
                        $('#Descuentos').html(data);
                      }
                    });
            }  // listarDescuentos
            
            function listarTotales(pos) {
                var urlRUT='ProcesaConsultas.jsp?llamado=15&pos='+pos;
                    $.ajax({
                      type: 'POST',
                      url: [urlRUT],
                      dataType  : 'html',
                      success: function(data){
                        $('#Totales').html(data);
                      }
                    });
            }  // listarTotales
            
            function listarLiquido(pos) {
                var urlRUT='ProcesaConsultas.jsp?llamado=16&pos='+pos;
                    $.ajax({
                      type: 'POST',
                      url: [urlRUT],
                      dataType  : 'html',
                      success: function(data){
                        $('#DescuentosLiquido').html(data);
                      }
                    });
            }  // listarLiquido    

            var i = 0;
            $('#siguiente').click(function(){
                if (i<<%=lista.size()-1%>){
                    i++;
                    listarHaberes(i);
                    listarDescuentos(i);
                    listarTotales(i);
                    listarLiquido(i);
                    $("#registros").html("Registro: " + (i+1) + " de " + <%= lista.size() %>);
                }
            });
            
            $('#anterior').click(function(){
                if (i > 0) {
                    i--;
                    listarHaberes(i);
                    listarDescuentos(i);
                    listarTotales(i);
                    listarLiquido(i);
                    $("#registros").html("Registro: " + (i+1) + " de " + <%= lista.size() %>);
                }
            });
        </script>
    </body>
</html>
