<%@page import="Controlador.ControlProductos"%>
<%@page import="Modelos.Productos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="static/css/bootstrap.css" />
        <link rel="stylesheet" href="assets/css/misestilos.css" />
        <title>Document</title>
    </head>

    <body>

        <!--Inicio de la Cabecera------------------------------------------------------------------------------------------>
        <div class="container-fluid " id="cabecera">
            <div class="row">
                <div class="col-4">
                    <img src="static/imagenes/logo.png" id="logo">
                </div>
                <div class="col-6 text-start">
                    <br>
                    <h1 class="sombras">MASCOLANDIA</h1>
                    <h3>Esta es la casa de tu mejor amigo!</h3>
                </div>
            </div>
        </div>
        <!--Inicio de la Cabecera------------------------------------------------------------------------------------------>

        <!--Inicio de la Barra de Menu------------------------------------------------------------------------------------------>
        <div class="container-fluid miborde py-2 fondo">
            <div class="row">
                <div class="col-12">
                    <center>
                        <button type="button" class="btn btn-info miboton btnSize">Inicio</button>               
                        <button type="button" class="btn btn-info miboton btnSize">Productos</button>              
                        <button type="button" class="btn btn-info miboton btnSize">Ventas</button>               
                        <button type="button" class="btn btn-info miboton btnSize">Clientes</button>              
                        <button type="button" class="btn btn-info miboton btnSize">Salir</button>
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
                        <label class="form-label">Id</label>
                        <input type="text " class="form-control " id="codigoProducto " name="codigo_Producto" required="">
                    </div>

                    <div class="col">
                        <label class="form-label">Medida</label>
                        <select class="form-select" aria-label="Default select example" name="medida_Unidad">
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
                        <label class="form-label">Seccion</label>
                        <select class="form-select" aria-label="Default select example" name="seccion">
                            <option value="Alimentos">Alimentos</option>
                            <option value="Ascesorios">Ascesorios</option>
                            <option value="Jugetes">Jugetes</option>
                            <option value="Ropa">Ropa</option>
                            <option value="Aseo">Aseo</option>
                        </select>
                    </div>                     

                    <div class="col">
                        <label class="form-label">Nombre</label>
                        <input type="text " class="form-control " id="nombreProducto"name="nombre_Producto" required="">
                    </div>

                    <div class="col">
                        <label class="form-label">Proveedor</label>
                        <input type="number " class="form-control " id="nitProveedor" name="nit_Proveedor" required="">
                    </div>

                    <div class="col">
                        <label class="form-label">Compra</label>
                        <input type="number " class="form-control " id="precioCompra "  name="precio_Compra" required="">
                    </div>     

                    <div class="col">
                        <label class="form-label">Venta</label>
                        <input type="number " class="form-control " id="precioVenta "  name="precio_Venta" required="">
                    </div>  

                    <div class="col">
                        <label class="form-label">Stok</label>
                        <input type="number " class="form-control " id="stock " name="stock" required="">
                    </div>

                    <div class="col">
                        <label class="form-label">Impuestos</label>
                        <input type="number " class="form-control " id="impuestos " name="impuestos" required="">
                    </div>       

                    <div class="col">                        
                        <button class="btn btn-success btnSize" name="btnAccion" value="Insertar">Insertar Producto</button>    
                    </div>                    
                </div> 
            </form> 
        </div> 
        <!-- Inicio del Formulario Ingreso de Productos --------------------------------------------------------------------------------------------------  -->
        
        <!--Inicio de la tabla ------------------------------------------------------------------------------------------------------------------------------->
        <div class="container-fluid mitabla my-4 px-4">
            <table class="table table-hover ">
                <thead>
                    <tr>
                        <th scope="col ">ID</th>
                        <th scope="col ">MEDIDA</th>
                        <th scope="col ">SECCIÓN</th>
                        <th scope="col ">NOMBRE</th>
                        <th scope="col ">PROVEEDOR</th>
                        <th scope="col ">COMPRA</th>
                        <th scope="col ">VENTA</th>
                        <th scope="col ">STOC</th>
                        <th scope="col ">IMPUESTO</th>
                        <th scope="col ">ACCIÓN</th>
                    </tr>
                </thead>                                  
                <%
                    ArrayList<Productos> listaProducto = new ArrayList<>();
                    ControlProductos ctrProducto = new ControlProductos();
                    listaProducto = ctrProducto.listar();
                    for (int i = 0; i < listaProducto.size(); i++) {
                %>                       
                <tbody>
                    <tr>
                        <td><%=listaProducto.get(i).getId_Producto()%></td>
                        <td><%=listaProducto.get(i).getMedida_Unidad()%></td>
                        <td><%=listaProducto.get(i).getSeccion()%></td>
                        <td><%=listaProducto.get(i).getNombre_Producto()%></td>
                        <td><%=listaProducto.get(i).getNit_Proveedor()%></td>
                        <td><%=listaProducto.get(i).getPrecio_Compra()%></td>
                        <td><%=listaProducto.get(i).getPrecio_Venta()%></td>
                        <td><%=listaProducto.get(i).getStock()%></td>
                        <td><%=listaProducto.get(i).getImpuestos()%></td>        
                        <td>                      
                            <a href="actualizar.jsp?codigoProducto=<%=listaProducto.get(i).getId_Producto()%>"><button type="button" class="btn btn-outline-success btn-sm ">Actualizar</button></a>                                    
                            <a href="ControlProducto?codigoProducto=<%=listaProducto.get(i).getId_Producto()%>"><button type="button" class="btn btn-outline-danger btn-sm ">Eliminar</button></a>

                        </td>
                    </tr> 
                    <%}%>
                </tbody>
            </table>
        </div>
        <!--Pie de Pagina -->
        <div class="container-fluid " id="piepagina">
            <div class="row text-center ">
                <div>
                    <h3>Grupo de Formacion S46 subgrupo - 5</h3>
                    <h6>Tienda Mascolonadia</h6>
                </div>
            </div>
        </div>
        <!--Enlace Boostrap-->
        <link rel="stylesheet " href="static/js/bootstrap.js " />
    </body>

</html>