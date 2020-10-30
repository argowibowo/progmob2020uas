package com.example.uts.Model;

public class DataKelasModel {
    public String kodeMatkulKls;
    public String sesiKls;
    public String hariKls;
    public String dosenPengampuKls;
    public String jlhMhsKls;

    public DataKelasModel(String kodeMatkulKls, String sesiKls, String hariKls, String dosenPengampuKls, String jlhMhsKls) {
        this.kodeMatkulKls = kodeMatkulKls;
        this.sesiKls = sesiKls;
        this.hariKls = hariKls;
        this.dosenPengampuKls = dosenPengampuKls;
        this.jlhMhsKls = jlhMhsKls;
    }

    public String getKodeMatkulKls() {
        return kodeMatkulKls;
    }

    public void setKodeMatkulKls(String kodeMatkulKls) {
        this.kodeMatkulKls = kodeMatkulKls;
    }

    public String getSesiKls() {
        return sesiKls;
    }

    public void setSesiKls(String sesiKls) {
        this.sesiKls = sesiKls;
    }

    public String getHariKls() {
        return hariKls;
    }

    public void setHariKls(String hariKls) {
        this.hariKls = hariKls;
    }

    public String getDosenPengampuKls() {
        return dosenPengampuKls;
    }

    public void setDosenPengampuKls(String dosenPengampuKls) {
        this.dosenPengampuKls = dosenPengampuKls;
    }

    public String getJlhMhsKls() {
        return jlhMhsKls;
    }

    public void setJlhMhsKls(String jlhMhsKls) {
        this.jlhMhsKls = jlhMhsKls;
    }
}

