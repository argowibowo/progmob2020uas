package com.example.uts;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class EditMahasiswa extends AppCompatActivity {
    EditText nama,nim,alamat,email,foto;
    Button simpan;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_edit_mahasiswa);

        setTitle("Edit Mahasiswa");

        nama = (EditText) findViewById(R.id.editNamaMhs);
        nim = (EditText) findViewById(R.id.editNimMhs);
        alamat = (EditText) findViewById(R.id.editAlamatMhs);
        email = (EditText) findViewById(R.id.editEmailMhs);
        foto = (EditText) findViewById(R.id.editFotoMhs);
        simpan = (Button) findViewById(R.id.btnEditMhs);

        simpan.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (nama.getText().toString().length()==0){
                    nama.setError("Nama Mahasiswa baru");
                }else if (nim.getText().toString().length()==0){
                    nim.setError("NIM Mahasiswa baru");
                }else if (alamat.getText().toString().length()==0){
                    alamat.setError("Alamat Mahasiswa baru");
                } else if (email.getText().toString().length()==0){
                    email.setText("Email Mahasiswa baru");
                } else if (foto.getText().toString().length()==0){
                    foto.setError("Foto Mahasiswa baru");
                } else {
                    Toast.makeText(getApplicationContext(),"Data Mahasiswa Berhasil Diubah",Toast.LENGTH_SHORT).show();
                }
            }
        });


    }
}

