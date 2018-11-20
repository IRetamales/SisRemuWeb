<%-- 
    Document   : ListarFuncionarios
    Created on : 07-may-2018, 15:24:59
    Author     : Kraken
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="controlador.clsFuncionario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="menu.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <link rel="stylesheet" href="estilo.css">
        <script src="js/Funciones.js" type="text/javascript"></script>
        <script src="js/BuscadorTabla.js" type="text/javascript"></script>
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.0/css/bootstrapValidator.min.css"/>
        <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.0/js/bootstrapValidator.min.js"> </script>
        <title>Listar Trabajadores</title>
    </head>
    <body>
        <div class="container">
            <h2>Listado de Trabajadores</h2>
            <table>
                <tr>
                    <td>
                        <label for="Buscar" class="control-label col-xl-4">Buscar:</label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input id="searchTerm" class="form-control" type="text" onkeyup="BuscarFuncionarios()" />
                    </td>
                    <td>   
                        <button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModal" onclick="cargar('#Agregar','DatosFuncionario.jsp?acc=0');"><span class="glyphicon glyphicon-plus"></span>Agregar Funcionario</button>
                    </td>
                </tr>
            </table>
            <table class="table table-hover" id="datos">
                <thead>
                <tr>
                    <th>Rut Persona</th>
                    <th>Nombres</th>
                    <th>Apellido Paterno</th>
                    <th>Apellido Materno</th>
                </tr>
                </thead>
                <tbody>
                    <%
                        clsFuncionario fun = new clsFuncionario();
                        ResultSet rss = fun.ListarFuncionario();
                        while (rss.next()) {
                            String ver ="DatosFuncionario.jsp?rut="+rss.getString(1)+"&acc=2";
                            String edi ="DatosFuncionario.jsp?rut="+rss.getString(1)+"&acc=1";
                            String eli ="DatosFuncionario.jsp?rut="+rss.getString(1)+"&acc=3";
                    %>
                    <tr>
                    <td> <%= rss.getString(1)%></td> 
                    <td> <%= rss.getString(2)%></td> 
                    <td> <%= rss.getString(3)%></td> 
                    <td> <%= rss.getString(4)%></td>
                    <td><a href="#" class="btn btn-info" data-toggle="modal" data-target="#myModal" class="btn btn-info" onclick="cargar('#Agregar','<%= ver%>')"><span class="glyphicon glyphicon-eye-open"></span> Ver</a></td>
                    <td><a href="#" class="btn btn-success" data-toggle="modal" data-target="#myModal" class="btn btn-default" onclick="cargar('#Agregar','<%= edi%>')"><span class="glyphicon glyphicon-pencil"></span> Editar</a>
                    <td><a href="#" class="btn btn-danger" data-toggle="modal" data-target="#myModal" class="btn btn-default" onclick="cargar('#Agregar','<%= eli%>')"><span class="glyphicon glyphicon-trash"></span> Eliminar</a></td>
                    </tr> 
                    <%
                    }
                    %>
                    <tr><td><a href="javascript:Abrir_ventana('ExportarExcel.jsp?exp=1')" class="btn btn-primary">Exportar a Excel</a></td></tr>
              </tbody>
            </table>
        </div> 
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">
              <!-- Modal content-->
                <div class="modal-content">
                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal">&times;</button>
                          <h4 class="modal-title">Datos Persona</h4>
                        </div>
                        <div class="modal-body" id="modal-body">
                            <div id="Agregar"></div>
                        </div>
                </div>
            </div>
        </div>
    </body>
    <script>
        function cargar(div, destino){
            $(div).load(destino);   
        }
        
        function Abrir_ventana (pagina) {
                var opciones= "toolbar=no, location=no, directories=no, status=yes, menubar=yes, scrollbars=no, resizable=yes, width=508, height=365, top=0, left=0";
                window.open(pagina,"",opciones);
                setTimeout(pagina.close(),1000);
            }
        
        $("#Exportar").on('click', function(){
            var urlRUT='ExportarExcel.jsp?exp=1';
                    $.ajax({
                      type: 'POST',
                      url: [urlRUT],
                      dataType  : 'html',
                      success: function(data){
                        
                      }
                    });
        });
    </script>
</html>
