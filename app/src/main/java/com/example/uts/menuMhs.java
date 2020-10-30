package com.example.uts;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.se.omapi.Session;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;

import android.widget.TextView;
import android.widget.Toast;
import android.widget.Toolbar;

public class MenuMahasiswa extends AppCompatActivity {
    @Override
    public boolean onCreateOptionsMenu(Menu menu){
        MenuInflater menuInflater = getMenuInflater();
        menuInflater.inflate(R.menu.logutogo,menu);
        return true;
    }

    public boolean onOptionsItemSelected(MenuItem item){
        switch (item.getItemId()){
            case R.id.buttonLogout : /*Intent logoutIntent = new Intent(MenuAdmin.this, LoginScreen.class);
            startActivity(logoutIntent);*/
                AlertDialog.Builder builder = new AlertDialog.Builder(MenuMahasiswa.this);
                builder.setMessage("Apakah anda ingin Logout?").setNegativeButton("NO", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialogInterface, int which) {
                        Toast.makeText(MenuMahasiswa.this, "Tidak jadi LogOut", Toast.LENGTH_SHORT).show();
                    }
                })
                        .setPositiveButton("YES", new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialogInterface, int which) {
                                Toast.makeText(MenuMahasiswa.this, "Berhasil LogOut", Toast.LENGTH_SHORT).show();
                                Intent intent = new Intent(MenuMahasiswa.this, LoginScreen.class);
                                startActivity(intent);
                                MenuMahasiswa.super.onDestroy();
                            }
                        });
                AlertDialog dialog = builder.create();
                dialog.show();
                return true;
        }
        return false;
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.setTitle("KRS - Home");
        setContentView(R.layout.activity_menu_mahasiswa);


        /*Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        TextView toolbar_text = (TextView)
                findViewById(R.id.toolbar_text);
        if (toolbar_text != null && toolbar != null) {
            toolbar_text.setText(getTitle());
            setSupportActionBar(toolbar);
        }*/
    }

    public void GoToKrs(View view) {
        Intent intent = new Intent(MenuMahasiswa.this, com.example.uts_progmob.LihatKrs.class);
        startActivity(intent);
    }

    public void GoToKelas(View view) {
        Intent intent = new Intent(MenuMahasiswa.this, LihatKelas.class);
        startActivity(intent);
    }

    public void GoToDataMhs(View view) {
        Intent intent = new Intent(MenuMahasiswa.this, DataMahasiswa.class);
        startActivity(intent);
    }

    public void GoToLogin(View view) {
        Intent intent = new Intent(MenuMahasiswa.this, LoginScreen.class);
        startActivity(intent);
    }
}

