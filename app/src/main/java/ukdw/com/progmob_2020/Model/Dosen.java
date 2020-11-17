package ukdw.com.progmob_2020.Model;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class Dosen {
    @SerializedName("id")
    @Expose
    private String id;

    @SerializedName("nama")
    @Expose
    private String nama;

    @SerializedName("nidn")
    @Expose
    private String nidn;

    @SerializedName("alamat")
    @Expose
    private String alamat;

    @SerializedName("email")
    @Expose
    private String email;

    @SerializedName("gelar")
    @Expose
    private String gelar;

    @SerializedName("foto")
    @Expose
    private String foto;

    @SerializedName("nim_progmob")
    @Expose
    private String nim_progmob;

    public Dosen(String id, String nama, String nidn, String alamat, String email, String gelar, String foto, String nim_progmob) {
        this.id = id;
        this.nama = nama;
        this.nidn = nidn;
        this.alamat = alamat;
        this.email = email;
        this.gelar = gelar;
        this.foto = foto;
        this.nim_progmob = nim_progmob;
    }

    public Dosen(String nama, String nidn, String alamat, String email, String gelar, String foto, String nim_progmob) {
        this.nama = nama;
        this.nidn = nidn;
        this.alamat = alamat;
        this.email = email;
        this.gelar = gelar;
        this.foto = foto;
        this.nim_progmob = nim_progmob;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public String getNidn() {
        return nidn;
    }

    public void setNidn(String nidn) {
        this.nidn = nidn;
    }

    public String getAlamat() {
        return alamat;
    }

    public void setAlamat(String alamat) {
        this.alamat = alamat;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGelar() {
        return gelar;
    }

    public void setGelar(String gelar) {
        this.gelar = gelar;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public String getNim_progmob() {
        return nim_progmob;
    }

    public void setNim_progmob(String nim_progmob) {
        this.nim_progmob = nim_progmob;
    }

}
