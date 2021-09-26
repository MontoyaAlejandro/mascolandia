package Modelos;

public class Productos {
    
    private String id_Producto;
    private String nombre_Producto;
    private String medida_Unidad;
    private String seccion;
    private Proveedores proveedor;
    private Double precio_Compra;
    private Double predio_Venta;
    private int stock;
    private double impuestos;

    public Productos() {
    }

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

    public Proveedores getProveedor() {
        return proveedor;
    }

    public void setProveedor(Proveedores proveedor) {
        this.proveedor = proveedor;
    }

    public Double getPrecio_Compra() {
        return precio_Compra;
    }

    public void setPrecio_Compra(Double precio_Compra) {
        this.precio_Compra = precio_Compra;
    }

    public Double getPredio_Venta() {
        return predio_Venta;
    }

    public void setPredio_Venta(Double predio_Venta) {
        this.predio_Venta = predio_Venta;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public double getImpuestos() {
        return impuestos;
    }

    public void setImpuestos(double impuestos) {
        this.impuestos = impuestos;
    }
    
   // Metodos de clase
    
    public void Crear_Producto(){
    
    
    }
    
        public void Consultar_Producto(){
    
    
    }
            public void Editar_Producto(){
    
    
    }
             public void Eliminar_Producto(){
    
    
    }
             public void Ingresar_Producto(){
    
    
    }
             public void Generar_Pedido(){
    
    
    }
             public void Generar_Informe(){
    
    
    }
    
    
}
