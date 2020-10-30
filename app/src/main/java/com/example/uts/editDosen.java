package com.example.uts;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class EditDosen extends AppCompatActivity {
    EditText nama, nidn, alamat, email, gelar, foto;
    Button simpan;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_edit_dosen);

        setTitle("Edit Data Dosen");

        nama = (EditText) findViewById(R.id.editNamaDosen);
        nidn = (EditText) findViewById(R.id.editNidnDsoen);
        alamat = (EditText) findViewById(R.id.editAlamatDosen);
        email = (EditText) findViewById(R.id.editEmailDosen);
        gelar = (EditText) findViewById(R.id.editGelarDosen);
        foto = (EditText) findViewById(R.id.editFotoDosen);
        simpan = (Button) findViewById(R.id.BtnEditDosen);

        simpan.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if(nama.getText().toString().length()==0){
                    nama.setError("Nama Dosen baru");
                }else if (nidn.getText().toString().length()==0){
                    nidn.setError("NIDN Dosen baru");
                }else if (alamat.getText().toString().length()==0){
                    nidn.setError("Alamat Dosen baru");
                }else if (gelar.getText().toString().length()==0){
                    gelar.setError("Gelar Dosen baru");
                }else if (email.getText().toString().length()==0) {
                    email.setError("Email Dosen baru");
                }else if (foto.getText().toString().length()==0){
                    foto.setError("Foto Dosen baru");
                }else{
                    Toast.makeText(getApplicationContext(),"Data Dosen Berhasil Diubah",Toast.LENGTH_SHORT).show();
                }
            }
        });
    }
}

