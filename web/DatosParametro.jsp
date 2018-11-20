<%-- 
    Document   : DatosParametro
    Created on : 07-sep-2018, 16:36:18
    Author     : Articuno
--%>

<%@page import="controlador.clsParametros"%>
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
                    Double num=0.0;
                    String alfa="",cod="",fec="",des="";
                    
                    if (intAccion!=0){
                        clsParametros par = new clsParametros();
                        String codigo = request.getParameter("cod").toString();
                        par.setAño(Integer.parseInt(session.getAttribute("Año").toString()));
                        par.setMes(Integer.parseInt(session.getAttribute("Mes").toString()));
                        par.setCodigo(codigo);
                        par.CargaParametro();
                        
                        cod=par.getCodigo();
                        des=par.getDescripcion();
                        alfa=par.getAlfanumerico();
                        num=par.getNumerico();
                        fec=par.getFecha();
                    }
                %>
                <input type="hidden" name="iMant" value="8" >
                <input type="hidden" name="iacc" value="<%= intAccion%>" >
                <table style="width: 100%">
                    <tr>
                        <td>
                            <label for="codigo" class="control-label">Codigo: </label>
                        </td>
                        <td colspan="2">
                            <label for="descripcion" class="control-label">Descripcion: </label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" name="codigo" id="codigo" class="form-control" value="<%= cod%>" maxlength="9"/>
                        </td>
                        <td colspan="2">
                            <input type="text" name="descripcion" id="descripcion" class="form-control" value="<%= des%>" maxlength="9"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="numero" class="control-label">Numero: </label>
                        </td>
                        <td>
                            <label for="alfanumerico" class="control-label">AlfaNumerico </label>
                        </td>
                        <td>
                            <label for="fecha" class="control-label">Fecha </label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" name="numero" id="numero" class="form-control" value="<%= num%>" maxlength="9"/>
                        </td>
                        <td>
                            <input type="text" name="alfanumerico" id="alfanumerico" class="form-control" value="<%= alfa%>" maxlength="9"/>
                        </td>
                        <td>
                            <input type="text" name="fecha" id="fecha" class="form-control" value="<%= fec%>" maxlength="9"/>
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
