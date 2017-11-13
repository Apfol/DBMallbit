/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mallbit.envio;

import java.sql.Date;

/**
 *
 * @author Andres Ramos
 */
public class Envio {
    private int id;
    private Date fechaEnvio;
    private String direccion;
    private int idEstado;
    private int idCompra;
    private int idVendedor;

    public Envio(int id, Date fechaEnvio, String direccion, int idEstado, int idCompra, int idVendedor) {
        this.id = id;
        this.fechaEnvio = fechaEnvio;
        this.direccion = direccion;
        this.idEstado = idEstado;
        this.idCompra = idCompra;
        this.idVendedor = idVendedor;
    }

    public Envio(Date fechaEnvio, String direccion, int idEstado, int idCompra, int idVendedor) {
        this.fechaEnvio = fechaEnvio;
        this.direccion = direccion;
        this.idEstado = idEstado;
        this.idCompra = idCompra;
        this.idVendedor = idVendedor;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getFechaEnvio() {
        return fechaEnvio;
    }

    public void setFechaEnvio(Date fechaEnvio) {
        this.fechaEnvio = fechaEnvio;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getIdEstado() {
        return idEstado;
    }

    public void setIdEstado(int idEstado) {
        this.idEstado = idEstado;
    }

    public int getIdCompra() {
        return idCompra;
    }

    public void setIdCompra(int idCompra) {
        this.idCompra = idCompra;
    }

    public int getIdVendedor() {
        return idVendedor;
    }

    public void setIdVendedor(int idVendedor) {
        this.idVendedor = idVendedor;
    }
}
