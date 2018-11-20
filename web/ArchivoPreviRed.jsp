<%-- 
    Document   : ArchivoPreviRed
    Created on : 05-sep-2018, 13:32:19
    Author     : Articuno
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="controlador.clsPeriodo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="js/FuncionesJSP.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
<body>
        <table class="table table-hover" id="listadoperiodos">
                <thead>
                <tr>
                    <td style="display:none">idMes</td>
                    
                    <td class="asd">Año</td>
                    <td class="asd">Mes</td>
                </tr>
                </thead>
                <tbody>
                    <%
                        clsPeriodo per = new clsPeriodo();
                        ResultSet rss = per.ListarPeriodos();
                        while (rss.next()) {
                    %>
                    <tr>
                        <td style="display:none"> <%= rss.getString(2).trim()%></td>
                        
                        <td> <%= rss.getString(1).trim()%></td>
                        <td> <%= NombreMes(Integer.parseInt(rss.getString(2)))%></td>
                    </tr>
                    <%
                    }
                    %>
              </tbody>
            </table>        
        <button type="button" class="btn btn-primary">Aceptar</button>
    </body>
    <script>
        $(document).ready(function() {
            $('#listadoperiodos').dataTable( {
                "ordering": false
            });
            
            var table = $('#listadoperiodos').DataTable();

            $('#listadoperiodos tbody').on( 'click', 'tr', function () {
                if ( $(this).hasClass('selected') ) {
                    $(this).removeClass('selected');
                }
                else {
                    table.$('tr.selected').removeClass('selected');
                    $(this).addClass('selected');
                    var celdas = $(this).find('td');
                    var mes=$(celdas[0]).html();
                    //var nommes=$(celdas[2]).html();
                    var año=$(celdas[1]).html();
                    enviaPeriodo(mes,año);                
                }
                $('#myModal').modal('hide');
            });

            $('#button').click( function () {
                table.row('.selected').remove().draw( false );
            });
            
            function enviaPeriodo(mes, año) {
                    var urlRUT='ProcesaConsultas.jsp?llamado=24&mes='+mes+'&año='+año;
                        $.ajax({
                          type: 'POST',
                          url: [urlRUT],
                          dataType  : 'html',
                          success: function(data){
                            $('#listadocargas').html(data);
                          }
                        });
                }  // listarUsuarios
        });
    </script>
</html>
