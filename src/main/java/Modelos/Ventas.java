package Modelos;

public class Ventas {
    
    private Productos producto_Vebta;
    private int cantidad;
    private double descuento;
    private double total_Venta;
    private Clientes cliente_Venta;

    public Ventas() {
    }

    public Productos getProducto_Vebta() {
        return producto_Vebta;
    }

    public void setProducto_Vebta(Productos producto_Vebta) {
        this.producto_Vebta = producto_Vebta;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getDescuento() {
        return descuento;
    }

    public void setDescuento(double descuento) {
        this.descuento = descuento;
    }

    public double getTotal_Venta() {
        return total_Venta;
    }

    public void setTotal_Venta(double total_Venta) {
        this.total_Venta = total_Venta;
    }

    public Clientes getCliente_Venta() {
        return cliente_Venta;
    }

    public void setCliente_Venta(Clientes cliente_Venta) {
        this.cliente_Venta = cliente_Venta;
    }
    
    public void Crear_Venta(){
    
    }
    public void Consultar_Venta(){
    
    }
    public void Editar_Venta(){
    
    }
    public void Eliminar_Venta(){
    
    }
    public void Generar_Factura(){
    
    }
}
