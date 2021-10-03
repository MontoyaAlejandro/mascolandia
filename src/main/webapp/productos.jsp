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
        <link rel="stylesheet" href="assets/css/bootstrap.css" />
        <link rel="stylesheet" href="assets/css/misestilos.css" />
        <title>Document</title>
    </head>

    <body>

        <script type="text/javascript">
            function confirmar() {
                var respuesta = confirm("Esta seguro que quiere borrar el producto?");
                if (respuesta === true) {
                    return true;
                } else {
                    return false;
                }
            }

        </script>

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
                        <input type="text " class="form-control form-control-sm" id="codigoProducto " name="codigo_Producto" required="">
                    </div>

                    <div class="col">
                        <label class="form-label fw-bold">Medida</label>
                        <select class="form-select form-select-sm" aria-label="Default select example" name="medida_Unidad" required="">
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
                        <select class="form-select form-select-sm" aria-label="Default select example" name="seccion" required="">
                            <option value="Alimentos">Alimentos</option>
                            <option value="Ascesorios">Ascesorios</option>
                            <option value="Jugetes">Jugetes</option>
                            <option value="Ropa">Ropa</option>
                            <option value="Aseo">Aseo</option>
                        </select>
                    </div>                     

                    <div class="col">
                        <label class="form-label fw-bold">Nombre</label>
                        <input type="text " class="form-control form-control-sm" id="nombreProducto"name="nombre_Producto" required="">
                    </div>

                    <div class="col">
                        <label class="form-label fw-bold">Proveedor</label>
                        <input type="number " class="form-control form-control-sm" id="nitProveedor" name="nit_Proveedor" required="">
                    </div>

                    <div class="col">
                        <label class="form-label fw-bold">Compra</label>
                        <input type="number " class="form-control form-control-sm" id="precioCompra "  name="precio_Compra" required="">
                    </div>     

                    <div class="col">
                        <label class="form-label fw-bold">Venta</label>
                        <input type="number " class="form-control form-control-sm " id="precioVenta "  name="precio_Venta" required="">
                    </div>  

                    <div class="col">
                        <label class="form-label fw-bold">Stok</label>
                        <input type="number " class="form-control form-control-sm" id="stock " name="stock" required="">
                    </div>

                    <div class="col">
                        <label class="form-label fw-bold">Impuestos</label>
                        <input type="number " class="form-control form-control-sm" id="impuestos " name="impuestos" required="">
                    </div>       

                    <div class="col">                        
                        <button class="btn btn-success btnSize" name="btnAccion" value="Insertar">Insertar Producto</button>    
                    </div>                    
                </div> 
            </form> 
        </div> 
        <!-- Inicio del Formulario Ingreso de Productos --------------------------------------------------------------------------------------------------  -->

        <!--Inicio de la tabla ------------------------------------------------------------------------------------------------------------------------------->
        <div class="container-fluid miborde my-4 px-5">
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
                            <a href="ControlProductos?id_Producto=<%=listaProducto.get(i).getId_Producto()%>&btnAccion=Eliminar"><button type="button" class="btn btn-outline-danger btn-sm" onclick = "return confirmar();">Eliminar</button></a>

                        </td>
                    </tr> 
                    <%}%>
                </tbody>
            </table>
        </div>
        <!--  Fin de la tabla -------------------------------------------------------------------------------------------------------------------------------------------------->

        <!-- Inicio Pie de Pagina ---------------------------------------------------------------------------------------------------------------------------------------------->
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