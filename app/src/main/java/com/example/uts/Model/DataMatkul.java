package com.example.uts.Model;

public class DataMatkul {
    public String kodeMatkul;
    public String sesi;
    public String hari;
    public String jlhSks;

    public DataMatkul(String kodeMatkul, String sesi, String hari, String jlhSks) {
        this.kodeMatkul = kodeMatkul;
        this.sesi = sesi;
        this.hari = hari;
        this.jlhSks = jlhSks;
    }

    public String getKodeMatkul() {
        return kodeMatkul;
    }

    public void setKodeMatkul(String kodeMatkul) {
        this.kodeMatkul = kodeMatkul;
    }

    public String getSesi() {
        return sesi;
    }

    public void setSesi(String sesi) {
        this.sesi = sesi;
    }

    public String getHari() {
        return hari;
    }

    public void setHari(String hari) {
        this.hari = hari;
    }

    public String getJlhSks() {
        return jlhSks;
    }

    public void setJlhSks(String jlhSks) {
        this.jlhSks = jlhSks;
    }
}

