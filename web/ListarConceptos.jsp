<%-- 
    Document   : ListarConceptos
    Created on : 17-ago-2018, 14:37:17
    Author     : Articuno
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="controlador.clsConcepto"%>
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
        <title>Listar Conceptos</title>
    </head>
    <body>
        <div class="container">
            <h2>Listado de Conceptos</h2>
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
                        <button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModalConcepto" onclick="cargar('#AgregarConcepto','DatosConcepto.jsp?acc=0');"><span class="glyphicon glyphicon-plus"></span>Agregar Conceptos</button>
                    </td>
                </tr>
            </table>
            <table class="table table-hover" id="datosConceptos">
                <thead>
                <tr>
                    <th>Codigo</th>
                    <th>Descripcion</th>
                    <th>Tipo Concepto</th>
                    <th>Modo</th>
                </tr>
                </thead>
                <tbody>
                    <%
                        clsConcepto con = new clsConcepto();
                        con.setAño(Integer.parseInt(sesion.getAttribute("Año").toString()));
                        con.setMes(Integer.parseInt(sesion.getAttribute("Mes").toString()));
                        ResultSet rss = con.ListarConceptos(0);
                        while (rss.next()) {
                            String ver ="DatosConcepto.jsp?codigo="+rss.getString(1)+"&acc=2";
                            String edi ="DatosConcepto.jsp?codigo="+rss.getString(1)+"&acc=1";
                            String eli ="DatosConcepto.jsp?codigo="+rss.getString(1)+"&acc=3";
                    %>
                    <tr>
                    <td> <%= rss.getString(1)%></td> 
                    <td> <%= rss.getString(2)%></td> 
                    <td> <%= rss.getString(3)%></td> 
                    <td> <%= rss.getString(4)%></td>
                    <td><a href="#" class="btn btn-info" data-toggle="modal" data-target="#myModalConcepto" class="btn btn-info" onclick="cargar('#AgregarConcepto','<%= ver%>')"><span class="glyphicon glyphicon-eye-open"></span> Ver</a></td>
                    <td><a href="#" class="btn btn-success" data-toggle="modal" data-target="#myModalConcepto" class="btn btn-default" onclick="cargar('#AgregarConcepto','<%= edi%>')"><span class="glyphicon glyphicon-pencil"></span> Editar</a>
                    <td><a href="#" class="btn btn-danger" data-toggle="modal" data-target="#myModalConcepto" class="btn btn-default" onclick="cargar('#AgregarConcepto','<%= eli%>')"><span class="glyphicon glyphicon-trash"></span> Eliminar</a></td>
                    </tr> 
                    <%
                    }
                    %>
                    <tr><td><a href="javascript:Abrir_ventana('ExportarArriendosExcel.jsp?exportToExcel=YES')" class="btn btn-primary">Exportar a Excel</a></td></tr>
              </tbody>
            </table>
        </div>
        <div class="modal fade" id="myModalConcepto" role="dialog">
            <div class="modal-dialog">
              <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                      <h4 class="modal-title">Datos Concepto</h4>
                    </div>
                    <div class="modal-body" id="modal-body">
                        <div id="AgregarConcepto"></div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script>
        function cargar(div, destino){
            $(div).load(destino);   
        }
    </script>
</html>