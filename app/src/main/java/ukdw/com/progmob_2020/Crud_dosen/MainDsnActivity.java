package ukdw.com.progmob_2020.Crud_dosen;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import ukdw.com.progmob_2020.Crud.MahasiswaGetAllActivity;
import ukdw.com.progmob_2020.Crud.MainMhsActivity;
import ukdw.com.progmob_2020.R;

public class MainDsnActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main_dsn);

        Button btnLihatDsn = (Button)findViewById(R.id.buttonGetDsn);
        Button btnTbhDsn = (Button)findViewById(R.id.buttonAddDsn) ;
        Button btnHapusDsn = (Button)findViewById(R.id.buttonHapusDsn);
        

        btnLihatDsn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainDsnActivity.this, DosenGetAllActivity.class);

                startActivity(intent);
            }
        });
        btnTbhDsn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainDsnActivity.this, DosenAddActivity.class);

                startActivity(intent);
            }
        });
        btnHapusDsn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainDsnActivity.this, HapusDsnActivity.class);

                startActivity(intent);
            }
        });



    }
}