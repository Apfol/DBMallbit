package com.mallbit.genero;

public class Genero {

    public static final int GENERO_CLIENTE = 0;
    public static final int GENERO_VENDEDOR = 1;
    public static final int GENERO_ADMINISTRADOR = 2;

    private int idGenero;
    private String genero;

    public Genero(int idGenero, String genero) {
        this.idGenero = idGenero;
        this.genero = genero;
    }

    public Genero(String genero) {
        this.genero = genero;
    }

    public int getIdGenero() {
        return idGenero;
    }

    public void setIdGenero(int idGenero) {
        this.idGenero = idGenero;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    @Override
    public String toString() {
        return "Genero [idGenero=" + idGenero + ", genero=" + genero + "]";
    }

}
