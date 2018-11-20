<%-- 
    Document   : ListadoParametros
    Created on : 07-sep-2018, 16:08:04
    Author     : Articuno
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="controlador.clsParametros"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="menu.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div role="tabpanel" class="center-block">       
            <h2>Mantenedor Parametros</h2>
            <button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#myParametro" onclick="cargar('#AgregarParametro','DatosParametro.jsp?acc=0');"><span class="glyphicon glyphicon-plus"></span>Agregar Parametro</button>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Codigo</th>
                        <th>Descripcion</th>
                        <th>Valor Numero</th>
                        <th>Valor Alfanumerico</th>
                        <th>Valor Fecha</th>
                    </tr>
                    <%
                        clsParametros par = new clsParametros();
                        par.setAño(Integer.parseInt(session.getAttribute("Año").toString()));
                        par.setMes(Integer.parseInt(session.getAttribute("Mes").toString()));
                        ResultSet rss = par.ListarParametros();
                        while (rss.next()) {
                                String ver ="DatosParametro.jsp?cod="+rss.getString(3)+"&acc=2";
                                String edi ="DatosParametro.jsp?cod="+rss.getString(3)+"&acc=1";
                                String eli ="DatosParametro.jsp?cod="+rss.getString(3)+"&acc=3";
                        %>
                        <tr>
                        <td> <%= rss.getString(3)%></td> 
                        <td> <%= rss.getString(4)%></td> 
                        <td> <%= rss.getString(5)%></td> 
                        <td> <%= rss.getString(6)%></td> 
                        <td> <%= rss.getString(7)%></td> 
                        <td><a href="#" class="btn btn-info" data-toggle="modal" data-target="#myParametro" class="btn btn-info" onclick="cargar('#AgregarParametro','<%= ver%>')"><span class="glyphicon glyphicon-eye-open"></span> Ver</a></td>
                        <td><a href="#" class="btn btn-success" data-toggle="modal" data-target="#myParametro" class="btn btn-default" onclick="cargar('#AgregarParametro','<%= edi%>')"><span class="glyphicon glyphicon-pencil"></span> Editar</a>
                        <td><a href="#" class="btn btn-danger" data-toggle="modal" data-target="#myParametro" class="btn btn-default" onclick="cargar('#AgregarParametro','<%= eli%>')"><span class="glyphicon glyphicon-trash"></span> Eliminar</a></td>
                        </tr> 
                        <%
                        }
                        %>
                </thead>
            </table>
        </div>
        <div class="modal fade" id="myParametro" role="dialog">
            <div class="modal-dialog">
              <!-- Modal content-->
                <div class="modal-content">
                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal">&times;</button>
                          <h4 class="modal-title">Datos Tipo Trabajador</h4>
                        </div>
                        <div class="modal-body" id="modal-body">
                            <div id="AgregarParametro"></div>
                        </div>
                </div>
            </div>
        </div>
    </body>
</html>
