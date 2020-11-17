package ukdw.com.progmob_2020.Pertemuan6;

import androidx.appcompat.app.AppCompatActivity;

import android.app.ProgressDialog;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.view.View;
import android.widget.ImageView;
import android.widget.Toast;

import java.util.List;

import ukdw.com.progmob_2020.Crud.MainMhsActivity;
import ukdw.com.progmob_2020.Crud_dosen.MainDsnActivity;
import ukdw.com.progmob_2020.Crud_matkul.MainMatkulActivity;
import ukdw.com.progmob_2020.Model.User;
import ukdw.com.progmob_2020.R;

public class MainMenuActivity extends AppCompatActivity {
    ProgressDialog pd;
    List<User> users;
    SharedPreferences session;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main_menu);
        Toast.makeText(MainMenuActivity.this, "Dipilih", Toast.LENGTH_SHORT).show();
        session = PreferenceManager.getDefaultSharedPreferences(MainMenuActivity.this);

        if(session.getString("nimnik", "").isEmpty() && session.getString("nama", "").isEmpty()) {
            finish();
            startActivity(new Intent(MainMenuActivity.this, LoginActivity.class));
            return;
        }

        ImageView imgmhs = (ImageView)findViewById(R.id.imgMhs);
        ImageView imgDsn = (ImageView)findViewById(R.id.imgDsn);
        ImageView imgMk = (ImageView)findViewById(R.id.imgMk);
        ImageView imgLogout = (ImageView)findViewById(R.id.imgLogout);

        imgmhs.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainMenuActivity.this, MainMhsActivity.class);
                startActivity(intent);
            }
        });

        imgDsn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainMenuActivity.this, MainDsnActivity.class);
                startActivity(intent);
            }
        });

        imgMk.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainMenuActivity.this, MainMatkulActivity.class);
                startActivity(intent);
            }
        });
        imgLogout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                SharedPreferences.Editor editor = session.edit();
                editor.clear();
                editor.apply();
                finish();
                Intent Intent = new Intent(MainMenuActivity.this,LoginActivity.class);
                startActivity(Intent);
            }
        });
    }
}