<%-- 
    Document   : DatosInstitucionPension
    Created on : 06-sep-2018, 11:39:29
    Author     : Articuno
--%>

<%@page import="controlador.clsPension"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="IngresoMantenedores" method="post" id="formulario">
            <%
                Integer intAccion = Integer.parseInt(request.getParameter("acc"));
                Integer cod=0;
                Double val=0.0;
                String nom="",tip="";

                if (intAccion!=0){
                    clsPension pen = new clsPension();
                    Integer codigo = Integer.parseInt(request.getParameter("cod"));
                    pen.setAño(Integer.parseInt(session.getAttribute("Año").toString()));
                    pen.setMes(Integer.parseInt(session.getAttribute("Mes").toString()));
                    pen.CargaInstitucionPension(codigo);

                    cod=pen.getIdInstitucion();
                    nom=pen.getNombre();
                    tip=pen.getTipo();
                    val=pen.getValor();
                }
            %>
            <input type="hidden" name="iMant" value="2" >
            <input type="hidden" name="iacc" value="<%= intAccion%>" >
            <table style="width: 100%">
                <tr>
                    <td>
                        <label for="IdInstitucionPension" class="control-label">ID: </label>
                    </td>
                    <td>
                        <label for="nombreInstitucion" class="control-label">Nombre Institucion: </label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="text" name="IdInstitucionPension" id="IdInstitucionPension" class="form-control" value="<%= cod%>" maxlength="9"/>
                    </td>
                    <td>
                        <input type="text" name="nombreInstitucion" id="nombreInstitucion" class="form-control" value="<%= nom%>" maxlength="9"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="TipoSistema" class="control-label">TipoSistema: </label>
                    </td>
                    <td>
                        <label for="valor" class="control-label">Valor: </label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <select name="TipoSistema" id="TipoSistema" class="form-control">
                            <% if("0".equals(tip)){%>
                                <option value="0" selected>Nuevo Sistema</option>
                                <option value="1">Antiguo Sistema</option>
                            <%}else{%>
                                <option value="0">Nuevo Sistema</option>
                                <option value="1"selected>Antiguo Sistema</option>
                            <%}%>
                        </select>
                    </td>
                    <td>
                        <input type="text" name="valor" id="valor" class="form-control" value="<%= val%>" maxlength="9"/>
                    </td>
                </tr>
            </table>
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary save" id="Guardar">Guardar Cambios</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
            </div>
        </form>
    </body>
</html>
