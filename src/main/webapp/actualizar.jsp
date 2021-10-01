<%-- 
    Document   : actualizar
    Created on : 30/09/2021, 09:37:03 AM
    Author     : Sistemas
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Modelos.Productos"%>
<%@page import="Controlador.ControlProductos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="assets/css/bootstrap.css" />
        <link rel="stylesheet" href="assets/css/misestilos.css" />
        <title>Document</title>
    </head>

    <body>

        <!--Inicio de la Cabecera------------------------------------------------------------------------------------------>
        <div class="container-fluid " id="cabecera">
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
        </div>
        <!--Inicio de la Cabecera------------------------------------------------------------------------------------------>

        <%
            String codigoInt = request.getParameter("codigoProducto");
            ControlProductos ctrProducto = new ControlProductos();
            ArrayList<Productos> consultaProducto = new ArrayList<>();
            consultaProducto = ctrProducto.consultar(codigoInt);
        %>


    <!--Inicio de la Barra de Menu------------------------------------------------------------------------------------------>
    <div class="container-fluid miborde py-2 fondo">
        <div class="row">
            <div class="col-12">
                <center>
                    <button type="button" class="btn btn-info miboton btnSize fw-bold">Inicio</button>               
                    <button type="button" class="btn btn-info miboton btnSize fw-bold">Productos</button>              
                    <button type="button" class="btn btn-info miboton btnSize fw-bold">Ventas</button>               
                    <button type="button" class="btn btn-info miboton btnSize fw-bold">Clientes</button>              
                    <button type="button" class="btn btn-info miboton btnSize fw-bold">Salir</button>
                </center>
            </div>
        </div>            
    </div>
    <!--Inicio de la Barra de Menu------------------------------------------------------------------------------------------>

    <!-- Inicio del Formulario Ingreso de Productos --------------------------------------------------------------------------------------------------  -->
    <div class="container-fluid miborde my-4 py-3 fondo">
        <form method="POST" action="ControlProductos"> 
            <div class="row align-items-center">

                <div class="col">
                    <label class="form-label fw-bold">Id</label>
                    <input type="text " class="form-control form-control-sm" id="codigoProducto " name="codigo_Producto" readonly="" value="<%out.println(consultaProducto.get(0).getId_Producto());%>">>
                </div>

                <div class="col">
                    <label class="form-label fw-bold">Medida</label>
                    <select class="form-select form-select-sm" aria-label="Default select example" name="medida_Unidad">
                        <option value="Unidad">Unidad</option>
                        <option value="Gramos">Gramos</option>
                        <option value="Libra">Libra</option>
                        <option value="Kilos">Kilos</option>
                        <option value="Bulto">Bulto</option>
                        <option value="Docena">Docena</option>
                        <option value="Paquete">Paquete</option>
                        <option value="Caja">Caja</option>

                        
                    </select>
                </div>    

                <div class="col">
                    <label class="form-label fw-bold">Seccion</label>
                    <select class="form-select form-select-sm" aria-label="Default select example" name="seccion">
                        <option value="Alimentos">Alimentos</option>
                        <option value="Ascesorios">Ascesorios</option>
                        <option value="Jugetes">Jugetes</option>
                        <option value="Ropa">Ropa</option>
                        <option value="Aseo">Aseo</option>
                              
                    </select>
                </div>                     

                <div class="col">
                    <label class="form-label fw-bold">Nombre</label>
                    <input type="text " class="form-control form-control-sm" id="nombreProducto"name="nombre_Producto" required="" value="<%out.println(consultaProducto.get(0).getNombre_Producto());%>">>
                </div>

                <div class="col">
                    <label class="form-label fw-bold">Proveedor</label>
                    <input type="text " class="form-control form-control-sm" id="nitProveedor" name="nit_Proveedor" required="" value="<%out.println(consultaProducto.get(0).getNit_Proveedor());%>">>
                </div>

                <div class="col">
                    <label class="form-label fw-bold">Compra</label>
                    <input type="text " class="form-control form-control-sm" id="precioCompra "  name="precio_Compra" required="" value="<%out.println(consultaProducto.get(0).getPrecio_Compra());%>">>
                </div>     

                <div class="col">
                    <label class="form-label fw-bold">Venta</label>
                    <input type="text " class="form-control form-control-sm " id="precioVenta "  name="precio_Venta" required=""         value="<%out.println(consultaProducto.get(0).getPrecio_Venta());%>">>
                </div>  

                <div class="col">
                    <label class="form-label fw-bold">Stok</label>
                    <input type="text " class="form-control form-control-sm" id="stock " name="stock" required=""         value="<%out.println(consultaProducto.get(0).getStock());%>"> >
                </div>

                <div class="col">
                    <label class="form-label fw-bold">Impuestos</label>
                    <input type="text " class="form-control form-control-sm" id="impuestos " name="impuestos" required=""        value="<%out.println(consultaProducto.get(0).getImpuestos());%>">>
                </div>       

                <div class="col">                        
                    <button class="btn btn-success btnSize" name="btnAccion" value="Actualizar">Actualizar Producto</button>    
                </div>                    
            </div> 
        </form> 
    </div> 
    <div class="container-fluid " id="piepagina">
        <div class="row text-center ">
            <div>
                <h3>Grupo de Formacion S46 subgrupo - 5</h3>
                <h6>Tienda Mascolonadia</h6>
            </div>
        </div>
    </div>
    <!-- Fin  Pie de Pagina ------------------------------------------------------------------------------------------------------------------------------------------------->


    <!--Enlace Boostrap-->
    <link rel="stylesheet " href="assets/js/bootstrap.js " />        
</body>
</html>
