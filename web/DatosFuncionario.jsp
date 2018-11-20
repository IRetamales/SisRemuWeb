<%-- 
    Document   : DatosArriendo
    Created on : 27-abr-2018, 9:43:32
    Author     : Kraken
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="controlador.clsCargasFamiliares"%>
<%@page import="controlador.clsTipoTrabajador"%>
<%@page import="controlador.clsFuncionario"%>
<%@page import="java.util.List"%>
<%@page import="controlador.clsSalud"%>
<%@page import="controlador.clsPension"%>
<%@page import="controlador.clsTipoMoneda"%>
<%@page import="controlador.clsVinculo"%>
<%@page import="controlador.clsCargo"%>
<%@page import="controlador.clsTipoContrato"%>
<%@page import="controlador.clsNacionalidad"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">       
    </head>
    <body>
        <form action="IngresoPersona" method="post" id="formulario">
            <%
                //-----VARIABLES DE DATOS PERSONALES-----
                String CodPer="", Nom="",Pat="",Mat="",FeNac="",Gen="M",Dir="",Tel="",Cel="",Mail="";
                Integer Nac=0,Tip=0;

                //-----VARIABLES DATOS PREVISION-----
                Integer Sal=7,Pen=0,TipMon=0,TipMonAhorroAFP=0,TipMonAPV=0,InstitucionAPV=0;
                String FIng="",NumContratoIsapre="";
                Double MPac=0.0,MAhorroAFP=0.0,MonAPV=0.0;
                
                String rut = request.getParameter("rut");
                Integer intAccion = Integer.parseInt(request.getParameter("acc"));
                Integer ia=intAccion;

                if (intAccion!=0){
                    clsFuncionario fun= new clsFuncionario();
                    fun.setRut(rut);
                    
                    request.getSession().setAttribute("rutper", rut.toString());
                    
                    //-----CARGA DE DATOS DE FUNCIONARIO-----
                    fun.CargarFuncionario();
                    
                    CodPer=fun.getRut();
                    Nom=fun.getNombre();
                    Pat=fun.getApellidoPaterno();
                    Mat=fun.getApellidoMaterno();
                    FeNac=fun.getFechaNacimiento();
                    Gen=fun.getGenero();
                    Dir=fun.getDireccion();
                    Nac=fun.getNacionalidad();
                    Tip=fun.getTipoTrabajador();
                    Tel=fun.getTelefono();
                    Cel=fun.getCelular();
                    Mail=fun.getMail();
                    
                    //-----CARGA DE DATOS PREVISIONALES------
                    Sal=fun.getSalud();
                    Pen=fun.getPension();
                    MPac=fun.getMontoPactado();
                    FIng=fun.getFechaIngresoIsapre();
                    TipMon=fun.getTipoMonedaSalud();
                    MAhorroAFP=fun.getMontoAhorroAFP();
                    TipMonAhorroAFP=fun.getTipoMonedaAhorroAFP();
                    MonAPV=fun.getMontoAPV();
                    TipMonAPV=fun.getTipoMonedaAPV();
                    NumContratoIsapre=fun.getNumContratoIsapre();
                    InstitucionAPV=fun.getInstitucionAPV();
                }
            %>
            <input type="hidden" name="iAcc" value="<%= intAccion %>" >
            <div role="tabpanel">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active">
                        <a href="#DatPers" aria-controls="DatPers" role="tab" data-toggle="tab">Datos Personales</a>
                    </li>
                    <li role="presentation">
                        <a href="#DatPrev" aria-controls="DatPrev" role="tab" data-toggle="tab">Datos Previsionales</a>
                    </li>
                    <li role="presentation">
                        <a href="#CargFam" aria-controls="CargFam" role="tab" data-toggle="tab">Cargas Familiares</a>
                    </li>
                    <li role="presentation">
                        <a href="#VidaFunc" aria-controls="VidaFunc" role="tab" data-toggle="tab">Contratos</a>
                    </li>
                </ul>
                <input type="hidden" name="iAcc" value="0" >
                <input type="hidden" name="RutFunc" value="<%= CodPer %>" >
                <!---------------------------------------- Tab Datos Personales ------------------------------------------------------>
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="DatPers">
                            <table class="table table-borderless" id="datosPersona">
                                <tr>
                                    <td>
                                        <label for="RutPersona" class="control-label">Rut Persona: </label>
                                        <input type="text" name="RutPersona" id="RutPersona" class="form-control" value="<%= CodPer%>" maxlength="9"/>
                                    </td>
                                    <td>
                                        <label for="Nombre" class="control-label">Nombres: </label>
                                        <input type="text" name="Nombre" id="Nombre" class="form-control" value="<%= Nom %>" onkeypress="return SoloLetras(event)" maxlength="100"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="Nombre" class="control-label">Apellido Paterno: </label>
                                        <input type="text" name="Paterno" id="Paterno" class="form-control" value="<%= Pat %>" onkeypress="return SoloLetras(event)" maxlength="100"/>
                                    </td>
                                    <td>
                                        <label for="Nombre" class="control-label">Apellido Materno: </label> 
                                        <input type="text" name="Materno" id="Materno" class="form-control" value="<%= Mat %>" onkeypress="return SoloLetras(event)" maxlength="100"/>
                                    </td>
                                </tr>
                                <tr id="FechaNacimiento">
                                    <td>
                                        <label for="Celular" class="control-label" id="lblFechaNacimiento">Fecha Nacimiento: </label>
                                        <input class="form-control" id="date" name="Fecha" placeholder="DD/MM/YYYY" value="<%= FeNac %>" type="text" readonly/>
                                    </td> 
                                   <td id="genero">
                                        <label for="genero" class="control-label">Genero: </label></br>
                                        <% if ("M".equals(Gen)){%>
                                        <input type="radio" name="Genero" value="M" checked>Masculino
                                        <input type="radio" name="Genero" value="F">Femenino
                                        <% }else{ %>
                                        <input type="radio" name="Genero" value="M">Masculino
                                        <input type="radio" name="Genero" value="F" checked>Femenino
                                        <%}%>
                                    </td>
                                  </tr>
                                <tr>
                                    <td colspan="2">
                                        <label for="Nombre" class="control-label">Direccion: </label>
                                        <input type="text" name="Direccion" id="Direccion"  value="<%= Dir %>" class="form-control" onkeypress="" maxlength="100"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="Nacionalidad" class="control-label">Nacionalidad: </label>
                                        <%
                                        clsNacionalidad na = new clsNacionalidad();
                                        List<clsNacionalidad> Nacionalidad = na.LlenarNacionalidad(na);
                                        %>
                                        <select name="Nacionalidad" id="Nacionalidad"  class="form-control" id="sel1">
                                            <option>Seleccione Nacionalidad</option>
                                            <% for (clsNacionalidad nacionalidad : Nacionalidad) {
                                            if (Nac.equals(nacionalidad.getIdNacionalidad())){%>
                                                <option value="<%=nacionalidad.getIdNacionalidad() %>" selected><%=nacionalidad.getNombre()%></option>
                                            <% } else{ %>
                                                <option value="<%=nacionalidad.getIdNacionalidad()%>" ><%=nacionalidad.getNombre()%></option>
                                            <%}}%>
                                        </select>
                                    </td>
                                    <td>
                                        <label class="control-label">Tipo Trabajador</label>
                                        <%
                                        clsTipoTrabajador tra = new clsTipoTrabajador();
                                        List<clsTipoTrabajador> tipotra = tra.LlenaTipoTrabajador(tra);
                                        %>
                                        <select class="form-control" name="TipoTrabajador">
                                            <option>Seleccione Tipo Trabajador</option>
                                            <% for (clsTipoTrabajador trabajador : tipotra) {
                                            if (Tip.equals(trabajador.getIdTipoTrabajador())){%>
                                                <option value="<%=trabajador.getIdTipoTrabajador() %>" selected><%=trabajador.getNombre()%></option>
                                            <% } else{ %>
                                                <option value="<%=trabajador.getIdTipoTrabajador()%>" ><%=trabajador.getNombre()%></option>
                                            <%}}%>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="Celular" class="control-label">Telefono: </label>
                                        <input type="text" name="Telefono" id="Telefono" class="form-control" value="<%= Tel %>" onkeypress="return SoloNumeros(event)" maxlength="10"/>
                                    </td>   
                                    <td>
                                        <label for="Celular" class="control-label">Celular: </label>
                                        <input type="text" name="Celular" id="Celular" class="form-control" value="<%= Cel %>" onkeypress="return SoloNumeros(event)" maxlength="10"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <label for="Email" class="control-label">Email: </label>
                                        <input type="text" name="Email" id="Email" class="form-control" value="<%= Mail %>" onkeypress="return ValidarEmail(event)" maxlength="100"/>
                                    </td>
                                </tr>
                            </table>
                    </div>
                    <!---------------------------------------- Tab Datos Pervisionales ------------------------------------------------------>
                    <div role="tabpanel" class="tab-pane" id="DatPrev">
                        <div class="panel panel-default">
                            <table class="table table-borderless">
                                <div class="panel-body">Institucion de Salud</div>
                                <tr>
                                    <td colspan="2">
                                        <% if (Sal==7){%>
                                        <label><input type="radio" value="1" name="optSalud" onchange="habilitarSalud(this.value);" checked>Fonasa</label>
                                        <% }else{ %>
                                        <label><input type="radio" value="1" name="optSalud" onchange="habilitarSalud(this.value);">Fonasa</label>
                                        <%}%>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <% if (Sal!=7){%>
                                        <label><input type="radio" value="2" name="optSalud" onchange="habilitarSalud(this.value);" checked>Isapre</label>
                                        <% }else{ %>
                                        <label><input type="radio" value="2" name="optSalud" onchange="habilitarSalud(this.value);">Isapre</label>
                                        <%}
                                        clsSalud sa = new clsSalud();
                                        List<clsSalud> Salud = sa.ListarInstitucionSalud(sa);
                                        %>
                                        <select name="Salud" id="Salud"  class="form-control" id="sel1" disabled="">
                                            <option>Seleccione Isapre</option>
                                            <%
                                                for (clsSalud salud : Salud) { 
                                                if (Sal==salud.getIdInstitucion()){ %>
                                                    <option value="<%=salud.getIdInstitucion()%>" selected><%=salud.getNombre()%></option>
                                                <% } else{ %>
                                                    <option value="<%=salud.getIdInstitucion()%>" ><%=salud.getNombre()%></option>
                                                <% }}%>
                                        </select>
                                    </td>
                                    <td>
                                        <label for="FechaIngreso" class="control-label" id="lblFechaIngreso">Fecha Ingreso: </label>
                                        <input class="form-control" id="FechaIngreso" name="FechaIngreso" placeholder="DD/MM/YYYY" value="<%= FIng %>" type="text" readonly/>
                                    </td> 
                                </tr>
                                <tr>
                                    <td>
                                        <label for="MontoPactado" class="control-label">Monto Pactado: </label>
                                        <input type="text" name="MontoPactado" id="MontoPactado" class="form-control" value="<%= MPac %>" maxlength="10" disabled=""/>
                                    </td>
                                    <td>
                                       <label for="MonedaSalud" class="control-label">Moneda</label>
                                       <%
                                       clsTipoMoneda mo = new clsTipoMoneda();
                                       List<clsTipoMoneda> Moneda = mo.CargaComboTipoMoneda(mo);
                                       %>
                                       <select name="MonedaSalud" id="MonedaSalud"  class="form-control" id="sel1" disabled>
                                            <% for (clsTipoMoneda moneda : Moneda) { 
                                            if (TipMon==moneda.getIdTipoMoneda()){ %>
                                                <option value="<%=moneda.getIdTipoMoneda()%>" selected><%=moneda.getNombre()%></option>
                                            <% } else{ %>
                                                <option value="<%=moneda.getIdTipoMoneda()%>"><%=moneda.getNombre()%></option>
                                            <% }} %>
                                       </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <label for="NumeroContrato" class="control-label">Numero Contrato: </label>
                                        <input type="text" name="NumeroContrato" id="NumeroContrato" class="form-control" onkeypress="return SoloNumeros(event)" value="<%= NumContratoIsapre %>" maxlength="10" disabled=""/>
                                    </td>
                                </tr>
                             </table>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-body">Institucion de Pension</div>
                            <table class="table table-borderless">
                                <tr>
                                    <td></td>
                                    <td>
                                        <label>AFP</label>
                                    </td>
                                    <td>&nbsp</td>
                                    <td>
                                        <label>Ahorro AFP</label>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>
                                        <%if (Pen<100){%>
                                        <input type="radio" value="1" name="optPension" id ="optPension" onchange="habilitarPension(this.value);" checked>
                                        <%}else{%>
                                        <input type="radio" value="1" name="optPension" id ="optPension" onchange="habilitarPension(this.value);">
                                        <% } %>
                                    </td>
                                    <td>
                                       <%
                                       clsPension pe = new clsPension();
                                       pe.setAño(Integer.parseInt(session.getAttribute("Año").toString()));
                                       pe.setMes(Integer.parseInt(session.getAttribute("Mes").toString()));
                                       List<clsPension> Pension = pe.LlenaComboInstitucionPension(pe,"0");
                                       %>
                                       <select name="cboPension" id="Pension"  class="form-control">
                                           <option>Seleccione Institucion</option>
                                           <% for (clsPension pension : Pension) { 
                                           if (Pen==pension.getIdInstitucion()){ %>
                                           <option value="<%=pension.getIdInstitucion()%>" selected><%=pension.getNombre()%></option>
                                           <% } else{ %>
                                           <option value="<%=pension.getIdInstitucion()%>"><%=pension.getNombre()%></option>
                                           <% }} %>
                                       </select>
                                    </td>
                                    <td>
                                        <%if (MAhorroAFP>0){%>
                                        <input type="checkbox" name="chkAhorroAFP" id="chkAhorroAFP" value="1" onchange="habilitarAhorroPension(this);" checked>
                                        <%}else{%>
                                        <input type="checkbox" name="chkAhorroAFP" id="chkAhorroAFP" value="1" onchange="habilitarAhorroPension(this);" >
                                        <input type="hidden" value="0" name="AhorroAFP">
                                        <%}%>
                                    </td>
                                    <td>
                                        <input type="text" name="MontoAhorroAFP" id="MontoAhorroAFP" class="form-control" onkeypress="return SoloNumeros(event)" maxlength="10" value="<%=MAhorroAFP%>" placeholder="Monto Pactado" disabled/>
                                    </td>
                                    <td>
                                        <select name="AhorroAFP" id="AhorroAFP"  class="form-control" disabled>
                                                <option value="0">Seleccione Moneda</option>
                                               <% for (clsTipoMoneda moneda : Moneda) { 
                                               if (TipMonAhorroAFP==moneda.getIdTipoMoneda()){ %>
                                               <option value="<%=moneda.getIdTipoMoneda()%>" selected><%=moneda.getNombre()%></option>
                                               <% } else{ %>
                                               <option value="<%=moneda.getIdTipoMoneda()%>"><%=moneda.getNombre()%></option>
                                               <% }} %>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><label>APV</label></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td>
                                        <%if (MonAPV>0){%>
                                        <input type="checkbox" name="chkAPV" id="chkAPV" value="1" onchange="habilitarAPV(this);" checked>
                                        <% } else{ %>
                                        <input type="checkbox" name="chkAPV" id="chkAPV" value="1" onchange="habilitarAPV(this);" >
                                        <input type="hidden" value="0" name="chkAPV">
                                        <%}%>
                                    </td>
                                    <td>
                                        <input type="text" name="MontoAPV" id="MontoAPV" class="form-control" value="<%=MonAPV%>"  maxlength="10"  placeholder="Monto Pactado" disabled/>
                                    </td>
                                    <td>
                                        <select name="MonedaAPV" id="MonedaAPV"  class="form-control" disabled>
                                               <% for (clsTipoMoneda moneda : Moneda) { 
                                               if (TipMonAPV==moneda.getIdTipoMoneda()){%>
                                               <option value="<%=moneda.getIdTipoMoneda()%>" selected><%=moneda.getNombre()%></option>
                                               <% } else{ %>
                                               <option value="<%=moneda.getIdTipoMoneda()%>"><%=moneda.getNombre()%></option>
                                               <% }}%>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td colspan="2">
                                        <select name="cboAPV" id="cboAPV"  class="form-control" id="sel1" disabled>
                                           <option>Seleccione Institucion</option>
                                           <% for (clsPension pension : Pension) { 
                                           if (InstitucionAPV==pension.getIdInstitucion()){%>
                                           <option value="<%=pension.getIdInstitucion()%>" selected><%=pension.getNombre()%></option>
                                           <% } else{ %>
                                           <option value="<%=pension.getIdInstitucion()%>"><%=pension.getNombre()%></option>
                                           <% }} %>
                                       </select> 
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <label>SIS</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <%if (Pen<100){%>
                                        <input type="radio" value="2" name="optPension" onchange="habilitarPension(this.value);">
                                        <%}else{%>
                                        <input type="radio" value="2" name="optPension" onchange="habilitarPension(this.value);" checked>
                                        <%}%>
                                    </td>
                                    <td>
                                        <%
                                       List<clsPension> sis = pe.LlenaComboInstitucionPension(pe,"1");
                                       %>
                                       <select name="cboSis" id="cboSis"  class="form-control" id="sel1" disabled>
                                           <option>Seleccione Institucion</option>
                                           <% for (clsPension Sis : sis) { 
                                           if (Pen==Sis.getIdInstitucion()){%>
                                           <option value="<%=Sis.getIdInstitucion()%>" selected><%=Sis.getNombre()%></option>
                                           <% } else{ %>
                                           <option value="<%=Sis.getIdInstitucion()%>"><%=Sis.getNombre()%></option>
                                           <% }} %>
                                       </select>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <!---------------------------------------- Tab Cargas Familiares ------------------------------------------------------>
                    <div role="tabpanel" class="tab-pane" id="CargFam">
                        <div class="panel panel-default">
                            <div class="panel-body">Datos de la carga</div>
                            <table class="table table-borderless" id='cargas'>
                                <tbody>
                                    <tr>
                                        <td>
                                            <label for="RutCarga" class="control-label">Rut Carga: </label>
                                            <input type="text" name="RutCarga" id="RutCarga" class="form-control" maxlength="9"/>
                                        </td>
                                        <td>
                                            <label for="NombreCarga" class="control-label">Nombres: </label>
                                            <input type="text" name="NombreCarga" id="NombreCarga" class="form-control" onkeypress="return SoloLetras(event)" maxlength="50"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="PaternoCarga" class="control-label">Apellido Paterno: </label>
                                            <input type="text" name="PaternoCarga" id="PaternoCarga" class="form-control" onkeypress="return SoloLetras(event)" maxlength="50"/>
                                        </td>
                                        <td>
                                            <label for="MaternoCarga" class="control-label">Apellido Materno: </label>
                                            <input type="text" name="MaternoCarga" id="MaternoCarga" class="form-control" onkeypress="return SoloLetras(event)" maxlength="50"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="calFechaNacimientoCarga" class="control-label ">Fecha Nacimiento Carga: </label>
                                            <input class="form-control" id="calFechaNacimientoCarga" name="calFechaNacimientoCarga" type="text" readonly/>
                                        </td> 
                                        <td>
                                            <label for="generoCarga" class="control-label">Genero Carga: </label></br>
                                            <input type="radio" name="generoCarga" id="generoCargaM" value="M" checked>Masculino
                                            <input type="radio" name="generoCarga" id="generoCargaF" value="F">Femenino
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="calFechaNacimientoCarga" class="control-label ">Fecha Inicio Carga: </label>
                                            <input class="form-control" id="calFechaInicioCarga" name="calFechaInicioCarga" type="text" readonly/>
                                        </td>
                                        <td>
                                            <label for="calFechaNacimientoCarga" class="control-label ">Fecha Termino Carga: </label>
                                            <input class="form-control" id="calFechaTerminoCarga" name="calFechaTerminoCarga" type="text" readonly/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                             <label for="Vinculo" class="control-label ">Vinculo: </label>
                                        </td>
                                    </tr>
                                    <td>
                                        <%
                                        clsVinculo Vi = new clsVinculo();
                                        List<clsVinculo> vin = Vi.LlenaVinculo(Vi);
                                        %>
                                       <select name="Vinculo" id="Vinculo" class="form-control">
                                           <option>Seleccione Vinculo</option>
                                           <% for (clsVinculo Vin : vin) { %>
                                           <option value="<%=Vin.getIdVinculo()%>"><%=Vin.getNombre()%></option>
                                           <% } %>                                                      
                                       </select>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-primary" aria-label="Left Align" value="Agregar" onclick="agregarCarga()">
                                            <span class="glyphicon glyphicon-plus"></span>Agregar Carga
                                        </button>
                                    </td>
                                </tbody>
                            </table>  
                            <div class="table-responsive" id="listadocargas">
                                
                            </div>
                        </div>
                    </div>
                    <!---------------------------------------- Contratos ------------------------------------------------------>
                    <div role="tabpanel" class="tab-pane" id="VidaFunc">   
                        <div class="panel panel-default">
                            <div class="panel-body">Contratos</div>
                            <table class="table table-borderless" id='cargas'>
                                <tr>
                                    <td>
                                        <label for="Cargo" class="control-label ">Cargo: </label>
                                    </td>
                                    <td>
                                        <label for="Cargo" class="control-label ">Tipo Contrato: </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <%
                                        clsCargo Ca = new clsCargo();
                                        List<clsCargo> car = Ca.ListaCargos(Ca);
                                        %>
                                       <select name="Cargo" id="Cargo"  class="form-control">
                                           <option>Seleccione Cargo</option>
                                           <% for (clsCargo Car : car) { %>
                                           <option value="<%=Car.getIdCargo()%>"><%=Car.getNombre()%></option>
                                           <% } %>                                                      
                                       </select>
                                    </td>
                                    <td>
                                        <%
                                        clsTipoContrato Co = new clsTipoContrato();
                                        List<clsTipoContrato> con = Co.LlenaTipoContrato(Co);
                                        %>
                                       <select name="TipoContrato" id="TipoContrato"  class="form-control">
                                           <option>Seleccione Tipo Contrato</option>
                                           <% for (clsTipoContrato Con : con) { %>
                                           <option value="<%=Con.getId()%>"><%=Con.getNombre()%></option>
                                           <% } %>                                                      
                                       </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="calFechaDesde" class="control-label ">Fecha Desde: </label>
                                        <input class="form-control" id="calFechaDesdeCont" name="calFechaDesdeCont" type="text" readonly/>
                                    </td>
                                    <td>
                                        <label for="calFechaHasta" class="control-label ">Fecha Hasta: </label>
                                        <input class="form-control" id="calFechaHastaCont" name="calFechaHastaCont" type="text" readonly/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="SueldoBase" class="control-label">Sueldo Base: </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="text" name="SueldoBase" id="SueldoBase" class="form-control" onkeypress="return SoloNumeros(event)" maxlength="10"/>
                                    </td>
                                    <td>
                                        <input type="checkbox" name="Subsidio" id="Subsidio" value="1"><label>Subsidio Trabajador Joven</label>
                                        <input type="hidden" value="0" name="Subsidio">
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <button type="button" class="btn btn-primary" aria-label="Left Align" value="AgregarContrato" onclick="agregarContrato()">
                                            <span class="glyphicon glyphicon-plus"></span>Agregar Contrato
                                        </button>
                                    </td>
                                </tr>
                            </table>
                            <div class="table-responsive" id="listadocontratos">
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary save" id="Guardar">Guardar Cambios</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
            </div>
        </form>
        <script>
            $(document).ready(function(){
                var date_input=$('input[name="Fecha"]'); //our date input has the name "date"
                var date_FechaIng=$('input[name="FechaIngreso"]'); //our date input has the name "date"
                var date_calFechaNacimientoCarga=$('input[name="calFechaNacimientoCarga"]'); //our date input has the name "date"
                var date_calFechaInicioCarga=$('input[name="calFechaInicioCarga"]'); //our date input has the name "date"
                var date_calFechaTerminoCarga=$('input[name="calFechaTerminoCarga"]'); //our date input has the name "date"
                var date_calFechaDesdeContrato=$('input[name="calFechaDesdeCont"]'); //our date input has the name "date"
                var date_calFechaHastaContrato=$('input[name="calFechaHastaCont"]'); //our date input has the name "date"
                var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
                var miAccion=$('input[type=hidden]').val();

                if (miAccion==0){
                    date_input.datepicker({
                        format: 'dd/mm/yyyy',
                        container: container,
                        todayHighlight: true,
                        autoclose: true,
                        firstDay:1
                    }).datepicker("setDate", new Date());

                    date_FechaIng.datepicker({
                        format: 'dd/mm/yyyy',
                        container: container,
                        todayHighlight: true,
                        autoclose: true,
                        firstDay:1
                    }).datepicker("setDate", new Date());
                    
                    date_calFechaNacimientoCarga.datepicker({
                        format: 'dd/mm/yyyy',
                        container: container,
                        todayHighlight: true,
                        autoclose: true,
                        firstDay:1
                    }).datepicker("setDate", new Date());
                    
                    date_calFechaInicioCarga.datepicker({
                        format: 'dd/mm/yyyy',
                        container: container,
                        todayHighlight: true,
                        autoclose: true,
                        firstDay:1
                    }).datepicker("setDate", new Date());
                    
                    date_calFechaTerminoCarga.datepicker({
                        format: 'dd/mm/yyyy',
                        container: container,
                        todayHighlight: true,
                        autoclose: true,
                        firstDay:1
                    }).datepicker("setDate", new Date());
                    
                    date_calFechaDesdeContrato.datepicker({
                        format: 'dd/mm/yyyy',
                        container: container,
                        todayHighlight: true,
                        autoclose: true,
                        firstDay:1
                    }).datepicker("setDate", new Date());
                    
                    date_calFechaHastaContrato.datepicker({
                        format: 'dd/mm/yyyy',
                        container: container,
                        todayHighlight: true,
                        autoclose: true,
                        firstDay:1
                    }).datepicker("setDate", new Date());
                }else{
                    date_input.datepicker({
                        format: 'dd/mm/yyyy',
                        container: container,
                        todayHighlight: true,
                        autoclose: true,
                        firstDay:1
                    })

                    date_FechaIng.datepicker({
                        format: 'dd/mm/yyyy',
                        container: container,
                        todayHighlight: true,
                        autoclose: true,
                        firstDay:1
                    })
                    
                    date_calFechaNacimientoCarga.datepicker({
                        format: 'dd/mm/yyyy',
                        container: container,
                        todayHighlight: true,
                        autoclose: true,
                        firstDay:1
                    }).datepicker("setDate", new Date());
                    
                    date_calFechaInicioCarga.datepicker({
                        format: 'dd/mm/yyyy',
                        container: container,
                        todayHighlight: true,
                        autoclose: true,
                        firstDay:1
                    }).datepicker("setDate", new Date());
                    
                    date_calFechaTerminoCarga.datepicker({
                        format: 'dd/mm/yyyy',
                        container: container,
                        todayHighlight: true,
                        autoclose: true,
                        firstDay:1
                    }).datepicker("setDate", new Date());
                    
                    date_calFechaDesdeContrato.datepicker({
                        format: 'dd/mm/yyyy',
                        container: container,
                        todayHighlight: true,
                        autoclose: true,
                        firstDay:1
                    }).datepicker("setDate", new Date());
                    
                    date_calFechaHastaContrato.datepicker({
                        format: 'dd/mm/yyyy',
                        container: container,
                        todayHighlight: true,
                        autoclose: true,
                        firstDay:1
                    }).datepicker("setDate", new Date());
                }
                
                listarCargas();
                listarContratos();
            });
           
            function listarCargas() {
                var urlRUT='ProcesaConsultas.jsp?llamado=2';
                    $.ajax({
                      type: 'POST',
                      url: [urlRUT],
                      dataType  : 'html',
                      success: function(data){
                        $('#listadocargas').html(data);
                      }
                    });
            }  // listarUsuarios
            
            function listarContratos() {
                var urlRUT='ProcesaConsultas.jsp?llamado=5';
                    $.ajax({
                      type: 'POST',
                      url: [urlRUT],
                      dataType  : 'html',
                      success: function(data){
                        $('#listadocontratos').html(data);
                      }
                    });
            }  // listarContratos

            $('#Guardar').submit(function(e) {
                e.preventDefault();
                // Coding
                $('#myModal').modal('hide'); //or  $('#IDModal').modal('hide');
                return false;
            });

            //HABILITA DATOS CUANDO ES ISAPRE
            var tipo=<%= Sal%>;
            if (tipo!==7){
                $('#MontoPactado').removeAttr('disabled');
                $('#Salud').removeAttr('disabled');
                $('#NumeroContrato').removeAttr('disabled');
                $('#FechaIngreso').removeAttr('disabled');
                $('#MonedaSalud').removeAttr('disabled');
            }

            //HABILITA DATOS CUANDO ES AFP
            var tipoP=<%= Pen%>;
            if (tipoP>=100){
                $('#cboSis').removeAttr('disabled');
                $('#Pension').attr('disabled','disabled');
            }

            if (<%=MAhorroAFP%>>0){
                $('#MontoAhorroAFP').removeAttr('disabled','disabled');
                $('#AhorroAFP').removeAttr('disabled','disabled');
            }

            if (<%=MonAPV%>>0){
                $('#MontoAPV').removeAttr('disabled','disabled');
                $('#MonedaAPV').removeAttr('disabled','disabled');
                $('#cboAPV').removeAttr('disabled','disabled');
            }
        </script>
    </body>
</html>
