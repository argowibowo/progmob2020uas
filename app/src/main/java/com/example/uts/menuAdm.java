package com.example.uts;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

public class MenuAdmin extends AppCompatActivity {
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
                AlertDialog.Builder builder = new AlertDialog.Builder(MenuAdmin.this);
                builder.setMessage("Apakah anda ingin Logout?").setNegativeButton("NO", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialogInterface, int which) {
                        Toast.makeText(MenuAdmin.this, "Tidak jadi LogOut", Toast.LENGTH_SHORT).show();
                    }
                })
                        .setPositiveButton("YES", new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialogInterface, int which) {
                                Toast.makeText(MenuAdmin.this, "Berhasil LogOut", Toast.LENGTH_SHORT).show();
                                Intent intent = new Intent(MenuAdmin.this, LoginScreen.class);
                                startActivity(intent);
                                MenuAdmin.super.onDestroy();
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
        setContentView(R.layout.activity_menu_admin);

        /*Button btnLogout = (Button) findViewById(R.id.logoutBtn);
        btnLogout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                AlertDialog.Builder builder = new AlertDialog.Builder(MenuAdmin.this);
                builder.setMessage("Apakah anda ingin Logout?").setNegativeButton("NO", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialogInterface, int which) {
                        Toast.makeText(MenuAdmin.this, "Tidak jadi LogOut", Toast.LENGTH_SHORT).show();
                    }
                })
                        .setPositiveButton("YES", new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialogInterface, int which) {
                                Toast.makeText(MenuAdmin.this, "Berhasil LogOut", Toast.LENGTH_SHORT).show();
                                Intent intent = new Intent(MenuAdmin.this, LoginScreen.class);
                                startActivity(intent);
                            }
                        });
                AlertDialog dialog = builder.create();
                dialog.show();
            }
        });*/
    }

    public void GoToKrsA(View view) {
        Intent intent = new Intent(MenuAdmin.this, CrudKrs.class);
        startActivity(intent);
    }

    public void GoToKelasA(View view) {
        Intent intent = new Intent(MenuAdmin.this, LihatKelas.class);
        startActivity(intent);
    }

    public void GotoMatkulA(View view) {
        Intent intent = new Intent(MenuAdmin.this, LihatMatkul.class);
        startActivity(intent);
    }

    public void GotoMhsA(View view) {
        Intent intent = new Intent(MenuAdmin.this, LihatDataMhs.class);
        startActivity(intent);
    }

    public void GoToDosenA(View view) {
        Intent intent = new Intent(MenuAdmin.this, LihatDosen.class);
        startActivity(intent);
    }

    public void GoToDataDiriA(View view) {
        Intent intent = new Intent (MenuAdmin.this, DataAdminActivity.class);
        startActivity(intent);
    }
}

