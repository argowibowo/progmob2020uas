package com.example.uts.Model;

import com.google.gson.annotations.SerializedName;

public class DataDosenModel {
    @SerializedName("nidn")
    private String nidn;
    @SerializedName("nama")
    private String nama;
    @SerializedName("gelar")
    private String gelar;
    @SerializedName("alamat")
    private String alamat;
    @SerializedName("email")
    private String email;
    @SerializedName("foto")
    private String foto;
    /*@SerializedName("id")*/
    /*public String foto;
    public String nidn;
    public String nama;
    public String gelar;
    public String alamat;
    public String email;*/

    public DataDosenModel(String nidn, String gelar, String alamat, String email, String foto, String nama) {
        this.nidn = nidn;
        this.gelar = gelar;
        this.alamat = alamat;
        this.email = email;
        this.foto = foto;
        this.nama = nama;
    }

    public String getNidn() {
        return nidn;
    }

    public void setNidn(String nidn) {
        this.nidn = nidn;
    }

    public String getNama(){
        return nama;
    }

    public void setNama(String nama){
        this.nama = nama;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public String getGelar() {
        return gelar;
    }

    public void setGelar(String gelar) {
        this.gelar = gelar;
    }

    public String getAlamat() {
        return alamat;
    }

    public void setAlamat(String alamat) {
        alamat = alamat;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        email = email;
    }
}

