
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="assets/css/bootstrap.css" />
        <link rel="stylesheet" href="assets/css/misestilos.css" />
        <title>Document</title>
    </head>

    <body class="mbody">

        <br><br><br>
        <div class="container mt-lg-auto" id="cabecera">

            <div class="row">
                <div class="col-4 px-5">
                    <img src="assets/imagenes/logo.png" id="logo">
                </div>
                <div class="col-6 text-start">
                    <br>
                    <h1 class="sombras fw-bold">MASCOLANDIA</h1>
                    <h2 class="fst-italic fw-bold text-info sombras">Esta es la casa de tu mejor amigo!</h2>
                </div>
            </div>

            <!-- Formulario de Ingreso -->

            <div class="row">

                <div class="col-4">

                </div>

                <div class="col-4 miborde sombrasB">
                    <form  method="POST" action="">
                        <br><br>
                        <div class="mb-3 px-5">
                            <label class="form-label fw-bold">Ingrese Usuario</label>
                            <input type="text" class="form-control" id="formGroupExampleInput" required="">
                        </div>

                        <div class="mb-3 px-5">
                            <label class="form-label fw-bold">Ingrese Contraseña</label>
                            <input type="password" class="form-control" id="formGroupExampleInput2" required="">
                        </div>
                        <br>
                        <div>
                            <center>
                                <button type="button" class="btn btn-secondary btn-sm btnSize">Ingresar</button>   
                            </center>                            
                        </div>
                        <br>
                        <br>

                    </form> 
                </div>

                <div class="col-4">

                </div>

            </div>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
        </div>
        <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>


