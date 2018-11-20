<%-- 
    Document   : ListadoInstitucionPension
    Created on : 05-sep-2018, 17:12:59
    Author     : Articuno
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="controlador.clsPension"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="menu.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <div role="tabpanel" style="width: 700px;" class="center-block">
            <h2>Mantenedor Institución Pensión</h2>
            <button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#myInstitucionPension" onclick="cargar('#AgregarPension','DatosInstitucionPension.jsp?acc=0');"><span class="glyphicon glyphicon-plus"></span>Agregar Institución</button>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Tipo Sistema</th>
                        <th>Valor</th>
                    </tr>
                    <%
                        clsPension pen = new clsPension();
                        pen.setAño(Integer.parseInt(session.getAttribute("Año").toString()));
                        pen.setMes(Integer.parseInt(session.getAttribute("Mes").toString()));

                        ResultSet rss = pen.ListarPension();
                        while (rss.next()) {
                                String ver ="DatosInstitucionPension.jsp?cod="+rss.getString(3)+"&acc=2";
                                String edi ="DatosInstitucionPension.jsp?cod="+rss.getString(3)+"&acc=1";
                                String eli ="DatosInstitucionPension.jsp?cod="+rss.getString(3)+"&acc=3";
                        %>
                        <tr>
                        <td> <%= rss.getString(3)%></td> 
                        <td> <%= rss.getString(4)%></td> 
                        <td> <%= rss.getString(5)%></td> 
                        <td> <%= rss.getString(6)%></td>
                        <td><a href="#" class="btn btn-info" data-toggle="modal" data-target="#myInstitucionPension" class="btn btn-info" onclick="cargar('#AgregarPension','<%= ver%>')"><span class="glyphicon glyphicon-eye-open"></span> Ver</a></td>
                        <td><a href="#" class="btn btn-success" data-toggle="modal" data-target="#myInstitucionPension" class="btn btn-default" onclick="cargar('#AgregarPension','<%= edi%>')"><span class="glyphicon glyphicon-pencil"></span> Editar</a>
                        <td><a href="#" class="btn btn-danger" data-toggle="modal" data-target="#myInstitucionPension" class="btn btn-default" onclick="cargar('#AgregarPension','<%= eli%>')"><span class="glyphicon glyphicon-trash"></span> Eliminar</a></td>
                        </tr> 
                        <%
                        }
                        %>
                </thead>
            </table>
        </div>
        <div class="modal fade" id="myInstitucionPension" role="dialog">
            <div class="modal-dialog">
              <!-- Modal content-->
                <div class="modal-content">
                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal">&times;</button>
                          <h4 class="modal-title">Datos Institución</h4>
                        </div>
                        <div class="modal-body" id="modal-body">
                            <div id="AgregarPension"></div>
                        </div>
                </div>
            </div>
        </div>
    </body>
</html>
