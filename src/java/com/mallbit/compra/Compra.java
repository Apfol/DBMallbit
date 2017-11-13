package com.mallbit.compra;

import java.sql.Date;

public class Compra {
    
    private int id;
    private Date fecha;
    private int idCliente;
    private int idProducto;
    private int idVendedor;
    private Long numeroTarjeta;
    private int cvv;

    public Compra(int id, Date fecha, int idCliente, int idProducto, int idVendedor, Long numeroTarjeta, int cvv) {
        this.id = id;
        this.fecha = fecha;
        this.idCliente = idCliente;
        this.idProducto = idProducto;
        this.idVendedor = idVendedor;
        this.numeroTarjeta = numeroTarjeta;
        this.cvv = cvv;
    }

    public Compra(Date fecha, int idCliente, int idProducto, int idVendedor, Long numeroTarjeta, int cvv) {
        this.fecha = fecha;
        this.idCliente = idCliente;
        this.idProducto = idProducto;
        this.idVendedor = idVendedor;
        this.numeroTarjeta = numeroTarjeta;
        this.cvv = cvv;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public int getIdVendedor() {
        return idVendedor;
    }

    public void setIdVendedor(int idVendedor) {
        this.idVendedor = idVendedor;
    }

    public Long getNumeroTarjeta() {
        return numeroTarjeta;
    }

    public void setNumeroTarjeta(Long numeroTarjeta) {
        this.numeroTarjeta = numeroTarjeta;
    }

    public int getCVV() {
        return cvv;
    }

    public void setCVV(int cvv) {
        this.cvv = cvv;
    }
    
    
    
}
