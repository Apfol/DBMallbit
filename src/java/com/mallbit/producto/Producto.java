/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mallbit.producto;

public class Producto {
    
    private int id;
    private String nombre;
    private int precio;
    private String marca;
    private int idLocal;
    private String descripcion;
    private String nombreImagen;
    private int stock;
    private int puntos;

    public Producto(int id, String nombre, int precio, String marca, int idLocal, String descripcion, String nombreImagen, int stock, int puntos) {
        this.id = id;
        this.nombre = nombre;
        this.precio = precio;
        this.marca = marca;
        this.idLocal = idLocal;
        this.descripcion = descripcion;
        this.nombreImagen = nombreImagen;
        this.stock = stock;
        this.puntos = puntos;
    }

    public Producto(String nombre, int precio, String marca, int idLocal, String descripcion, String nombreImagen, int stock, int puntos) {
        this.nombre = nombre;
        this.precio = precio;
        this.marca = marca;
        this.idLocal = idLocal;
        this.descripcion = descripcion;
        this.nombreImagen = nombreImagen;
        this.stock = stock;
        this.puntos = puntos;
    }

    public int getPuntos() {
        return puntos;
    }

    public void setPuntos(int puntos) {
        this.puntos = puntos;
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

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public int getIdLocal() {
        return idLocal;
    }

    public void setIdLocal(int idLocal) {
        this.idLocal = idLocal;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getNombreImagen() {
        return nombreImagen;
    }

    public void setNombreImagen(String nombreImagen) {
        this.nombreImagen = nombreImagen;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    @Override
    public String toString() {
        return "Producto{" + "id=" + id + ", nombre=" + nombre + ", precio=" + precio + ", marca=" + marca + ", idLocal=" + idLocal + ", descripcion=" + descripcion + ", nombreImagen=" + nombreImagen + ", stock=" + stock + '}';
    }
    
    
    
}
