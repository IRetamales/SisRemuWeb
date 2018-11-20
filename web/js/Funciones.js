/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function SoloLetras(e) {
    tecla = (document.all) ? e.keyCode : e.which;
    if (tecla==8) return true;
    patron =/^[a-zA-ZñÑ\s]*$/;
    te = String.fromCharCode(tecla);
    return patron.test(te);
}

function SoloNumeros(e) {
    tecla = (document.all) ? e.keyCode : e.which;
    if (tecla==8) return true;
    patron = /\d/;
    te = String.fromCharCode(tecla);
    return patron.test(te);
}

function validarEmail(valor) {
    if (/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/.test(valor)){
        return 0;
    } else {
        return -1;
    }
}

function valida(f) {
    valor = document.getElementById("RutPersona").value;
    if( valor == null || valor.length == 0 || /^\s+$/.test(valor) ) {
        alert('[ERROR] Debe ingresar un Rut valido...');
        return false;
    }

    valor = document.getElementById("Nombre").value;
    if( valor == null || valor.length == 0 ) {
        alert('[ERROR] Debe ingresar un nombre valido...');
        return false;
    }

    valor = document.getElementById("Paterno").value;
    if( valor == null || valor.length == 0 || /^\s+$/.test(valor) ) {
        alert('[ERROR] Debe ingresar un apellido paterno valido...');
        return false;
    }

    valor = document.getElementById("Materno").value;
    if( valor == null || valor.length == 0 || /^\s+$/.test(valor) ) {
        alert('[ERROR] Debe ingresar un apellido materno valido...');
        return false;
    }

    valor = document.getElementById("Celular").value;
    if( valor == null || valor.length == 0 || /^\s+$/.test(valor) ) {
        alert('[ERROR] Debe ingresar un celular valido...');
        return false;
    }

    valor = document.getElementById("Email").value;
    if( valor == null || valor.length == 0 || /^\s+$/.test(valor) ) {
        alert('[ERROR] Debe ingresar un Email valido...');
        return false;
    }

    valor = document.getElementById("FechaNacimiento").value;
    if( valor == null || valor.length == 0 || /^\s+$/.test(valor) ) {
        alert('[ERROR] Debe ingresar una fecha valida...');
        return false;
    }

    return true;
}

function addImage(pk) {
    alert("addImage: " + pk);
}

function habilitarSalud(value)
{
    if(value=="1")
    {
        // habilitamos
        document.getElementById("Salud").disabled=true;
        document.getElementById("FechaIngreso").disabled=true;
        document.getElementById("MontoPactado").disabled=true;
        document.getElementById("NumeroContrato").disabled=true;
        document.getElementById("MonedaSalud").disabled=true;
    }else if(value=="2"){
        // deshabilitamos
        document.getElementById("Salud").disabled=false;
        document.getElementById("FechaIngreso").disabled=false;
        document.getElementById("MontoPactado").disabled=false;
        document.getElementById("NumeroContrato").disabled=false;
        document.getElementById("MonedaSalud").disabled=false;
    }
}

function habilitarAhorroPension(value)
{
    if(value.checked==true)
    {
        // habilitamos
        document.getElementById("MontoAhorroAFP").disabled=false;
        document.getElementById("AhorroAFP").disabled=false;
    }else{
        // deshabilitamos
        document.getElementById("MontoAhorroAFP").disabled=true;
        document.getElementById("AhorroAFP").disabled=true;
    }
}

function habilitarAPV(value)
{
    if(value.checked==true)
    {
        // habilitamos
        document.getElementById("MontoAPV").disabled=false;
        document.getElementById("cboAPV").disabled=false;
        document.getElementById("MonedaAPV").disabled=false;
    }else{
        // deshabilitamos
        document.getElementById("MontoAPV").disabled=true;
        document.getElementById("cboAPV").disabled=true;
        document.getElementById("MonedaAPV").disabled=true;
    }
}

function habilitarPension(value)
{
    if(value=="1")
    {
        // habilitamos
        document.getElementById("Pension").disabled=false;
        document.getElementById("chkAhorroAFP").disabled=false;
        document.getElementById("chkAPV").disabled=false;
        document.getElementById("cboSis").disabled=true;
    }else if(value=="2"){
        // deshabilitamos
        document.getElementById("Pension").disabled=true;
        document.getElementById("chkAhorroAFP").disabled=true;
        document.getElementById("chkAPV").disabled=true;
        document.getElementById("cboSis").disabled=false;
        document.getElementById("MontoAPV").disabled=true;
        document.getElementById("cboAPV").disabled=true;
        document.getElementById("MontoAhorroAFP").disabled=true;
        document.getElementById("MonedaAPV").disabled=true;
        document.getElementById("AhorroAFP").disabled=true;
     }
}

$(function () { //OBTENER LAS FECHAS DE LOS CALENDARIOS DEL FORM
    $('#Fecha').datetimepicker({
        format: 'DD/MM/YYYY',
        locale: 'es'
    });

    $('#FechaIngreso').datetimepicker({
        format: 'DD/MM/YYYY',
        locale: 'es'
    });
    $('#calFechaNacimientoCarga').datetimepicker({
        format: 'DD/MM/YYYY',
        locale: 'es'
    });
    $('#calFechaInicioCarga').datetimepicker({
        format: 'DD/MM/YYYY',
        locale: 'es'
    });
    $('#calFechaTerminoCarga').datetimepicker({
        format: 'DD/MM/YYYY',
        locale: 'es'
    });
    
    $('#calFechaDesde').datetimepicker({
        format: 'DD/MM/YYYY',
        locale: 'es'
    });
    
    $('#calFechaHasta').datetimepicker({
        format: 'DD/MM/YYYY',
        locale: 'es'
    });
});

$(document).ready(function(){  
    $("#optPension").click(function() {
        if($("#chkAPV").is(':checked')) { 
           $("#MontoAPV").prop('disabled', false);
           $("#cboAPV").prop('disabled', false);
           $("#MonedaAPV").prop('disabled', false);
        } 

        if($("#chkAhorroAFP").is(':checked')) { 
           $("#MontoAhorroAFP").prop('disabled', false);
           $("#AhorroAFP").prop('disabled', false);
        } 
   });
});

function agregarCarga() {
    if (validaIngresoCargas()){
    //obtenemos los valores de nuestra caja de texto
    var llamado="llamado=1"; 
    var rutfun="&rutfun="+document.getElementById("RutPersona").value;
    var rut="&rut="+document.getElementById("RutCarga").value;
    var nom="&nombre="+document.getElementById("NombreCarga").value;
    var pat="&paterno="+document.getElementById("PaternoCarga").value;
    var mat="&materno="+document.getElementById("MaternoCarga").value;
    var nac="&nacimiento="+document.getElementById("calFechaNacimientoCarga").value;
    var ini="&inicio="+document.getElementById("calFechaInicioCarga").value;
    var ter="&termino="+document.getElementById("calFechaTerminoCarga").value;
    var elementos = document.getElementsByName('generoCarga');
    for(var x in elementos){
        if(elementos[x].checked){
            var gen="&gen="+elementos[x].value;
        }
    }
    
    var vin="&vinc="+document.getElementById("Vinculo").value;
    var xhr = new XMLHttpRequest();
    
    xhr.open("POST","ProcesaConsultas.jsp");
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhr.send(llamado+rutfun+rut+nom+pat+mat+nac+ini+ter+vin+gen);
    
    
    //Reiniciar todos los objetos
    document.getElementById("RutCarga").value="";
    document.getElementById("NombreCarga").value="";
    document.getElementById("PaternoCarga").value="";
    document.getElementById("MaternoCarga").value="";
    document.getElementById("Vinculo").value="";

    listarCargas();
    };
}

function EditarCarga(NodoBoton){
    var nodoTd = NodoBoton.parentNode; //Nodo TD
    var nodoTr = nodoTd.parentNode; //Nodo TR
    var celda = nodoTr.getElementsByTagName('td');
    $("#RutCarga").val(celda[0].innerHTML.toString().trim());
    $("#NombreCarga").val(celda[1].innerHTML.toString().trim());
    $("#PaternoCarga").val(celda[2].innerHTML.toString().trim());
    $("#MaternoCarga").val(celda[3].innerHTML.toString().trim());
    $("#calFechaNacimientoCarga").val(celda[4].innerHTML.toString().trim());
    $("#calFechaInicioCarga").val(celda[5].innerHTML.toString().trim());
    $("#calFechaTerminoCarga").val(celda[6].innerHTML.toString().trim());
    $("#Vinculo").val(celda[7].innerHTML);
    if(celda[7].innerHTML.toString().trim()==="F"){
        document.getElementById("generoCargaF").checked = true;
    }else{
        document.getElementById("generoCargaM").checked = true;
    }
    document.getElementById("Vinculo").value = celda[8].innerHTML.toString().trim();
    var R=celda[0].innerHTML.toString();
    
    EliminaCarga(R);
}

function EliminaCarga(RutCarga){
    var llamado="llamado=3"; 
    var rutfun="&rut="+RutCarga;
    var xhr = new XMLHttpRequest();
    
    xhr.open("POST","ProcesaConsultas.jsp");
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhr.send(llamado+rutfun);
    listarCargas();
}

function agregarContrato() {
    if (validaIngresoContrato()){
    //obtenemos los valores de nuestra caja de texto
    var llamado="llamado=4";
    var rutfun="&rutfun="+document.getElementById("RutPersona").value;
    var car="&car="+document.getElementById("Cargo").value;
    var tip="&tip="+document.getElementById("TipoContrato").value;
    var des="&des="+document.getElementById("calFechaDesdeCont").value;
    var has="&has="+document.getElementById("calFechaHastaCont").value;
    var sue="&sue="+document.getElementById("SueldoBase").value;
    if (document.getElementById("Subsidio").checked===true){
        var sub="&sub=1"
    }else{
        var sub="&sub=0"
    }
    //var sub="&sub=1"+document.getElementById("Subsidio").value;
    
    var xhr = new XMLHttpRequest();
    
    xhr.open("POST","ProcesaConsultas.jsp");
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhr.send(llamado+rutfun+car+tip+des+has+sue+sub);
    
    document.getElementById("Cargo").value="";
    document.getElementById("TipoContrato").value="";
    document.getElementById("SueldoBase").value="";
    document.getElementById("Subsidio").value="";
    
    listarContratos();
    }
}

function EditarContrato(NodoBoton){
    var nodoTd = NodoBoton.parentNode; //Nodo TD
    var nodoTr = nodoTd.parentNode; //Nodo TR
    var celda = nodoTr.getElementsByTagName('td');
    document.getElementById("Cargo").value = celda[1].innerHTML.toString().trim();
    document.getElementById("TipoContrato").value = celda[3].innerHTML.toString().trim();
    $("#calFechaDesdeCont").val(celda[5].innerHTML.toString().trim());
    $("#calFechaHastaCont").val(celda[6].innerHTML.toString().trim());
    $("#SueldoBase").val(celda[7].innerHTML.toString().trim());
    if(celda[8].innerHTML.toString().trim()==="1"){
        document.getElementById("Subsidio").checked = true;
    }else{
        document.getElementById("Subsidio").checked = false;
    }
}

function EliminaContrato(idContrato){
    var llamado="llamado=6"; 
    var idcont="&idcont="+idContrato;
    var xhr = new XMLHttpRequest();
    
    xhr.open("POST","ProcesaConsultas.jsp");
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhr.send(llamado+idcont);
    listarContratos();
}

function validaIngresoCargas() {
    valor = document.getElementById("RutCarga").value;
    if( valor == null || valor.length == 0 || /^\s+$/.test(valor) ) {
        alert('[ERROR] Debe ingresar un Rut de la carga valido...');
        return false;
    }

    valor = document.getElementById("NombreCarga").value;
    if( valor == null || valor.length == 0 ) {
        alert('[ERROR] Debe ingresar un nombre de la carga valido...');
        return false;
    }

    valor = document.getElementById("PaternoCarga").value;
    if( valor == null || valor.length == 0 || /^\s+$/.test(valor) ) {
        alert('[ERROR] Debe ingresar un apellido paterno  de la carga valido...');
        return false;
    }

    valor = document.getElementById("MaternoCarga").value;
    if( valor == null || valor.length == 0 || /^\s+$/.test(valor) ) {
        alert('[ERROR] Debe ingresar un apellido materno de la carga valido...');
        return false;
    }

    valor = document.getElementById("calFechaNacimientoCarga").value;
    if( valor == null || valor.length == 0 || /^\s+$/.test(valor) ) {
        alert('[ERROR] Debe ingresar una fecha nacimiento carga valida...');
        return false;
    }
    
    valor = document.getElementById("calFechaInicioCarga").value;
    if( valor == null || valor.length == 0 || /^\s+$/.test(valor) ) {
        alert('[ERROR] Debe ingresar una fecha de inicio valida...');
        return false;
    }
    
    valor = document.getElementById("calFechaTerminoCarga").value;
    if( valor == null || valor.length == 0 || /^\s+$/.test(valor) ) {
        alert('[ERROR] Debe ingresar una fecha de termino valida...');
        return false;
    }

    return true;
}

function validaIngresoContrato() {
    valor = document.getElementById("Cargo").value;
    if( valor == 0 ) {
        alert('[ERROR] Debe ingresar un cargo valido...');
        return false;
    }

    valor = document.getElementById("TipoContrato").value;
    if( valor == null || valor.length == 0 ) {
        alert('[ERROR] Debe ingresar tipo de contrato valido...');
        return false;
    }

    valor = document.getElementById("SueldoBase").value;
    if( valor == null || valor.length == 0 || /^\s+$/.test(valor) ) {
        alert('[ERROR] Debe ingresar un sueldo base valido...');
        return false;
    }
    return true;
}

function ActualizaAFP(){
    var tableReg = document.getElementById('tablaAFP');
   
    cellsOfRow1 = tableReg.rows[1].getElementsByTagName('td');
    cellsOfRow2 = tableReg.rows[2].getElementsByTagName('td');
    cellsOfRow3 = tableReg.rows[3].getElementsByTagName('td');
    cellsOfRow4 = tableReg.rows[4].getElementsByTagName('td');
    cellsOfRow5 = tableReg.rows[5].getElementsByTagName('td');
    cellsOfRow6 = tableReg.rows[6].getElementsByTagName('td');
   
    var llamado="llamado=9";
    var capital="&cap="+cellsOfRow1[1].innerHTML.toLowerCase();
    var cuprum="&cup="+cellsOfRow2[1].innerHTML.toLowerCase();
    var habitat="&hab="+cellsOfRow3[1].innerHTML.toLowerCase();
    var planvital="&pla="+cellsOfRow4[1].innerHTML.toLowerCase();
    var provida="&pro="+cellsOfRow5[1].innerHTML.toLowerCase();
    var modelo="&mod="+cellsOfRow6[1].innerHTML.toLowerCase();
    
    var xhr = new XMLHttpRequest();
    
    xhr.open("POST","ProcesaConsultas.jsp");
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhr.send(llamado+capital+cuprum+habitat+planvital+provida+modelo);
}

function ActualizaValoresCargasFamiliares(){
    var tableReg = document.getElementById('tramocargafamiliar');
   
    //cellsOfRow1 = tableReg.rows[1].getElementsByTagName('td');
    var llamado="llamado=10";
    var tramo="";
    var monto="";
    var desde="";
    var hasta="";
    for (var i = 1; i <=4; i++) { 
        cellsOfRow = tableReg.rows[i].getElementsByTagName('td');
        
        tramo="&tra="+cellsOfRow[0].innerHTML.toLowerCase();
        monto="&mon="+cellsOfRow[1].innerHTML.toLowerCase();
        desde="&des="+cellsOfRow[2].innerHTML.toLowerCase();
        hasta="&has="+cellsOfRow[3].innerHTML.toLowerCase();
        var xhr = new XMLHttpRequest();

        xhr.open("POST","ProcesaConsultas.jsp");
        xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xhr.send(llamado+tramo+monto+desde+hasta);
    }
}

function ActualizaValoresImpuestos(){
    var tableReg = document.getElementById('impuesto');
   
    //cellsOfRow1 = tableReg.rows[1].getElementsByTagName('td');
    var llamado="llamado=11";
    var tramo="";
    var factor="";
    var rebaja="";
    var desde="";
    var hasta="";
    for (var i = 1; i <=7; i++) { 
        tramo="&tra="+i;
        cellsOfRow = tableReg.rows[i].getElementsByTagName('td');
        
        desde="&des="+cellsOfRow[0].innerHTML.toLowerCase();
        hasta="&has="+cellsOfRow[1].innerHTML.toLowerCase();
        factor="&fac="+cellsOfRow[2].innerHTML.toLowerCase();
        rebaja="&reb="+cellsOfRow[3].innerHTML.toLowerCase();
        var xhr = new XMLHttpRequest();

        xhr.open("POST","ProcesaConsultas.jsp");
        xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xhr.send(llamado+tramo+desde+hasta+factor+rebaja);
    }
}

function ActualizaParametro(nombre){
    if (nombre==="ValorUF"){
        var valor=document.getElementById('ValorUF').value;
    }
    
    if (nombre==="ValorUTM"){
        var valor=document.getElementById('ValorUTM').value;
    }
    
    if (nombre==="SueldoMinimo"){
        var valor=document.getElementById('SueldoMinimo').value;
        nombre="SUELDOMIN";
    }
    
    if (nombre==="TopeImpAFP"){
        var valor=document.getElementById('TopeImpAFP').value;
        nombre="TOTIMPAFP";
    }
    
    if (nombre==="TopeImpIPS"){
        var valor=document.getElementById('TopeImpIPS').value;
        nombre="TOTIMPIPS";
    }
    
    if (nombre==="CesPlazIndEmp"){
        var valor=document.getElementById('CesPlazIndEmp').value;
        nombre="CESPLAINE";
    }
    
    if (nombre==="CesPlazIndTrab"){
        var valor=document.getElementById('CesPlazIndTrab').value;
        nombre="CESPLAINT";
    }
    
    if (nombre==="CesPlazFijoEmp"){
        var valor=document.getElementById('CesPlazFijoEmp').value;
        nombre="CESPLAFIE";
    }
    
    if (nombre==="CesPlazIndEmpPlus"){
        var valor=document.getElementById('CesPlazIndEmpPlus').value;
        nombre="CESPLUS";
    }

    var llamado="llamado=12";
    var nom="&nom="+nombre;
    var val="&val="+valor;

    var xhr = new XMLHttpRequest();

    xhr.open("POST","ProcesaConsultas.jsp");
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhr.send(llamado+nom+val);
}

function GuardaDatos(){
    ActualizaParametro("ValorUF");
    ActualizaParametro("ValorUTM");
    ActualizaParametro("SueldoMinimo");
    ActualizaParametro("TopeImpAFP");
    ActualizaParametro("TopeImpIPS");
    ActualizaParametro("CesPlazIndEmp");
    ActualizaParametro("CesPlazIndTrab");
    ActualizaParametro("CesPlazFijoEmp");
    ActualizaParametro("CesPlazIndEmpPlus");
}

function Seleccionar(rut){
    var llamado="llamado=17";
    var rutF="&rut="+rut;

    var xhr = new XMLHttpRequest();

    xhr.open("POST","ProcesaConsultas.jsp");
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhr.send(llamado+rutF);
}

function AsignaConceptos(){
    var llamado="llamado=21";
    var elementos = document.getElementsByName('Concepto');
    for(var x in elementos){
        if(elementos[x].checked){
            var tip=elementos[x].value;
        }
    }
    
    if (tip==="H"){
        var cod="&cod="+document.getElementById("Haber").value;
    }else{
        var cod="&cod="+document.getElementById("Descuento").value;
    }
    //tip="&tip="+tip;
    
    var grupo = document.getElementsByName('Grupo');
    for(var x in grupo){
        if(grupo[x].checked){
            var gru="&gru="+grupo[x].value;
        }
    }
    
    var xhr = new XMLHttpRequest();

    xhr.open("POST","ProcesaConsultas.jsp");
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhr.send(llamado+cod+gru);
}

function ImprimirLiquidaciones(){
    var llamado="llamado=23";
    var tothab = "&tothab="+document.getElementById('TotalHaberes').innerHTML;
    var totimp = "&totimp="+document.getElementById('TotalImponible').innerHTML;
    var tottri = "&tottri="+document.getElementById('TotalTributable').innerHTML;
    var totdes = "&totdes="+document.getElementById('TotalDescuentos').innerHTML;
    var liq = "&liq="+document.getElementById('Liquido').innerHTML;
    
    var xhr = new XMLHttpRequest();

    xhr.open("POST","ProcesaConsultas.jsp");
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhr.send(llamado+tothab+totimp+tottri+totdes+liq);
}

function actualizaRango(){
    if (document.getElementById('CodigoConcepto').value===""){
        alert("Debe ingresar un valor de codigo para el concepto..!");
        return;
    }
    var llamado="llamado=27";
    var des = "&des="+document.getElementById('Desde').value.trim();
    var cod = "&cod="+document.getElementById('CodigoConcepto').value.trim();
    var has = "&has="+document.getElementById('Hasta').value.trim();
    var val = "&val="+document.getElementById('Valor').value.trim();
    
    var xhr = new XMLHttpRequest();

    xhr.open("POST","ProcesaConsultas.jsp");
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhr.send(llamado+des+has+val+cod);
}

function EliminaRango(des,has){
    var llamado="llamado=28";
    var desd = "&des="+des;
    var cod = "&cod="+document.getElementById('CodigoConcepto').value.trim();
    var hast = "&has="+has;
    
    var xhr = new XMLHttpRequest();

    xhr.open("POST","ProcesaConsultas.jsp");
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhr.send(llamado+desd+hast+cod);
    listarRango(document.getElementById('CodigoConcepto').value.trim());
}

function EditarRango(NodoBoton){
    var nodoTd = NodoBoton.parentNode; //Nodo TD
    var nodoTr = nodoTd.parentNode; //Nodo TR
    var celda = nodoTr.getElementsByTagName('td');
    $("#Desde").val(celda[0].innerHTML.toString().trim());
    $("#Hasta").val(celda[1].innerHTML.toString().trim());
    $("#Valor").val(celda[2].innerHTML.toString().trim());
}