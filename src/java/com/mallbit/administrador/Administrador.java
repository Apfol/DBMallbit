/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mallbit.administrador;

import java.util.Date;

/**
 *
 * @author Andres Ramos
 */
public class Administrador {
    
    public static final String ADMINISTRADOR_COOKIE = "administrador";
    
    private int id;
    private String nombre;
    private String apellido;
    private String correo;
    private long identificacion;
    private long telefono;
    private String usuario;
    private String contraseña;
    private Date fechaNacimiento;
    private int idGenero;

    public Administrador(int id, String nombre, String apellido, String correo, long identificacion, long telefono, String usuario, String contraseña, Date fechaNacimiento, int idGenero) {
        this.id = id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.correo = correo;
        this.identificacion = identificacion;
        this.telefono = telefono;
        this.usuario = usuario;
        this.contraseña = contraseña;
        this.fechaNacimiento = fechaNacimiento;
        this.idGenero = idGenero;
    }

    public Administrador(String nombre, String apellido, String correo, long identificacion, long telefono, String usuario, String contraseña, Date fechaNacimiento, int idGenero) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.correo = correo;
        this.identificacion = identificacion;
        this.telefono = telefono;
        this.usuario = usuario;
        this.contraseña = contraseña;
        this.fechaNacimiento = fechaNacimiento;
        this.idGenero = idGenero;
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

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public long getIdentificacion() {
        return identificacion;
    }

    public void setIdentificacion(long identificacion) {
        this.identificacion = identificacion;
    }

    public long getTelefono() {
        return telefono;
    }

    public void setTelefono(long telefono) {
        this.telefono = telefono;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public int getIdGenero() {
        return idGenero;
    }

    public void setIdGenero(int idGenero) {
        this.idGenero = idGenero;
    }
    
    
}
