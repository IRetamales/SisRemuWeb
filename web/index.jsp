<%-- 
    Document   : index
    Created on : 07-may-2018, 10:49:25
    Author     : Kraken
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistema de Remuneraciones</title>
        
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <link rel="stylesheet" href="estilo.css">
    </head>
    <div class="container" style="margin-top:40px">
        <div class="row">
            <div class="col-sm-6 col-md-4 col-md-offset-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <strong>Inicie sesion para continuar</strong>
                    </div>
                    <div class="panel-body">
                        <form role="form" action="InicioSesion" method="POST">
                            <fieldset>
                                <div class="row">
                                    <div class="center-block" style="text-align: center">
                                        <img class="profile-img" src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=120" alt="">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12 col-md-10  col-md-offset-1 ">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="glyphicon glyphicon-user"></i>
                                                </span> 
                                                <input class="form-control" placeholder="Username" name="login" type="text" maxlength="20" autofocus>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="glyphicon glyphicon-lock"></i>
                                                </span>
                                                <input class="form-control" placeholder="Password" name="password" type="password" maxlength="20" value="">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div >
                                                <div id="messages"></div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <input type="submit" id="btn" class="btn btn-lg btn-primary btn-block" value="Ingresar">
                                        </div>
                                    </div>
                                </div>
                            </fieldset>
                            <% 
                                String msg = (String)session.getAttribute("error");
                                if (msg!=null) { %>
                                <div class="alert alert-danger"><%= msg %></div>
                            <% session.invalidate();}%>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</html>
