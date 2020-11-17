package ukdw.com.progmob_2020.Model;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class User {
    @SerializedName("id")
    @Expose
    private String id;

    @SerializedName("nama")
    @Expose
    private String nama;

    @SerializedName("nimnik")
    @Expose
    private String nimnik;

    @SerializedName("email")
    @Expose
    private String email;

    @SerializedName("password")
    @Expose
    private String password;

    @SerializedName("is_admin")
    @Expose
    private String is_admin;

    public User(String id, String nama, String nimnik, String email, String password, String is_admin) {
        this.id = id;
        this.nama = nama;
        this.nimnik = nimnik;
        this.email = email;
        this.password = password;
        this.is_admin = is_admin;
    }

    public User(String nama, String nimnik, String email, String password, String is_admin) {
        this.nama = nama;
        this.nimnik = nimnik;
        this.email = email;
        this.password = password;
        this.is_admin = is_admin;
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

    public String getNimnik() {
        return nimnik;
    }

    public void setNimnik(String nimnik) {
        this.nimnik = nimnik;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getIs_admin() {
        return is_admin;
    }

    public void setIs_admin(String is_admin) {
        this.is_admin = is_admin;
    }
}
