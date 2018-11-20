<%-- 
    Document   : DatosTipoTrabajador
    Created on : 07-sep-2018, 15:15:20
    Author     : Articuno
--%>

<%@page import="controlador.clsTipoTrabajador"%>
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
                        clsTipoTrabajador tra = new clsTipoTrabajador();
                        Integer codigo = Integer.parseInt(request.getParameter("cod"));
                        tra.setIdTipoTrabajador(codigo);
                        tra.CargaTipoTrabajador();
                        
                        cod=tra.getIdTipoTrabajador();
                        nom=tra.getNombre();
                        hab=tra.getHabilitado();
                    }
                %>
                <input type="hidden" name="iMant" value="5" >
                <input type="hidden" name="iacc" value="<%= intAccion%>" >
                <table style="width: 100%">
                    <tr>
                        <td>
                            <label for="IdITipoTrabajador" class="control-label">ID: </label>
                        </td>
                        <td>
                            <label for="nombreTrabajador" class="control-label">Nombre Institucion: </label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" name="IdITipoTrabajador" id="IdITipoTrabajador" class="form-control" value="<%= cod%>" maxlength="9"/>
                        </td>
                        <td>
                            <input type="text" name="nombreTrabajador" id="nombreTrabajador" class="form-control" value="<%= nom%>" maxlength="9"/>
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
