<%-- 
    Document   : SeleccionConceptos
    Created on : 29-ago-2018, 16:20:29
    Author     : Articuno
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.List"%>
<%@page import="controlador.clsConcepto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/Funciones.js" type="text/javascript"></script>
    </head>
    <body>
        <div class="panel panel-default" >
            <div class="panel-heading">Tipo de Concepto</div>
            <table style="width: 100%">
                <tr>
                    <td style="text-align: center">
                        <input type="radio" id="ConceptoH" name="Concepto" value="H" checked>Haber              
                    </td>
                    <td style="text-align: center">
                        <input type="radio" id="ConceptoD" name="Concepto" value="D">Descuento
                    </td>
                </tr>
            </table>
        </div>
        <div class="panel panel-default" id="cmbHaberes">
            <table style="width: 100%">
                <tr>
                    <td>
                        <%
                            clsConcepto con = new clsConcepto();
                            con.setAño(Integer.parseInt(session.getAttribute("Año").toString()));
                            con.setMes(Integer.parseInt(session.getAttribute("Mes").toString()));
                            ResultSet rss = con.ListarConceptosNoObligatorio("H");%>
                            <select name="Haberes" id="Haber" class="form-control" id="sel1">
                                <%while (rss.next()){%>
                                    <option value="<%=rss.getString(3)%>"><%=rss.getString(4)%></option>
                                <%}%>
                            </select>
                    </td>
                </tr>
            </table>
        </div>
        <div class="panel panel-default" id="cmbDescuentos" style="display: none">
            <table style="width: 100%">
                <tr>
                    <td>
                         <%
                            clsConcepto con2 = new clsConcepto();
                            con2.setAño(Integer.parseInt(session.getAttribute("Año").toString()));
                            con2.setMes(Integer.parseInt(session.getAttribute("Mes").toString()));
                            ResultSet rss2 = con2.ListarConceptosNoObligatorio("D");%>
                            <select name="Descuentos" id="Descuento"  class="form-control" id="sel1">
                                <%while (rss2.next()){%>
                                    <option value="<%=rss2.getString(3)%>"><%=rss2.getString(4)%></option>
                                <%}%>
                            </select>
                    </td>
                </tr>
            </table>
        </div>
        <div class="panel panel-default" id="cmbHaberes">
            <div class="panel-heading">Aplicar concepto para:</div>
            <table style="width: 100%">
                <tr>
                    <td style="text-align: center">
                        <input type="radio" id="Grupo" name="Grupo" value="1" checked>Funcionario Activo
                    </td>
                    <td style="text-align: center">
                        <input type="radio" id="Grupo" name="Grupo" value="2" >Grupo Seleccionado
                    </td>
                    <td style="text-align: center">
                        <input type="radio" id="Grupo" name="Grupo" value="3" >Todos
                    </td>
                </tr>
            </table>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-primary" id="Asignar" onclick="AsignaConceptos()" value="Agregar" >Asignar</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        </div>
        <script>
            $('#Asignar').click(function(){
                $(".modal").modal("hide");
            });
            
            $('#ConceptoH').click(function() {
                $('#cmbHaberes').show();
                $('#cmbDescuentos').hide();
            });
            $('#ConceptoD').click(function() {
                $('#cmbDescuentos').show();
                $('#cmbHaberes').hide();
            });
        </script>
    </body>
</html>
