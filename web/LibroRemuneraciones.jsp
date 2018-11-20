<%-- 
    Document   : LibroRemuneraciones
    Created on : 05-sep-2018, 15:23:07
    Author     : Articuno
--%>

<%@page import="controlador.clsConceptosFuncionario"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="menu.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <h2>Libro de Remuneraciones</h2>
    <table class="table table-bordered">
                <thead>
                <tr>
                    <td>RUT</td>
                    <td>NOMBRE</td>
                    <td>BASE</td>
                    <td>EXTRA</td>
                    <td>HAB IMP</td>
                    <td>GRAT</td>
                    <td>TOT IMP</td>
                    <td>A. FAM</td>
                    <td>MOV/LOC</td>
                    <td>HAB NO IMP</td>
                    <td>TOT HABER</td>
                    <td>TIPO AFP</td>
                    <td>DOCTO AFP</td>
                    <td>TIPO SALUD</td>
                    <td>DOCTO SALUD</td>
                    <td>LIQUIDO</td>
                    <td>ANTICIPO</td>
                    <td>LIQUIDO PAGO</td>
                </tr>
                </thead>
                <tbody>
                    <%
                        clsConceptosFuncionario conFun = new clsConceptosFuncionario();
                        conFun.setAño(Integer.parseInt(session.getAttribute("Año").toString()));
                        conFun.setMes(Integer.parseInt(session.getAttribute("Mes").toString()));
                        ResultSet rss = conFun.LibroRemuneraciones();
                        while (rss.next()) {
                    %>
                    <tr>
                        <td> <%= rss.getString(1).trim()%></td>
                        <td> <%= rss.getString(2).trim()%></td>
                        <td> <%= rss.getString(3).trim()%></td>
                        <td> <%= rss.getString(4).trim()%></td>
                        <td> <%= rss.getString(5).trim()%></td>
                        <td> <%= rss.getString(6).trim()%></td>
                        <td> <%= rss.getString(7).trim()%></td>
                        <td> <%= rss.getString(8).trim()%></td>
                        <td> <%= rss.getString(9).trim()%></td>
                        <td> <%= rss.getString(10).trim()%></td>
                        <td> <%= rss.getString(11).trim()%></td>
                        <td> <%= rss.getString(12).trim()%></td>
                        <td> <%= rss.getString(13).trim()%></td>
                        <td> <%= rss.getString(14).trim()%></td>
                        <td> <%= rss.getString(15).trim()%></td>
                        <td> <%= rss.getString(16).trim()%></td>
                        <td> <%= rss.getString(17).trim()%></td>
                        <td> <%= rss.getString(18).trim()%></td>
                    </tr>
                    <%
                    }
                    %>
              </tbody>
            </table>        
    </body>
    <div>
        <button type="button" id="Imprimir" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-plus"></span>Imprimir</button>
        <button type="button" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-plus"></span>Exportar Excel</button>
    </div>
    <script>
        $('#Imprimir').click(function() {
            var urlRUT='ProcesaConsultas.jsp?llamado=25';
                $.ajax({
                  type: 'POST',
                  url: [urlRUT],
                  dataType  : 'html',
                  success: function(data){
                  }
                });
        });  // imprimir
    </script>
</html>
