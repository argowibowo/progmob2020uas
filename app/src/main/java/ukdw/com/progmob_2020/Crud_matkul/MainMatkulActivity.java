package ukdw.com.progmob_2020.Crud_matkul;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import ukdw.com.progmob_2020.Crud_dosen.DosenGetAllActivity;
import ukdw.com.progmob_2020.Crud_dosen.MainDsnActivity;
import ukdw.com.progmob_2020.R;

public class MainMatkulActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main_matkul);

        Button btnLihatMatkul = (Button)findViewById(R.id.btnGetMatkul);
        Button btnTbhMatkul = (Button)findViewById(R.id.btnAddMatkul) ;
        Button btnHapusMatkul = (Button)findViewById(R.id.btnHapusMatkul);

        btnLihatMatkul.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainMatkulActivity.this, MatkulGetallActivity.class);

                startActivity(intent);
            }
        });

        btnTbhMatkul.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainMatkulActivity.this, MatkulAddActivity.class);

                startActivity(intent);
            }
        });
        btnHapusMatkul.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainMatkulActivity.this, HapusMatkulActivity.class);

                startActivity(intent);
            }
        });
    }
}