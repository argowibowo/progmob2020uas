package ukdw.com.progmob_2020.Model;

public class MahasiswaDebugging {
    private String nama;
    private String nim;
    private String notelp;

    public MahasiswaDebugging(String nama, String nim, String notelp) {
        this.nama = nama;
        this.nim = nim;
        this.notelp = notelp;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public String getNim() {
        return nim;
    }

    public void setNim(String nim) {
        this.nim = nim;
    }

    public String getNotelp() {
        return notelp;
    }

    public void setNotelp(String notelp) {
        this.notelp = notelp;
    }
}
