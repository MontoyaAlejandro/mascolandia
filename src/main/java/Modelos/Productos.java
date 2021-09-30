package Modelos;

import java.sql.PreparedStatement;

public class Productos {

    private String id_Producto;
    private String nombre_Producto;
    private String medida_Unidad;
    private String seccion;
    private int nit_Proveedor;
    private int precio_Compra;
    private int precio_Venta;
    private int stock;
    private int impuestos;

    // Constructor Vacio------------------------------------------------------
    public Productos() {

    }

    // Inicio Getter and Setters ---------------------------------------------

    public String getId_Producto() {
        return id_Producto;
    }

    public void setId_Producto(String id_Producto) {
        this.id_Producto = id_Producto;
    }

    public String getNombre_Producto() {
        return nombre_Producto;
    }

    public void setNombre_Producto(String nombre_Producto) {
        this.nombre_Producto = nombre_Producto;
    }

    public String getMedida_Unidad() {
        return medida_Unidad;
    }

    public void setMedida_Unidad(String medida_Unidad) {
        this.medida_Unidad = medida_Unidad;
    }

    public String getSeccion() {
        return seccion;
    }

    public void setSeccion(String seccion) {
        this.seccion = seccion;
    }

    public int getNit_Proveedor() {
        return nit_Proveedor;
    }

    public void setNit_Proveedor(int nit_Proveedor) {
        this.nit_Proveedor = nit_Proveedor;
    }

    public int getPrecio_Compra() {
        return precio_Compra;
    }

    public void setPrecio_Compra(int precio_Compra) {
        this.precio_Compra = precio_Compra;
    }

    public int getPrecio_Venta() {
        return precio_Venta;
    }

    public void setPrecio_Venta(int precio_Venta) {
        this.precio_Venta = precio_Venta;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getImpuestos() {
        return impuestos;
    }

    public void setImpuestos(int impuestos) {
        this.impuestos = impuestos;
    }
    

    // Fin Getter and Setters ------------------------------------------
    
    // Metodos de clase
    //-----------------------------------------------------------------------------------------------------------------------
    public void Crear_Producto() {

        Conexion objConector = new Conexion();
        objConector.conectar();

        try {
            
            String sql = "INSERT INTO productos VALUES(?,?,?,?,?,?,?,?,?);";
            PreparedStatement stmt;
            stmt = objConector.conn.prepareStatement(sql);
            stmt.setString(1, this.id_Producto);
            stmt.setString(2, this.seccion);            
            stmt.setString(3, this.nombre_Producto);
            stmt.setString(4, this.medida_Unidad);           
            stmt.setInt(5, this.precio_Compra);
            stmt.setInt(6, this.precio_Venta);
            stmt.setInt(7, this.stock);
            stmt.setInt(8, this.nit_Proveedor);
            stmt.setInt(9, this.impuestos);

            stmt.execute();

            objConector.desconectar();
            
        } catch (Exception error) {
            System.out.println("Error ModeloProductos: " + error);
        }

    }
    
    //----------------------------------------------------------------------------------------------------------------------------

    public void Consultar_Producto() {

    }

    public void Editar_Producto() {

    }

    public void Eliminar_Producto() {

    }

    public void Ingresar_Producto() {

    }

    public void Generar_Pedido() {

    }

    public void Generar_Informe() {

    }

}
