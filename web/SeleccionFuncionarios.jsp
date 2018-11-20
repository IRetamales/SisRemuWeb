<%-- 
    Document   : SeleccionFuncionarios
    Created on : 29-ago-2018, 9:42:18
    Author     : Articuno
--%>

<%@page import="java.util.LinkedList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="controlador.clsFuncionario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
        <table>
            <tr>
                <td>
                    
                </td>
                <td>
                    <button type="button" class="btn btn-sm btn-primary" id="limpiarSeleccinados"><span class="glyphicon glyphicon-share"></span>Limpiar</button>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="panel panel-default" style="width: 290px; height: 500px; max-height: 500px;overflow-y: scroll; overflow-x: scroll; white-space: nowrap;" >          
                        <table class="table table-bordered" style="font-size:10px" id="Seleccion">
                            <thead>
                                <tr>
                                    <th style="text-align: center">Rut Persona</th>
                                    <th style="text-align: center">Nombre</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    LinkedList<String> lista=(LinkedList)session.getAttribute("seslistado");
                                    
                                    clsFuncionario fun = new clsFuncionario();
                                    ResultSet rss = fun.ListarFuncionario();
                                    while (rss.next()) {
                                        
                                %>
                                <tr>
                                    <td><%= rss.getString(1)%></td> 
                                    <td><%= rss.getString(3)+ " " + rss.getString(4) + " " + rss.getString(2)%></td> 
                                </tr> 
                                <%
                                }
                                %>
                            </tbody>
                        </table>
                    </div>
                </td>
                <td>
                    <div class="panel panel-default" style="width: 290px; height: 500px; max-height: 500px;overflow-y: scroll; overflow-x: scroll; white-space: nowrap;" id="Seleccionados"> 
                    </div>
                </td>
            </tr>
        </table>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        </div>
        <script>
            $(document).ready(function(){
                listarSeleccionados();
            });
            
            function listarSeleccionados() {
                var urlRUT='ProcesaConsultas.jsp?llamado=18';
                    $.ajax({
                      type: 'POST',
                      url: [urlRUT],
                      dataType  : 'html',
                      success: function(data){
                        $('#Seleccionados').html(data);
                      }
                    });
            };// listarSeleccionados
            
            function limpiarSeleccionados() {
                var urlRUT='ProcesaConsultas.jsp?llamado=17';
                    $.ajax({
                      type: 'POST',
                      url: [urlRUT],
                      dataType  : 'html',
                      success: function(data){
                        $('#Seleccionados').html(data);
                      }
                    });
            };// limpiarSeleccionados
            
            function agregarSeleccionados(rut) {
                var urlRUT='ProcesaConsultas.jsp?llamado=19&rut='+rut.toString();
                    $.ajax({
                      type: 'POST',
                      url: [urlRUT],
                      dataType  : 'html',
                      success: function(){
                        listarSeleccionados();
                      }
                    });
                
            };// limpiarSeleccionados
            
            $("#limpiarSeleccinados").click(function(){
               limpiarSeleccionados();
            });
            
            $("#Seleccion td").click(function(){
                id = $(this);
                agregarSeleccionados(id.html());
                //$(this).closest('tr').remove();
            });
        </script>
    </body>
</html>
