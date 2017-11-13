/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mallbit.producto;

import java.sql.Date;

/**
 *
 * @author Andres Ramos
 */
public class ProductoEnviar {
    private String nombreCliente;
    private String nombreProducto;
    private Date fecha;
    private String direccion;
    private int idEnvio;

    public ProductoEnviar(String nombreCliente, String nombreProducto, Date fecha, String direccion, int idEnvio) {
        this.nombreCliente = nombreCliente;
        this.nombreProducto = nombreProducto;
        this.fecha = fecha;
        this.direccion = direccion;
        this.idEnvio = idEnvio;
    }

    public String getNombreCliente() {
        return nombreCliente;
    }

    public void setNombreCliente(String nombreCliente) {
        this.nombreCliente = nombreCliente;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getIdEnvio() {
        return idEnvio;
    }

    public void setIdEnvio(int idEnvio) {
        this.idEnvio = idEnvio;
    }
    
    
}
