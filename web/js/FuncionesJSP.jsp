<%-- 
    Document   : FuncionesJSP
    Created on : 21-ago-2018, 10:15:37
    Author     : Articuno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
    public String NombreMes(int NumeroMes){
        switch(NumeroMes) {
                case 1:
                    return "ENERO";
                case 2:
                    return "FEBRERO";
                case 3:
                    return "MARZO";
                case 4:
                    return "ABRIL";
                case 5:
                    return "MAYO";
                case 6:
                    return "JUNIO";
                case 7:
                    return "JULIO";
                case 8:
                    return "AGOSTO";
                case 9:
                    return "SEPTIEMBRE";
                case 10:
                    return "OCTUBRE";
                case 11:
                    return "NOVIEMBRE";
                case 12:
                    return "DICIEMBRE";
                default:
                    return "ENERO";
        }
    }

    public String LimpiaVariables(String variable){

        variable=variable.replace("</strong>", "");
        variable=variable.replace("$","");
        variable=variable.replace(".","");
        variable=variable.replace("<td>","");
        variable=variable.replace("</td>","");
        variable=variable.replace("</div>","");
        variable=variable.replace("<td nowrap='nowrap' style='text-align:right !important;'>","");
        variable=variable.replace("<div align='right'>","");
        variable=variable.replace("<div align='left'>","");
        variable=variable.replace("<strong>","");
        variable=variable.replace("%","");
        variable=variable.replace("RI","");
        variable=variable.replace("<td width=\"20\"","");
        variable=variable.replace(">","");
        variable=variable.replace("<td align=","");
        variable=variable.replace("\"center\"","");
        variable=variable.replace("<td class=","");
        variable=variable.replace("\"ind_odd\"","");
        variable=variable.replace("width=\"25\"","");
        variable=variable.replace("class=","");
        variable=variable.replace("style=\"text-align: center;\"","");
        variable=variable.replace("width=\"20\"","");
        variable=variable.replace("width=\"30\"","");
        variable=variable.replace("width=\"50\"","");
        variable=variable.replace("<td","");
        variable=variable.replace("Renta &lt; ó =","");
	variable=variable.replace("nowrap","");
        
        return variable.trim();
    }
%>
