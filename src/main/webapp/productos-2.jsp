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
        <!--Cabecera-->
        <div class="container-fluid " id="cabecera">
            <div class="row">
                <div class="col-3">
                    <img src="static/imagenes/logo.png" id="logo">
                </div>
                <div class="col-7 text-start">
                    <br>
                    <h1 class="sombras">MASCOLANDIA</h1>
                    <h3>Esta es la casa de tu mejor amigo!</h3>
                </div>
            </div>
        </div>
        <!--Contenido-->
        <div class="container-fluid">
            <div class="row">
                <div class="col-2 px-5">
                    <div class="row">
                        <button type="button" class="btn btn-dark miboton">Inicio</button>
                    </div>
                    <div class="row">
                        <button type="button" class="btn btn-dark miboton">Productos</button>
                    </div>
                    <div class="row">
                        <button type="button" class="btn btn-dark miboton">Ventas</button>
                    </div>
                    <div class="row">
                        <button type="button" class="btn btn-dark miboton">Clientes</button>
                    </div>
                    <div class="row">
                        <button type="button" class="btn btn-dark miboton">Informes</button>
                    </div>
                    <div class="row">
                        <button type="button" class="btn btn-dark miboton">Salir</button>
                    </div>
                </div>

                <section class="col-10 fondo">
                    <form method="POST" action="ControlProductos">
                        <!--inicio Contenido-->
                        <h3 class=" text-center text-success ">Gestion de Productos</h3>
                        <div class="row ">
                            <!--formulario izquierda-->
                            <div class="col-2 ">
                            </div>
                            <div class="col-3 ">
                                <div class="form-floating mimargen ">
                                    <input type="text " class="form-control " id="codigoProducto " placeholder="Codigo Producto " name="codigo_Producto" required="">
                                    <label for="floatingInput ">Codigo de Producto:</label>
                                </div>                                 
                                <div class="form-floating mimargen ">
                                    <select class="form-select " id="unidades " aria-label="Floating label select example" name="medida_Unidad">
                                        <option value="Unidad">Unidad</option>
                                        <option value="Gramos">Gramos</option>
                                        <option value="Libra">Libra</option>
                                        <option value="Kilos">Kilos</option>
                                        <option value="Bulto">Bulto</option>
                                        <option value="Docena">Docena</option>
                                        <option value="Paquete">Paquete</option>
                                        <option value="Caja">Caja</option>
                                    </select>
                                    <label for="floatingSelect ">Unidad de Medida</label>
                                </div>                               
                                <div class="form-floating mimargen ">
                                    <select class="form-select " id="seccion " aria-label="Floating label select example" name="seccion">
                                        <option value="Alimentos">Alimentos</option>
                                        <option value="Ascesorios">Ascesorios</option>
                                        <option value="Jugetes">Jugetes</option>
                                        <option value="Ropa">Ropa</option>
                                        <option value="Aseo">Aseo</option>
                                    </select>
                                    <label for="floatingSelect ">Seccion</label>
                                </div>
                            </div>
                            <!--formulario centro-->
                            <div class="col-3 ">
                                <div class=" form-floating mimargen ">
                                    <input type="text " class="form-control " id="nombreProducto " placeholder="Nombre Producto " name="nombre_Producto" required="">
                                    <label for="floatingInput ">Nombre de Producto:</label>
                                </div>
                                <div class="form-floating mimargen ">
                                    <input type="number " class="form-control " id="nitProveedor " placeholder="Nit Proveedor " name="nit_Proveedor" required="">
                                    <label for="floatingInput ">Nit del Proeevor:</label>
                                </div>
                                <div class="form-floating mimargen ">
                                    <input type="number " class="form-control " id="stock " placeholder="Stock " name="stock" required="">
                                    <label for="floatingInput ">Stok de Produto:</label>
                                </div>
                            </div>
                            <!--formulario izquierda-->
                            <div class="col-3 ">
                                <div class="form-floating mimargen ">
                                    <input type="number " class="form-control " id="precioCompra " placeholder="Precio Compra " name="precio_Compra" required="">
                                    <label for="floatingInput ">Precio de Compra:</label>
                                </div>
                                <div class="form-floating mimargen ">
                                    <input type="number " class="form-control " id="precioVenta " placeholder="Precio Venta " name="precio_Venta" required="">
                                    <label for="floatingInput ">Precio de Venta:</label>
                                </div>
                                <div class="form-floating mimargen ">
                                    <input type="number " class="form-control " id="impuestos " placeholder="Impuestos" name="impuestos" required="">
                                    <label for="floatingInput ">Porcentaaje de Impuestos:</label>
                                </div>
                            </div>

                            <div class="col-1 "></div>
                        </div>
                        <div class="row align-bottom center">
                            <center>
                                <button class="btn btn-success btnSize my-4" name="btnAccion" value="Insertar">Insertar Producto</button>
                            </center>
                        </div>
                    </form>
                </section>
                <!--fin del Contenido-->        
                <div class="container-fluid mitabla ">
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
                                <th scope="col ">IMPUESTOS</th>
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
            </div>
        </div>
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