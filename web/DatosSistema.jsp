<%-- 
    Document   : DatosSistema
    Created on : 22-ago-2018, 17:04:35
    Author     : Articuno
--%>

<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="org.jsoup.Jsoup"%>

<%@ include file="menu.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/Funciones.js" type="text/javascript"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Document doc = Jsoup.connect("https://www.previred.com/web/previred/indicadores-previsionales").get();
            Document doc2 = Jsoup.connect("http://www.sii.cl/valores_y_fechas/impuesto_2da_categoria/impuesto2018.htm").get();

            // Get font tag in every second td tag
            Elements tdsFont = doc.select("td");
            Elements tdsFont2 = doc2.select("td");
            
           %>
   
           <div role="tabpanel" style="width: 700px;" class="center-block">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active">
                        <a href="#IndEco" aria-controls="IndEco" role="tab" data-toggle="tab">Indicadores Economicos</a>
                    </li>
                    <li role="presentation">
                        <a href="#Listados" aria-controls="Listados" role="tab" data-toggle="tab">Listados</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="IndEco">
                        <div class="panel">
                            <div class="panel-body">
                                <label for="ValorUF" class="control-label">Valor UF: </label>
                                <input type="text" name="ValorUF" id="ValorUF" class="form-control" onchange="ActualizaParametro('ValorUF')" value="<%=LimpiaVariables(tdsFont.get(2).toString())%>"/>
                                <label for="ValorUTM" class="control-label">Valor UTM: </label>
                                <input type="text" name="ValorUTM" id="ValorUTM" class="form-control" onchange="ActualizaParametro('ValorUTM')" value="<%=LimpiaVariables(tdsFont.get(9).toString())%>"/>
                                <label for="SueldoMinimo" class="control-label">Sueldo Minimo: </label>
                                <input type="text" name="SueldoMinimo" id="SueldoMinimo" class="form-control" onchange="ActualizaParametro('SueldoMinimo')" value="<%=LimpiaVariables(tdsFont.get(20).toString())%>"/>
                                <label for="TopeImpAFP" class="control-label">Tope Imponible AFP: </label>
                                <input type="text" name="TopeImpAFP" id="TopeImpAFP" class="form-control" onchange="ActualizaParametro('TopeImpAFP')" value="<%=LimpiaVariables(tdsFont.get(13).toString())%>"/>
                                <label for="TopeImpIPS" class="control-label">Tope Imponible IPS: </label>
                                <input type="text" name="TopeImpIPS" id="TopeImpIPS" class="form-control" onchange="ActualizaParametro('TopeImpIPS')" value="<%=LimpiaVariables(tdsFont.get(15).toString())%>"/>
                                <label for="TopeImpSegCes" class="control-label">Tope Imponible Seguro Cesantia: </label>
                                <input type="text" name="TopeImpSegCes" id="TopeImpSegCes" class="form-control" onchange="ActualizaParametro('TopeImpSegCes')" value="<%=LimpiaVariables(tdsFont.get(17).toString())%>"/>
                                <table>
                                    <tr>
                                        <td></td>
                                        <td style="text-align: center"><label for="Empleador" class="control-label">Empleador</label></td>
                                        <td style="text-align: center"><label for="Trabajador" class="control-label">Trabajador</label></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Contrato Plazo Indefinido
                                        </td>
                                        <td><input type="text" name="CesPlazIndEmp" id="CesPlazIndEmp" class="form-control" onchange="ActualizaParametro('CesPlazIndEmp')" value="<%=LimpiaVariables(tdsFont.get(41).toString())%>"/></td>
                                        <td><input type="text" name="CesPlazIndTrab" id="CesPlazIndTrab" class="form-control" onchange="ActualizaParametro('CesPlazIndTrab')" value="<%=LimpiaVariables(tdsFont.get(42).toString())%>"/></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Contrato Plazo Fijo
                                        </td>
                                        <td><input type="text" name="CesPlazFijoEmp" id="CesPlazFijoEmp" class="form-control" onchange="ActualizaParametro('CesPlazFijoEmp')" value="<%=LimpiaVariables(tdsFont.get(44).toString())%>"/></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Contrato Indefinido 11 años o más
                                        </td>
                                        <td>
                                            <input type="text" name="CesPlazIndEmpPlus" id="CesPlazIndEmpPlus" class="form-control" onchange="ActualizaParametro('CesPlazIndEmpPlus')" value="<%=LimpiaVariables(tdsFont.get(47).toString())%>"/>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div>
                            <button type="button" class="btn btn-primary save" id="Guardar" onclick="GuardaDatos()">Guardar Datos</button>
                        </div>  
                    </div>
                    <div role="tabpanel" class="tab-pane" id="Listados">
                        <div class="panel">
                            <div class="panel-heading">DATOS PREVISIONALES <a href="#" class="btn btn-default" onclick="ActualizaAFP()"><span class="glyphicon glyphicon-floppy-disk"></span></a></div>
                            <div class="panel-body">
                                <table class="table table-bordered" id="tablaAFP">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th>AFP</th>
                                            <th>TASA AFP</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Capital</td>
                                            <td contenteditable="true">
                                                <%=LimpiaVariables(tdsFont.get(58).toString())%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Cuprum</td>
                                            <td contenteditable="true">
                                                <%=LimpiaVariables(tdsFont.get(62).toString())%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Habitat</td>
                                            <td contenteditable="true">
                                                <%=LimpiaVariables(tdsFont.get(66).toString())%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Plan Vital</td>
                                            <td contenteditable="true">
                                                <%=LimpiaVariables(tdsFont.get(70).toString())%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Provida</td>
                                            <td contenteditable="true">
                                                <%=LimpiaVariables(tdsFont.get(74).toString())%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Modelo</td>
                                            <td contenteditable="true">
                                                <%=LimpiaVariables(tdsFont.get(78).toString())%>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="panel">
                            <div class="panel-heading">ASIGNACION FAMILIAR <a href="#" class="btn btn-default" onclick="ActualizaValoresCargasFamiliares()"><span class="glyphicon glyphicon-floppy-disk"></span></a></div>
                            <div class="panel-body">
                                <table class="table table-bordered" id="tramocargafamiliar">
                                    <thead>
                                        <tr>
                                            <th>Tramo</th>
                                            <th>Monto</th>
                                            <th>Desde</th>
                                            <th>Hasta</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                A
                                            </td>
                                            <td contenteditable="true">
                                                <%=LimpiaVariables(tdsFont.get(86).toString())%>
                                            </td>
                                            <td contenteditable="true">
                                                0
                                            </td>
                                            <td contenteditable="true">
                                                <%=LimpiaVariables(tdsFont.get(87).toString())%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                B
                                            </td>
                                            <td contenteditable="true">
                                                <%=LimpiaVariables(tdsFont.get(89).toString())%>
                                            </td>
                                            <td contenteditable="true">
                                                <%=Integer.parseInt(LimpiaVariables(tdsFont.get(87).toString()))+1%>
                                            </td>
                                            <td contenteditable="true">
                                                <%=LimpiaVariables(tdsFont.get(90).toString().substring(70, tdsFont.get(90).toString().length()))%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                C
                                            </td>
                                            <td contenteditable="true">
                                                <%=LimpiaVariables(tdsFont.get(92).toString())%>
                                            </td>
                                            <td contenteditable="true">
                                                <%=Integer.parseInt(LimpiaVariables(tdsFont.get(90).toString().substring(70, tdsFont.get(90).toString().length())))+1%>
                                            </td>
                                            <td contenteditable="true">
                                                <%=LimpiaVariables(tdsFont.get(93).toString().substring(69, tdsFont.get(93).toString().length()))%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                D
                                            </td>
                                            <td contenteditable="true">
                                                0
                                            </td>
                                            <td contenteditable="true">
                                                <%=Integer.parseInt(LimpiaVariables(tdsFont.get(93).toString().substring(69, tdsFont.get(93).toString().length())))+1%>
                                            </td>
                                            <td contenteditable="true">
                                                0
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="panel">
                            <div class="panel-heading">IMPUESTOS UNICOS DE SEGUNDA CATEGORIA<a href="#" class="btn btn-default" onclick="ActualizaValoresImpuestos()"><span class="glyphicon glyphicon-floppy-disk"></span></a></div>
                            <div class="panel-body">
                                <table class="table table-bordered" class ="impuesto" id="impuesto">
                                    <thead>
                                        <tr>
                                            <th>Desde</th>
                                            <th>Hasta</th>
                                            <th>Factor</th>
                                            <th>Cantidad a rebajar</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr><!--PRIMER TRAMO-->
                                            <td contenteditable="true">
                                                0
                                            </td>
                                            <td contenteditable="true">
                                                <%=LimpiaVariables(tdsFont2.get(2).toString())%>
                                            </td>
                                            <td contenteditable="true">
                                                0
                                            </td>
                                            <td contenteditable="true">
                                                0
                                            </td>
                                        </tr>
                                        <tr><!--SEGUNDO TRAMO-->
                                            <td contenteditable="true">
                                                <%=LimpiaVariables(tdsFont2.get(7).toString())%>
                                            </td>
                                            <td contenteditable="true">
                                                <%=LimpiaVariables(tdsFont2.get(8).toString())%>
                                            </td>
                                            <td contenteditable="true">
                                                <%=LimpiaVariables(tdsFont2.get(9).toString())%>
                                            </td>
                                            <td contenteditable="true">
                                                <%=LimpiaVariables(tdsFont2.get(10).toString())%>
                                            </td>
                                        </tr>
                                        <tr><!--TERCER TRAMO-->
                                            <td contenteditable="true">
                                                <%=LimpiaVariables(tdsFont2.get(13).toString())%>
                                            </td>
                                            <td contenteditable="true">
                                                <%=LimpiaVariables(tdsFont2.get(14).toString())%>
                                            </td>
                                            <td contenteditable="true">
                                                <%=LimpiaVariables(tdsFont2.get(15).toString())%>
                                            </td>
                                            <td contenteditable="true">
                                                <%=LimpiaVariables(tdsFont2.get(16).toString())%>
                                            </td>
                                        </tr>
                                        <tr><!--CUARTO TRAMO-->
                                            <td contenteditable="true">
                                                <%=LimpiaVariables(tdsFont2.get(19).toString())%>
                                            </td>
                                            <td contenteditable="true">
                                                <%=LimpiaVariables(tdsFont2.get(20).toString())%>
                                            </td>
                                            <td contenteditable="true">
                                                <%=LimpiaVariables(tdsFont2.get(21).toString())%>
                                            </td>
                                            <td contenteditable="true">
                                                <%=LimpiaVariables(tdsFont2.get(22).toString())%>
                                            </td>
                                        </tr>
                                        <tr><!--QUINTO TRAMO-->
                                            <td contenteditable="true">
                                                <%=LimpiaVariables(tdsFont2.get(25).toString())%>
                                            </td>
                                            <td contenteditable="true">
                                                <%=LimpiaVariables(tdsFont2.get(26).toString())%>
                                            </td>
                                            <td contenteditable="true">
                                                <%=LimpiaVariables(tdsFont2.get(27).toString())%>
                                            </td>
                                            <td contenteditable="true">
                                                <%=LimpiaVariables(tdsFont2.get(28).toString())%>
                                            </td>
                                        </tr>
                                        <tr><!--SEXTO TRAMO-->
                                            <td contenteditable="true">
                                                <%=LimpiaVariables(tdsFont2.get(31).toString())%>
                                            </td>
                                            <td contenteditable="true">
                                                <%=LimpiaVariables(tdsFont2.get(32).toString())%>
                                            </td>
                                            <td contenteditable="true">
                                                <%=LimpiaVariables(tdsFont2.get(33).toString())%>
                                            </td>
                                            <td contenteditable="true">
                                                <%=LimpiaVariables(tdsFont2.get(34).toString())%>
                                            </td>
                                        </tr>
                                        <tr><!--SEPTIMO TRAMO-->
                                            <td contenteditable="true">
                                                <%=LimpiaVariables(tdsFont2.get(37).toString())%>
                                            </td>
                                            <td contenteditable="true">
                                                0
                                            </td>
                                            <td contenteditable="true">
                                                <%=LimpiaVariables(tdsFont2.get(39).toString())%>
                                            </td>
                                            <td contenteditable="true">
                                                <%=LimpiaVariables(tdsFont2.get(40).toString())%>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                                  
    </body>
    <script>

    $(document).ready(function(){
        $('#impuesto tbody').on( 'click', 'tr', function () {
            var celdas = $(this).find('td');
            var mes=$(celdas[2]).html();

            //$(celdas).focusout(function(){
            $(this).css('background-color','#F4F4F4');
            $(this).css('color','#333');
        });

     });  
    </script>
</html>
