<%-- 
    Document   : ListadoTipoTrabajador
    Created on : 07-sep-2018, 15:10:18
    Author     : Articuno
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="controlador.clsTipoTrabajador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="menu.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div role="tabpanel" style="width: 700px;" class="center-block">       
            <h2>Mantenedor Tipo Trabajador</h2>
            <button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#myTipoTrabajador" onclick="cargar('#AgregarTipoTrab','DatosTipoTrabajador.jsp?acc=0');"><span class="glyphicon glyphicon-plus"></span>Agregar Tipo Trabajador</button>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                    </tr>
                    <%
                        clsTipoTrabajador con = new clsTipoTrabajador();

                        ResultSet rss = con.ListarTipoTrabajador();
                        while (rss.next()) {
                                String ver ="DatosTipoTrabajador.jsp?cod="+rss.getString(1)+"&acc=2";
                                String edi ="DatosTipoTrabajador.jsp?cod="+rss.getString(1)+"&acc=1";
                                String eli ="DatosTipoTrabajador.jsp?cod="+rss.getString(1)+"&acc=3";
                        %>
                        <tr>
                        <td> <%= rss.getString(1)%></td> 
                        <td> <%= rss.getString(2)%></td> 
                        <td><a href="#" class="btn btn-info" data-toggle="modal" data-target="#myTipoTrabajador" class="btn btn-info" onclick="cargar('#AgregarTipoTrab','<%= ver%>')"><span class="glyphicon glyphicon-eye-open"></span> Ver</a></td>
                        <td><a href="#" class="btn btn-success" data-toggle="modal" data-target="#myTipoTrabajador" class="btn btn-default" onclick="cargar('#AgregarTipoTrab','<%= edi%>')"><span class="glyphicon glyphicon-pencil"></span> Editar</a>
                        <td><a href="#" class="btn btn-danger" data-toggle="modal" data-target="#myTipoTrabajador" class="btn btn-default" onclick="cargar('#AgregarTipoTrab','<%= eli%>')"><span class="glyphicon glyphicon-trash"></span> Eliminar</a></td>
                        </tr> 
                        <%
                        }
                        %>
                </thead>
            </table>
        </div>
        <div class="modal fade" id="myTipoTrabajador" role="dialog">
            <div class="modal-dialog">
              <!-- Modal content-->
                <div class="modal-content">
                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal">&times;</button>
                          <h4 class="modal-title">Datos Tipo Trabajador</h4>
                        </div>
                        <div class="modal-body" id="modal-body">
                            <div id="AgregarTipoTrab"></div>
                        </div>
                </div>
            </div>
        </div>
    </body>
</html>
