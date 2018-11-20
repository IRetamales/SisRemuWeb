<%-- 
    Document   : DatosInstitucionSalud
    Created on : 06-sep-2018, 10:58:22
    Author     : Articuno
--%>

<%@page import="controlador.clsSalud"%>
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
                    Integer cod=0;
                    String nom="";
                    
                    if (intAccion!=0){
                        clsSalud sal = new clsSalud();
                        Integer codigo = Integer.parseInt(request.getParameter("cod"));
                        sal.setIdInstitucion(codigo);
                        sal.CargaInstitucionSalud();
                        
                        cod=sal.getIdInstitucion();
                        nom=sal.getNombre();
                    }
                %>
                <input type="hidden" name="iMant" value="1" >
                <input type="hidden" name="iacc" value="<%= intAccion%>" >
                <table style="width: 100%">
                    <tr>
                        <td>
                            <label for="IdInstitucionSalud" class="control-label">ID: </label>
                        </td>
                        <td>
                            <label for="nombreInstitucion" class="control-label">Nombre Institucion: </label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" name="IdInstitucionSalud" id="IdInstitucionSalud" class="form-control" value="<%= cod%>" maxlength="9"/>
                        </td>
                        <td>
                            <input type="text" name="nombreInstitucion" id="nombreInstitucion" class="form-control" value="<%= nom%>" maxlength="9"/>
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
