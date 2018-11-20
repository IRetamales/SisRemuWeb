<%-- 
    Document   : LiquidarFuncionarios
    Created on : 30-ago-2018, 13:00:50
    Author     : Articuno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="panel panel-default" id="cmbHaberes">
            <div class="panel-heading">Liquidar a:</div>
            <table style="width: 100%">
                <tr>
                    <td style="text-align: center">
                        <input type="radio" id="Grupo" name="Grupo" value="1" checked>Funcionario Activo
                    </td>
                    <td style="text-align: center">
                        <input type="radio" id="Grupo" name="Grupo" value="2" >Grupo Seleccionado
                    </td>
                    <td style="text-align: center">
                        <input type="radio" id="Grupo" name="Grupo" value="3" >Todos
                    </td>
                </tr>
            </table>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-primary" id="Asignar" value="Agregar" >Liquidar</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        </div>
        <script>
            $('#Asignar').click(function(){
                var grupo = document.getElementsByName('Grupo');
                for(var x in grupo){
                    if(grupo[x].checked){
                        var gru=grupo[x].value;
                    }
                }
                liquidarFuncionario(gru);
                $(".modal").modal("hide");
            });
            
            function liquidarFuncionario(valor) {
                var urlRUT='ProcesaConsultas.jsp?llamado=22&gru='+valor;
                    $.ajax({
                      type: 'POST',
                      url: [urlRUT],
                      dataType  : 'html',
                      success: function(data){
                        $('#DescuentosLiquido').html(data);
                      }
                    });
            }  // listarLiquido
        </script>
    </body>
</html>
