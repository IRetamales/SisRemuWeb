<%-- 
    Document   : menu
    Created on : 30-abr-2018, 14:33:10
    Author     : Sylar
--%>

<%@page import="controlador.clsPeriodo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="js/FuncionesJSP.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
                <!-- Include Date Range Picker -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
        <link rel="stylesheet" href="estilo.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
        <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
        <title>Sistema de Remuneraciones</title>
    </head>
    <body>
        <%
            HttpSession sesion=request.getSession();
            if (sesion.getAttribute("Nombre")==null){
                response.sendRedirect("index.jsp");
            }
            String nombre = (String)session.getAttribute("Nombre");

            Integer año= Integer.parseInt(session.getAttribute("Año").toString());
            Integer mes= Integer.parseInt(session.getAttribute("Mes").toString());
            String Periodo="Trabajando en: " + NombreMes(mes) + " de " +  año;

        %>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>                        
                    </button>
                    <a class="navbar-brand" href="default.jsp">SisRemu</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Funcionario<b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li class="menu-item "><a href="ListarFuncionarios.jsp">Ficha Funcionario</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Periodo<b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li class="menu-item dropdown dropdown-submenu">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Informes</a>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <a href="LibroRemuneraciones.jsp">Libro de Remuneraciones</a>
                                            <a href="#" data-toggle="modal" data-target="#PreviRed" onclick="cargar('#ListarPreviRed','ArchivoPreviRed.jsp');">Archivo PreviRed</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="menu-item "><a href="ProcesarFuncionarios.jsp">Procesar</a></li>
                                <li class="menu-item "><a href="#" data-toggle="modal" data-target="#myModal" onclick="cargar('#Agregar','DatosPeriodo.jsp');">Cambiar Periodo</a></li>
                                
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Mantencion<b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li class="menu-item "><a href="DatosSistema.jsp">Datos de Sistema</a></li>
                                <li class="menu-item "><a href="ListarConceptos.jsp">Mantenedor de Conceptos</a></li>
                                <li class="menu-item dropdown dropdown-submenu">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Mantenedores</a>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <a href="ListadoInstitucionSalud.jsp">Institucion Salud</a>
                                            <a href="ListadoInstitucionPension.jsp">Institucion Pension</a>
                                            <a href="ListadoTipoContrato.jsp">Tipo Contrato</a>
                                            <a href="ListadoTipoMoneda.jsp">Tipo Moneda</a>
                                            <a href="ListadoTipoTrabajador.jsp">Tipo Trabajador</a>
                                            <a href="ListadoNacionalidad.jsp">Nacionalidad</a>
                                            <a href="ListadoVinculo.jsp">Vinculo</a>
                                            <a href="ListadoParametros.jsp">Parametros</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="Salir.jsp">Salir</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div id="periodoseleccion" style="background-color: white"> 
                  <%= Periodo%>
            </div>
        </nav>
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">
              <!-- Modal content-->
                <div class="modal-content">
                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal">&times;</button>
                          <h4 class="modal-title">Datos Periodo</h4>
                        </div>
                        <div class="modal-body" id="modal-body">
                            <div id="Agregar"></div>
                        </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="PreviRed" role="dialog">
            <div class="modal-dialog">
              <!-- Modal content-->
                <div class="modal-content">
                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal">&times;</button>
                          <h4 class="modal-title">Datos Periodo</h4>
                        </div>
                        <div class="modal-body" id="modal-body">
                            <div id="ListarPreviRed"></div>
                        </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="LibroRemu" role="dialog">
            <div class="modal-dialog">
              <!-- Modal content-->
                <div class="modal-content">
                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal">&times;</button>
                          <h4 class="modal-title">Libro Remuneraciones</h4>
                        </div>
                        <div class="modal-body" id="modal-body">
                            <div id="LibRem"></div>
                        </div>
                </div>
            </div>
        </div>
        <!--MODAL PARA LISTAR PERIODOS-->
        <div class="modal fade" id="AgregaPeriodo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" id="exampleModalLabel">Agregar Periodo</h4>
                    </div>
                    <form method="post" action="IngresoPeriodo" id="formulario">
                    <div class="modal-body">
                        <table class="table table-borderless" id="datosPeriodo">
                               <tr>
                                   <td>
                                        <label for="Año" class="control-label">Año: </label>
                                        <select name="Año" id="Año"  class="form-control" id="sel1">
                                        <%for (int i = 2016; i <= 2022; i++) {
                                            if (i==año){%>
                                            <option value="<%= i%>" selected><%= i%></option>
                                        <%}else{%>
                                            <option value="<%= i%>"><%= i%></option>
                                        <%}}%>
                                        </select>    
                                   </td>
                                   <td>
                                        <label for="Mes" class="control-label">Mes </label>
                                        <select name="Mes" id="Mes"  class="form-control" id="sel1">
                                            <%for (int i = 1; i <= 12; i++) {
                                            if (i==mes){%>
                                                <option value="<%= i%>" selected><%= NombreMes(i)%></option>
                                            <%}else{%>
                                                <option value="<%= i%>"><%= NombreMes(i)%></option>
                                            <%}}%>     
                                        </select>  
                                   </td>
                               </tr>
                        </table>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                      <button type="submit" id="Guardar" class="btn btn-primary">Guardar</button>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
    <script>
        function cargar(div, destino){
            $(div).load(destino);   
        }
        
        if ((<%=mes%>+1)==13){
            document.getElementById("Mes").value =1;
            document.getElementById("Año").value =<%=año%>+1;
        }else{
            document.getElementById("Mes").value =<%=mes%>+1;
        }
    </script>
</html>

