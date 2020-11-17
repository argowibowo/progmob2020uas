package ukdw.com.progmob_2020.Model;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class DefaultResult {
    @SerializedName("status")
    @Expose
    String status;

    // Public Defaultresult
    public DefaultResult(String status) {status=this.status;}

    public String getStatus() { return  status;}

    public void setStatus(String status) { this.status = status; }
}
