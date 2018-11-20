<%-- 
    Document   : DatosConcepto
    Created on : 17-ago-2018, 15:07:15
    Author     : Articuno
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="controlador.clsConcepto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="IngresoConcepto" method="post" id="formulario">
            <%
                HttpSession sesion=request.getSession();
                Integer Obligatorio=0,Imponible=0,Tributable=0, ModoInt=0, Monto=0;
                String Descripcion="", TipCon="H", Modo="M", Codigo="", Formula="";        
                   
                Integer intAccion = Integer.parseInt(request.getParameter("acc"));
                String codigo = request.getParameter("codigo");
                               
                if (intAccion!=0){
                    clsConcepto con = new clsConcepto();
                    con.setAño(Integer.parseInt(sesion.getAttribute("Año").toString()));
                    con.setMes(Integer.parseInt(sesion.getAttribute("Mes").toString()));
                    con.setCodigo(codigo);
                    con.CargarConceptos();
                    
                    Codigo=codigo;
                    Descripcion=con.getDescripcion();
                    TipCon=con.getTipoConcepto();
                    Obligatorio=con.getObligatorio();
                    Imponible=con.getImponible();
                    Tributable=con.getTributable();
                    Modo=con.getModo();
                    if (Modo.equals("M")){
                        ModoInt=1;
                    }else if(Modo.equals("R")){
                        ModoInt=2;
                    }else{
                        ModoInt=3;
                    }
                    Monto=con.getMonto();
                    Formula=con.getFormula();
                }
            %>
            <input type="hidden" name="iAcc" value="<%= intAccion %>" >
            <input type="hidden" name="Mod" value="<%= Modo %>" >
            <div class="panel">
                <table class="table table-borderless">
                    <tr>
                        <td>
                            <label for="CodigoConcepto" class="control-label">Codigo: </label>
                            <input type="text" name="CodigoConcepto" id="CodigoConcepto" value="<%= Codigo%>" class="form-control"/>
                        </td>
                        <td>
                            <label for="Descripcion" class="control-label">Descripcion: </label>
                            <input type="text" name="Descripcion" id="Descripcion" value="<%= Descripcion%>" class="form-control" />
                        </td>
                    </tr>
                </table>
            </div>
            <div class="panel panel-default">
                <table class="table table-borderless">
                     <div class="panel-heading">
                        <h3 class="panel-title">Tipo Concepto</h3>
                    </div>
                    <tr>
                        <td id="tipoconcepto">
                            <% if ("H".equals(TipCon)){%>
                                <input type="radio" name="tipoconcepto" value="H" checked>Haber
                                <input type="radio" name="tipoconcepto" value="D">Descuento
                            <%}else{%>
                                <input type="radio" name="tipoconcepto" value="H">Haber
                                <input type="radio" name="tipoconcepto" value="D" checked>Descuento
                            <%}%>
                        </td>   
                        <td>
                            <% if (Obligatorio==1){%>
                                <input type="checkbox" name="Obligatorio" id="Obligatorio" checked><label>Obligatorio</label>
                            <%}else{%>
                                <input type="checkbox" name="Obligatorio" id="Obligatorio"><label>Obligatorio</label>
                            <%}
                            
                            if (Imponible==1){%>    
                                <input type="checkbox" name="Imponible" id="Imponible" checked><label>Imponible</label>
                            <%}else{%>
                                <input type="checkbox" name="Imponible" id="Imponible"><label>Imponible</label>
                            <%}
                            
                            if (Tributable==1){%> 
                                <input type="checkbox" name="Tributable" id="Tributable" checked><label>Tributable</label>
                            <%}else{%>
                                <input type="checkbox" name="Tributable" id="Tributable"><label>Tributable</label>
                            <%}%>
                        </td>
                    </tr>
            </table>
            </div>
            <div class="panel panel-default">
                <table class="table table-borderless">
                    <div class="panel-heading">
                        <h3 class="panel-title">Modo</h3>
                    </div>
                    <tr>
                        <td>
                            <input type="radio" name="modo" id="modM" value="M" checked>Monto
                        </td>
                        <td>
                            <input type="radio" name="modo" id="modR" value="R">Rango
                        </td>
                        <td>
                            <input type="radio" name="modo" id="modF" value="F">Formula
                        </td>
                    </tr>
                </table>
            </div>
            <div class="panel panel-default" id="divMonto">
                <table class="table table-borderless">
                    <div class="panel-heading">
                        <h3 class="panel-title">Monto</h3>
                    </div>
                    <tr>
                        <td>
                            <input type="text" name="Monto" id="Monto" placeholder="Ingrese Monto" class="form-control" value=<%= Monto%>  />
                        </td>
                    </tr>
                </table>
            </div>
            <div class="panel panel-default" id="divRango" style='display:none;'>
                
            </div>
            <div class="panel panel-default" id="divFormula" style='display:none;'>
                <table class="table table-borderless">
                    <div class="panel-heading">
                        <h3 class="panel-title">Formula</h3>
                    </div>
                    <tr>
                        <td>
                        <div class="panel panel-default" style="height: 204px; max-height: 204px;overflow-y: scroll;">
                            <div class="panel-body" style="text-align: center">Haberes</div>
                            <ul class="list-group" id="lstHaberes">
                            <%
                                clsConcepto con = new clsConcepto();
                                con.setAño(Integer.parseInt(sesion.getAttribute("Año").toString()));
                                con.setMes(Integer.parseInt(sesion.getAttribute("Mes").toString()));
                                ResultSet rs=con.ListarConceptos(1);
                                while (rs.next()){%>
                                <li class="list-group-item" style="font-size:12px; padding: 2px"><%= rs.getString(1)%></li>
                             <%   }
                            %></ul>
                        </div>
                        </td>
                        <td>
                        <div class="panel panel-default">
                            <div class="panel-body" style="text-align: center">Oper.</div>
                            <ul class="list-group" id="lstOper">
                                <li class="list-group-item" style="font-size:12px; padding: 2px; text-align: center">+</li>
                                <li class="list-group-item" style="font-size:12px; padding: 2px; text-align: center">-</li>
                                <li class="list-group-item" style="font-size:12px; padding: 2px; text-align: center">*</li>
                                <li class="list-group-item" style="font-size:12px; padding: 2px; text-align: center">/</li>
                                <li class="list-group-item" style="font-size:12px; padding: 2px; text-align: center">%</li>
                                <li class="list-group-item" style="font-size:12px; padding: 2px; text-align: center">(</li>
                                <li class="list-group-item" style="font-size:12px; padding: 2px; text-align: center">)</li>
                            </ul>
                        </div>
                        </td>
                        <td>
                        <div class="panel panel-default" style="height: 204px; max-height: 204px;overflow-y: scroll;">
                            <div class="panel-body" style="text-align: center">Descuentos</div>
                            <ul class="list-group" id="lstDescuentos">
                            <%
                                clsConcepto conD = new clsConcepto();
                                conD.setAño(Integer.parseInt(sesion.getAttribute("Año").toString()));
                                conD.setMes(Integer.parseInt(sesion.getAttribute("Mes").toString()));
                                ResultSet rs2=conD.ListarConceptos(2);
                                while (rs2.next()){%>
                                <li class="list-group-item" style="font-size:12px; padding: 2px"><%= rs2.getString(1)%></li>
                             <%   }
                            %></ul>
                        </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <textarea class="form-control" rows="3" name="txtFormula" id="txtFormula" style="resize: none"><%= Formula%></textarea>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary save" id="Guardar">Guardar Cambios</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
            </div>
        </form>
        <script>
            $(document).ready(function(){
                if (<%=ModoInt%>===1){
                    $('#divRango').hide();
                    $('#divFormula').hide();
                    $("#modM").prop("checked", true);
                }
                
                if (<%=ModoInt%>===2){
                    $('#divMonto').hide();
                    $('#divRango').show();
                    $('#divFormula').hide();
                    $("#modR").prop("checked", true);
                    listarRango('<%=Codigo%>');
                }
                
                if (<%=ModoInt%>===3){
                    $('#divRango').hide();
                    $('#divFormula').show();
                    $('#divMonto').hide();
                    $("#modF").prop("checked", true);
                }
                
            });
            
            $('input[value="M"]').on('change', this, function(){
                $('#divMonto').show();
                $('#divRango').hide();
                $('#divFormula').hide();
            });
            
            $('input[value="R"]').on('change', this, function(){
                $('#divRango').show();
                $('#divMonto').hide();
                $('#divFormula').hide();
                listarRango('');
            });
            
            $('input[value="F"]').on('change', this, function(){
                $('#divFormula').show();
                $('#divRango').hide();
                $('#divMonto').hide();
            });
            
            $("#lstOper li").click(function () {
                $('#txtFormula').val($('#txtFormula').val()+$(this).html());
            });
            
            $("#lstHaberes li").click(function () {
                $('#txtFormula').val($('#txtFormula').val()+$(this).html());
            });
            
            $("#lstDescuentos li").click(function () {
                $('#txtFormula').val($('#txtFormula').val()+$(this).html());
            });
            

            
            function listarRango(cod) {
                var urlRUT='ProcesaConsultas.jsp?llamado=26&cod='+cod;
                    $.ajax({
                      type: 'POST',
                      url: [urlRUT],
                      dataType  : 'html',
                      success: function(data){
                        $('#divRango').html(data);
                      }
                    });
            }  // listarDescuentos
        </script>
    </body>
</html>
