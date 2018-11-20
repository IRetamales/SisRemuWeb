<%-- 
    Document   : ListarSalud
    Created on : 05-sep-2018, 17:24:07
    Author     : Articuno
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="controlador.clsSalud"%>
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
            <h2>Mantenedor Institución Salud</h2>
            <button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#myInstitucionSalud" onclick="cargar('#AgregarSalud','DatosInstitucionSalud.jsp?acc=0');"><span class="glyphicon glyphicon-plus"></span>Agregar Institución</button>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                    </tr>
                    <%
                        clsSalud sal = new clsSalud();

                        ResultSet rss = sal.ListarSalud();
                        while (rss.next()) {
                                String ver ="DatosInstitucionSalud.jsp?cod="+rss.getString(1)+"&acc=2";
                                String edi ="DatosInstitucionSalud.jsp?cod="+rss.getString(1)+"&acc=1";
                                String eli ="DatosInstitucionSalud.jsp?cod="+rss.getString(1)+"&acc=3";
                        %>
                        <tr>
                        <td> <%= rss.getString(1)%></td> 
                        <td> <%= rss.getString(2)%></td> 
                        <td><a href="#" class="btn btn-info" data-toggle="modal" data-target="#myInstitucionSalud" class="btn btn-info" onclick="cargar('#AgregarSalud','<%= ver%>')"><span class="glyphicon glyphicon-eye-open"></span> Ver</a></td>
                        <td><a href="#" class="btn btn-success" data-toggle="modal" data-target="#myInstitucionSalud" class="btn btn-default" onclick="cargar('#AgregarSalud','<%= edi%>')"><span class="glyphicon glyphicon-pencil"></span> Editar</a>
                        <td><a href="#" class="btn btn-danger" data-toggle="modal" data-target="#myInstitucionSalud" class="btn btn-default" onclick="cargar('#AgregarSalud','<%= eli%>')"><span class="glyphicon glyphicon-trash"></span> Eliminar</a></td>
                        </tr> 
                        <%
                        }
                        %>
                </thead>
            </table>
        </div>
        <div class="modal fade" id="myInstitucionSalud" role="dialog">
            <div class="modal-dialog">
              <!-- Modal content-->
                <div class="modal-content">
                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal">&times;</button>
                          <h4 class="modal-title">Datos Institución</h4>
                        </div>
                        <div class="modal-body" id="modal-body">
                            <div id="AgregarSalud"></div>
                        </div>
                </div>
            </div>
        </div>
    </body>
</html>
