<%-- 
    Document   : ExportarExcel
    Created on : 12-sep-2018, 11:24:28
    Author     : Articuno
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="controlador.clsFuncionario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    
    <% 
    if ("1".equals(request.getParameter("exp"))){
            response.setContentType("application/vnd.ms-excel");
            response.setHeader("Content-Disposition", "inline; filename=" + "excel.xls");%>
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
                    %>
                    <tr>
                    <td> <%= rss.getString(1)%></td> 
                    <td> <%= rss.getString(2)%></td> 
                    <td> <%= rss.getString(3)%></td> 
                    <td> <%= rss.getString(4)%></td>
                    </tr> 
                    <%
                    }
                    %>
              </tbody>
            </table>
    <%}%>
    </body>
</html>
