package ukdw.com.progmob_2020.Pertemuan6;

import androidx.appcompat.app.AppCompatActivity;

import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import ukdw.com.progmob2020.R;

public class PrefActivity extends AppCompatActivity {
    String isLogin = "";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_pref);

        final Button btnPref = (Button)findViewById(R.id.btnPref);

        final SharedPreferences pref = PrefActivity.this.getSharedPreferences("pref_file",MODE_PRIVATE);
        final SharedPreferences.Editor editor = pref.edit();

        //membaca pref islogin apakah true atau false
        isLogin = pref.getString("isLogin", "0");
        if(isLogin.equals("1")) {
            btnPref.setText("Logout");
        }else{
            btnPref.setText("Login");
        }

        //pengisian pref
        btnPref.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                isLogin = pref.getString("isLogin", "0");
                if(isLogin.equals("0")) {
                    editor.putString("isLogin", "1");
                    btnPref.setText("Logout");
                }else {
                    editor.putString("isLogin", "0");
                    btnPref.setText("Login");
                }
                editor.commit();
            }
        });
    }
}