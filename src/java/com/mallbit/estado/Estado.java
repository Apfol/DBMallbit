/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mallbit.estado;

/**
 *
 * @author Andres Ramos
 */
public class Estado {
    private int id;
    private String tipoEstado;

    public Estado(int id, String tipoEstado) {
        this.id = id;
        this.tipoEstado = tipoEstado;
    }

    public Estado(String tipoEstado) {
        this.tipoEstado = tipoEstado;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTipoEstado() {
        return tipoEstado;
    }

    public void setTipoEstado(String tipoEstado) {
        this.tipoEstado = tipoEstado;
    }
    
    
}
