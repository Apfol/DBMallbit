/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mallbit.local;


/**
 *
 * @author Andres Ramos
 */
public class Local {
    
    private int id;
    private String nombre;
    private String descripcion;
    private int idVendedor;
    private int idCategoria;
    private String nombreImagen1;
    private String nombreImagen2;

    public Local(int id, String nombre, String descripcion, String nombreImagenPrimaria, String nombreImagenSecundaria) {
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.nombreImagen1 = nombreImagenPrimaria;
        this.nombreImagen2 = nombreImagenSecundaria;
    }

    public Local(String nombre, String descripcion, String nombreImagenPrimaria, String nombreImagenSecundaria) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.nombreImagen1 = nombreImagenPrimaria;
        this.nombreImagen2 = nombreImagenSecundaria;
    }

    public Local(int id, String nombre, String descripcion, int idVendedor, int idCategoria, String nombreImagenPrimaria, String nombreImagenSecundaria) {
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.idVendedor = idVendedor;
        this.idCategoria = idCategoria;
        this.nombreImagen1 = nombreImagenPrimaria;
        this.nombreImagen2 = nombreImagenSecundaria;
    }

    public int getIdVendedor() {
        return idVendedor;
    }

    public void setIdVendedor(int idVendedor) {
        this.idVendedor = idVendedor;
    }

    public int getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getNombreImagenPrimaria() {
        return nombreImagen1;
    }

    public void setNombreImagenPrimaria(String nombreImagenPrimaria) {
        this.nombreImagen1 = nombreImagenPrimaria;
    }

    public String getNombreImagenSecundaria() {
        return nombreImagen2;
    }

    public void setNombreImagenSecundaria(String nombreImagenSecundaria) {
        this.nombreImagen2 = nombreImagenSecundaria;
    }
    
    
}
