/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelos.Productos;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author A_Montoya
 */
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

        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String accion = request.getParameter("btnAccion"); 
            System.out.println(accion);
            if(accion.equals("Insertar")){
                              
                int id_Producto = Integer.parseInt(request.getParameter("codigo_Producto")); 
                String nombre_Producto = request.getParameter("nombre_Producto"); 
                String medida_Unidad = request.getParameter("medida_Unidad");
                Double precio_Compra = Double.parseDouble(request.getParameter("precio_Compra"));
                Double precio_Venta = Double.parseDouble(request.getParameter("precio_Venta"));                
                int stock = Integer.parseInt(request.getParameter("stock")); 
                
                objProducto.setId_Producto(id_Producto);
                objProducto.setNombre_Producto(nombre_Producto);
                objProducto.setMedida_Unidad(medida_Unidad);
                objProducto.setPrecio_Compra(precio_Compra);
                objProducto.setPrecio_Venta(precio_Venta);
                objProducto.setStock(stock);                
                
                objProducto.crearProducto();
                
                String mensaje = "<html> <body>"+
                                 " <script type='text/javaScript'> "+
                                 "      alert('Producto insertado correctamente!'); "+
                                 "      window.location.href='productos.jsp'"+
                                 "</script> </body> </html>"; 
                
                out.println(mensaje);
            }
        }
        catch(Exception error){
            System.out.println("Error Controlador: "+ error);
        }
    }
    
    public ArrayList listar(){
        try {
            ResultSet consulta = objProducto.listarProducto(); 
            ArrayList<Productos> listaProducto = new ArrayList<>(); 
            
            while(consulta.next()){

                objProducto = new Productos(); 
                
                
                objProducto.setId_Producto(consulta.getInt(1));
                objProducto.setNombre_Producto(consulta.getString(2));
                objProducto.setMedida_Unidad(consulta.getNString(3));
                objProducto.setPrecio_Compra(consulta.getDouble(4));
                objProducto.setPrecio_Venta(consulta.getDouble(5));
                objProducto.setStock(consulta.getInt(6));            
                
 
                listaProducto.add(objProducto); 
            }
            
            return listaProducto; 
            
        } catch (SQLException error) {
            System.out.println("Error Controlador:" + error);
        }
 
        return null;
    }
    
}
