package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Modelos.Productos;
import java.sql.ResultSet;
import java.util.ArrayList;

@WebServlet(name = "ControlProductos", urlPatterns = {"/ControlProductos"})
public class ControlProductos extends HttpServlet {

    Productos objProducto = new Productos();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //-------------------------------------------------------------------------------------------------------------------------------------
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String accion = request.getParameter("btnAccion");
            System.out.println(accion);
            if (accion.equals("Insertar")) {

                String id_Producto = request.getParameter("id_Producto");
                System.out.println(id_Producto);
                String nombre_Producto = request.getParameter("nombre_Producto");
                System.out.println(nombre_Producto);
                String medida_Unidad = request.getParameter("medida_Unidad");
                System.out.println(medida_Unidad);
                String seccion = request.getParameter("seccion");
                System.out.println(seccion);
                int nit_Proveedor = Integer.parseInt(request.getParameter("nit_Proveedor"));
                System.out.println(nit_Proveedor);
                int precio_Compra = Integer.parseInt(request.getParameter("precio_Compra"));
                System.out.println(precio_Compra);
                int precio_Venta = Integer.parseInt(request.getParameter("precio_Venta"));
                System.out.println(precio_Venta);
                int stock = Integer.parseInt(request.getParameter("stock"));
                System.out.println(stock);
                int impuestos = Integer.parseInt(request.getParameter("impuestos"));
                System.out.println(impuestos);

                objProducto.setId_Producto(id_Producto);
                objProducto.setNombre_Producto(nombre_Producto);
                objProducto.setMedida_Unidad(medida_Unidad);
                objProducto.setSeccion(seccion);
                objProducto.setNit_Proveedor(nit_Proveedor);
                objProducto.setPrecio_Compra(precio_Compra);
                objProducto.setPrecio_Venta(precio_Venta);
                objProducto.setStock(stock);
                objProducto.setImpuestos(impuestos);

                objProducto.Crear_Producto();

                String mensaje = "<html> <body>"
                        + " <script type='text/javaScript'> "
                        + "      alert('Producto insertado con exito!'); "
                        + "      window.location.href='productos.jsp'"
                        + "</script> </body> </html>";

                out.println(mensaje);
            } else if (accion.equals("Actualizar")) {

                String id_Producto = request.getParameter("id_Producto");
                System.out.println(id_Producto);
                String nombre_Producto = request.getParameter("nombre_Producto");
                System.out.println(nombre_Producto);
                String medida_Unidad = request.getParameter("medida_Unidad");
                System.out.println(medida_Unidad);
                String seccion = request.getParameter("seccion");
                System.out.println(seccion);
                int nit_Proveedor = Integer.parseInt(request.getParameter("nit_Proveedor"));
                System.out.println(nit_Proveedor);
                int precio_Compra = Integer.parseInt(request.getParameter("precio_Compra"));
                System.out.println(precio_Compra);
                int precio_Venta = Integer.parseInt(request.getParameter("precio_Venta"));
                System.out.println(precio_Venta);
                int stock = Integer.parseInt(request.getParameter("stock"));
                System.out.println(stock);
                int impuestos = Integer.parseInt(request.getParameter("impuestos"));
                System.out.println(impuestos);

                objProducto.setId_Producto(id_Producto);
                objProducto.setNombre_Producto(nombre_Producto);
                objProducto.setMedida_Unidad(medida_Unidad);
                objProducto.setSeccion(seccion);
                objProducto.setNit_Proveedor(nit_Proveedor);
                objProducto.setPrecio_Compra(precio_Compra);
                objProducto.setPrecio_Venta(precio_Venta);
                objProducto.setStock(stock);
                objProducto.setImpuestos(impuestos);

                objProducto.Editar_Producto();

                String mensaje = "<html> <body>"
                        + " <script type='text/javaScript'> "
                        + "      alert('Producto actualizado con exito!'); "
                        + "      window.location.href='productos.jsp'"
                        + "</script> </body> </html>";

                out.println(mensaje);
                
            } else if (accion.equals("Eliminar")) {

                String id_Producto = request.getParameter("id_Producto");
                System.out.println(id_Producto);

                String respuesta = objProducto.Eliminar_Producto();

                if (respuesta == null) {

                    String mensaje = "<html> <body>"
                            + " <script type='text/javaScript'> "
                            + "      alert('Producto eliminado con exito!'); "
                            + "      window.location.href='productos.jsp'"
                            + "</script> </body> </html>";

                    out.println(mensaje);
                }
                    else {
       
                    String mensaje = "<html> <body>"
                            + " <script type='text/javaScript'> "
                            + "      alert('Error en la eliminación'); "
                            + "      window.location.href='productos.jsp'"
                            + "</script> </body> </html>";

                    out.println(mensaje);
                }
            }

        } catch (Exception error) {
            System.out.println("Error ControlProductos: " + error);
        }
        //--------------------------------------------------------------------------------------------------------------------------------------------
    }

    public ArrayList listar() {
        try {
            ResultSet consulta = objProducto.listarProducto();
            ArrayList<Productos> listaProducto = new ArrayList<>();

            while (consulta.next()) {

                objProducto = new Productos();

                objProducto.setId_Producto(consulta.getString(1));
                objProducto.setNombre_Producto(consulta.getString(2));
                objProducto.setMedida_Unidad(consulta.getString(3));
                objProducto.setSeccion(consulta.getString(4));
                objProducto.setNit_Proveedor(consulta.getInt(5));
                objProducto.setPrecio_Compra(consulta.getInt(6));
                objProducto.setPrecio_Venta(consulta.getInt(7));
                objProducto.setStock(consulta.getInt(8));
                objProducto.setImpuestos(consulta.getInt(9));

                listaProducto.add(objProducto);
            }

            return listaProducto;

        } catch (Exception error) {
            System.out.println("Error Controlador:" + error);
        }

        return null;
    }

    public ArrayList consultar(String id_Producto) {
        try {
            objProducto.setId_Producto(id_Producto);
            ResultSet consulta = objProducto.Consultar_Producto();
            ArrayList<Productos> listaProducto = new ArrayList<>();

            while (consulta.next()) {

                objProducto = new Productos();

                objProducto.setId_Producto(consulta.getString(1));
                objProducto.setNombre_Producto(consulta.getString(2));
                objProducto.setMedida_Unidad(consulta.getString(3));
                objProducto.setSeccion(consulta.getString(4));
                objProducto.setNit_Proveedor(consulta.getInt(5));
                objProducto.setPrecio_Compra(consulta.getInt(6));
                objProducto.setPrecio_Venta(consulta.getInt(7));
                objProducto.setStock(consulta.getInt(8));
                objProducto.setImpuestos(consulta.getInt(9));

                listaProducto.add(objProducto);
            }

            return listaProducto;

        } catch (Exception error) {
            System.out.println("Error Controlador:" + error);
        }

        return null;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
