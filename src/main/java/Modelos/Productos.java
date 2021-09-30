package Modelos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Productos {

    private int id_Producto;
    private String nombre_Producto;
    private String medida_Unidad;
    private double precio_Compra;
    private double precio_Venta;
    private int stock;
 
    public Productos() {

    }

    public int getId_Producto() {
        return id_Producto;
    }

    public String getNombre_Producto() {
        return nombre_Producto;
    }

    public String getMedida_Unidad() {
        return medida_Unidad;
    }

    public double getPrecio_Compra() {
        return precio_Compra;
    }

    public double getPrecio_Venta() {
        return precio_Venta;
    }

    public int getStock() {
        return stock;
    }

    public void setId_Producto(int id_Producto) {
        this.id_Producto = id_Producto;
    }

    public void setNombre_Producto(String nombre_Producto) {
        this.nombre_Producto = nombre_Producto;
    }

    public void setMedida_Unidad(String medida_Unidad) {
        this.medida_Unidad = medida_Unidad;
    }

    public void setPrecio_Compra(double precio_Compra) {
        this.precio_Compra = precio_Compra;
    }

    public void setPrecio_Venta(double precio_Venta) {
        this.precio_Venta = precio_Venta;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }
    
       public void crearProducto(){
        
        Conexion objConector = new Conexion(); 
        objConector.conectar();
        
        try {
            
            String sql = "INSERT INTO productos VALUES(?,?,?,?,?,?,null);";
            PreparedStatement stmt; 
            stmt = objConector.conn.prepareStatement(sql); 
          
           
            stmt.setInt(1, this.id_Producto);
            stmt.setDouble(2, this.precio_Compra);
            stmt.setDouble(3, this.precio_Venta);
            stmt.setString(4, this.nombre_Producto);
            stmt.setString(5, this.medida_Unidad);
            stmt.setInt(6, this.stock);        
            stmt.execute(); 
            
            objConector.desconectar();
            
        } catch (SQLException error) {
            System.out.println("Error Modelo: "+error);
        }
    }
    
    public void consultarProducto(){
        
    }
    
    public ResultSet listarProducto(){
        Conexion objConector = new Conexion(); 
        objConector.conectar();
        
        try {
            
            String sql = "SELECT * FROM productos; ";
            PreparedStatement stmt; 
            stmt = objConector.conn.prepareStatement(sql); 
            ResultSet consulta = stmt.executeQuery(); 
            objConector.desconectar();
            return consulta; 
            
        } catch (SQLException error) {
            System.out.println("Error Modelo: "+error);
        }
 
        return null;
        
    }
    
    public void actualizarProducto(){
        
    }
    
    public void eliminarProducto(){
        
    }
    
    
}
