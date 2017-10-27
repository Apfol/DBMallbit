/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mallbit.Categoria;

public class Categoria {
    
    private int idCategoria;
    private String tipoCategoria;

    public Categoria(int idCategoria, String tipoCategoria) {
        this.idCategoria = idCategoria;
        this.tipoCategoria = tipoCategoria;
    }

    public int getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }

    public String getTipoCategoria() {
        return tipoCategoria;
    }

    public void setTipoCategoria(String tipoCategoria) {
        this.tipoCategoria = tipoCategoria;
    }

    @Override
    public String toString() {
        return "Categoria{" + "idCategoria=" + idCategoria + ", tipoCategoria=" + tipoCategoria + '}';
    }
    
}
