<%-- 
    Document   : DatosVinculo
    Created on : 07-sep-2018, 15:56:18
    Author     : Articuno
--%>

<%@page import="controlador.clsVinculo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div role="tabpanel" class="center-block">
            <form action="IngresoMantenedores" method="post" id="formulario">
                <%
                    Integer intAccion = Integer.parseInt(request.getParameter("acc"));
                    Integer cod=0, hab=0;
                    String nom="";
                    
                    if (intAccion!=0){
                        clsVinculo vin = new clsVinculo();
                        Integer codigo = Integer.parseInt(request.getParameter("cod"));
                        vin.setIdVinculo(codigo);
                        vin.CargaVinculo();
                        
                        cod=vin.getIdVinculo();
                        nom=vin.getNombre();
                        hab=vin.getHabilitado();
                    }
                %>
                <input type="hidden" name="iMant" value="7" >
                <input type="hidden" name="iacc" value="<%= intAccion%>" >
                <table style="width: 100%">
                    <tr>
                        <td>
                            <label for="IdVinculo" class="control-label">ID: </label>
                        </td>
                        <td>
                            <label for="nombreVinculo" class="control-label">Nombre Institucion: </label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" name="IdVinculo" id="IdVinculo" class="form-control" value="<%= cod%>" maxlength="9"/>
                        </td>
                        <td>
                            <input type="text" name="nombreVinculo" id="nombreVinculo" class="form-control" value="<%= nom%>" maxlength="9"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <% if(hab==0){ %>
                            <input type="checkbox" id="Habilitado" name="Habilitado"/>Habilitado
                            <%}else{ %>
                            <input type="checkbox" id="Habilitado" name="Habilitado" checked/>Habilitado
                            <%} %>
                        </td>
                    </tr>
                </table>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary save" id="Guardar">Guardar Cambios</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                </div>
            </form>
        </div>
    </body>
</html>
