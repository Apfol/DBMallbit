/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mallbit.pago;

/**
 *
 * @author Andres Ramos
 */
public class Pago {
    
    private int id;
    private Long numeroTarjeta;
    private int cvv;

    public Pago(int id, Long numeroTarjeta, int cvv) {
        this.id = id;
        this.numeroTarjeta = numeroTarjeta;
        this.cvv = cvv;
    }

    public Pago(Long numeroTarjeta, int cvv) {
        this.numeroTarjeta = numeroTarjeta;
        this.cvv = cvv;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Long getNumeroTarjeta() {
        return numeroTarjeta;
    }

    public void setNumeroTarjeta(Long numeroTarjeta) {
        this.numeroTarjeta = numeroTarjeta;
    }

    public int getCvv() {
        return cvv;
    }

    public void setCvv(int cvv) {
        this.cvv = cvv;
    }
    
    
    
    
}
