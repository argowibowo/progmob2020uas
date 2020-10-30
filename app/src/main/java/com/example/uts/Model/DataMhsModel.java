package com.example.uts.Model;

import com.google.gson.annotations.SerializedName;

public class DataMhsModel {
    @SerializedName("nim")
    private String nim;
    @SerializedName("nama")
    private String nama;
    @SerializedName("alamat")
    private String alamat;
    @SerializedName("email")
    private String email;
    @SerializedName("foto")
    private  String foto;
    /*public String nimNama;
    public String Alamat;
    public String email;*/

    public DataMhsModel(String nim, String alamat, String email, String nama, String foto) {
        this.nim = nim;
        this.nama = nama;
        this.alamat = alamat;
        this.email = email;
        this.foto = foto;
    }
    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto){
        this.foto = foto;
    }

    public String getNim() {
        return nim;
    }

    public void setNim(String nim) {
        this.nim = nim;
    }
    public String getNama() {
        return nama;
    }

    public String setNama(String nama) {
        return nama;
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
        this.email = email;
    }
}

