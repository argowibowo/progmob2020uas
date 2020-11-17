package ukdw.com.progmob_2020.Pertemuan6;

import androidx.appcompat.app.AppCompatActivity;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;

import ukdw.com.progmob_2020.Crud.MainMhsActivity;
import ukdw.com.progmob_2020.Crud_dosen.MainDsnActivity;
import ukdw.com.progmob_2020.Crud_matkul.MainMatkulActivity;
import ukdw.com.progmob_2020.R;

public class SplashActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_splash);

        Thread thread = new Thread(){
            public void run() {
                try{
                    sleep(3000);
                }
                catch (InterruptedException e){
                    e.printStackTrace();
                }finally {
                    startActivity(new Intent(SplashActivity.this, LoginActivity.class));
                    finish();
                }
            }
        };
        thread.start();
    }
}