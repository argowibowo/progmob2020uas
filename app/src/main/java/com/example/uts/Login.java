package com.example.uts;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import org.w3c.dom.Text;

public class LoginScreen extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login_screen);

        /*Button loginBtn =(Button) findViewById(R.id.loginBtn);
        loginBtn.setOnClickListener(myLoginBtn);*/

        SharedPreferences prefs = LoginScreen.this.getSharedPreferences("prefs_file", MODE_PRIVATE);
        String statusLogin = prefs.getString("isLogin", null);
        EditText roleLogin = (EditText) findViewById(R.id.emailText);
        String strValue = roleLogin.getText().toString();
        Button loginBtn = (Button) findViewById(R.id.buttonLogin);
        loginBtn.setOnClickListener(myBtnLoginClick);
        if (statusLogin == "Admin") {
            Intent intent = new Intent(LoginScreen.this, MenuAdmin.class);
            startActivity(intent);
        } else if (statusLogin == "User") {
            Intent intent = new Intent(LoginScreen.this, MenuMahasiswa.class);
            startActivity(intent);
        } else /*if (statusLogin == null)*/ {
            Toast.makeText(LoginScreen.this, "Tidak dapat login", Toast.LENGTH_SHORT).show();
        }
    }

    private View.OnClickListener myBtnLoginClick = new View.OnClickListener(){
        @Override
        public void onClick (View view){
            SharedPreferences prefs = LoginScreen.this.getSharedPreferences("prefs_file", MODE_PRIVATE);
            String statusLogin = prefs.getString("isLogin", null);
            SharedPreferences.Editor edit = prefs.edit();

            Button loginBtn = (Button) findViewById(R.id.loginBtn);
            if (statusLogin != null){
                edit.putString("isLogin", null);
                Intent intent = new Intent(LoginScreen.this, MenuMahasiswa.class);
                startActivity(intent);
            } else if (statusLogin == null){
                edit.putString("isLogin", "Admin");
                Intent intent = new Intent(LoginScreen.this, MenuAdmin.class);
                startActivity(intent);
            } else {
                loginBtn.setText("login");
            /*Toast.makeText(LoginScreen.this, "belum", Toast.LENGTH_SHORT).show();
            Intent intent = new Intent(LoginScreen.this, MenuAdmin.class);
            startActivity(intent);*/
            }
            edit.commit();
        }
    };



    public void GoLogin(View view) {
        Intent intent = new Intent(LoginScreen.this, MenuAdmin.class);
        startActivity(intent);
    }
}

