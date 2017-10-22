/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mallbit.premio;

/**
 *
 * @author Andres Ramos
 */
public class Premio {
    private int id;
    private String nombre;
    private String descripcion;
    private String NombreImagen;
    private int puntos;
    private int idAdminitrador;

    public Premio(int id, String nombre, String descripcion, String NombreImagen, int puntos, int idAdminitrador) {
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.NombreImagen = NombreImagen;
        this.puntos = puntos;
        this.idAdminitrador = idAdminitrador;
    }

    public Premio(String nombre, String descripcion, String NombreImagen, int puntos, int idAdminitrador) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.NombreImagen = NombreImagen;
        this.puntos = puntos;
        this.idAdminitrador = idAdminitrador;
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

    public String getNombreImagen() {
        return NombreImagen;
    }

    public void setNombreImagen(String NombreImagen) {
        this.NombreImagen = NombreImagen;
    }

    public int getPuntos() {
        return puntos;
    }

    public void setPuntos(int puntos) {
        this.puntos = puntos;
    }

    public int getIdAdminitrador() {
        return idAdminitrador;
    }

    public void setIdAdminitrador(int idAdminitrador) {
        this.idAdminitrador = idAdminitrador;
    }
    
    
}
