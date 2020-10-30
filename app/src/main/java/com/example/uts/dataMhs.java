package com.example.uts;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.Bundle;
import android.provider.MediaStore;
import android.util.Base64;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Gallery;
import android.widget.ImageView;
import android.widget.Toast;

import java.io.ByteArrayOutputStream;

import static android.content.pm.PackageManager.PERMISSION_GRANTED;

public class DataMahasiswa extends AppCompatActivity {
    EditText nama, nim, alamat, email, foto;
    Button simpan, upload;

    private ImageView imgMhs;
    private ProgressDialog progressDialog;
    private static final int GALLERY_REQUEST_CODE = 58;
    private static final int FILE_ACCESS_REQUEST_CODE = 59;
    private String stringImg= "";
    private boolean isUpdate = false;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_data_mahasiswa);

        setTitle("Tambah Data Mahasiswa");

        nama = (EditText) findViewById(R.id.editTxtNamaMhs);
        nim = (EditText) findViewById(R.id.editTxtNimMhs);
        alamat = (EditText) findViewById(R.id.editTxtAlamatMhs);
        email = (EditText) findViewById(R.id.editTxtEmailMhs);
        foto = (EditText) findViewById(R.id.editTxtFotoMhs);
        simpan = (Button) findViewById(R.id.btnSimpanMhs);
        upload = (Button) findViewById(R.id.btnUploadMhs);


        final Button upload = findViewById(R.id.btnUploadMhs);
        upload.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(Intent.ACTION_PICK);
                intent.setType("image/*");
                String[] mimeTypes = {"image/jpeg"};
                intent.putExtra(Intent.EXTRA_MIME_TYPES, mimeTypes);
                startActivityForResult(intent, GALLERY_REQUEST_CODE);
            }
        });

        simpan.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (nama.getText().toString().length()==0){
                    nama.setError("silahkan mengisi Nama Mahasiswa");
                }else if(nim.getText().toString().length()==0){
                    nim.setError("silahkan mengisi NIM Mahasiswa");
                }else if (alamat.getText().toString().length()==0){
                    alamat.setError("silahkan mengisi Alamat Mahasiswa");
                }else if (email.getText().toString().length()==0){
                    email.setError("silahkan mengisi Email Mahasiswa");
                }else if (foto.getText().toString().length()==0){
                    foto.setError("silahkan mengisi Foto Mahasiswa");
                } else {
                    AlertDialog.Builder builder = new AlertDialog.Builder(DataMahasiswa.this);
                    builder.setMessage("Apakah ingin menyimpan data?").setNegativeButton("Batal", new DialogInterface.OnClickListener() {
                        @Override
                        public void onClick(DialogInterface dialogInterface, int which) {
                            Toast.makeText(DataMahasiswa.this, "Tidak jadi menyimpan", Toast.LENGTH_SHORT).show();
                        }
                    })
                            .setPositiveButton("Ya", new DialogInterface.OnClickListener() {
                                @Override
                                public void onClick(DialogInterface dialogInterface, int which) {
                                    Intent intent = new Intent(DataMahasiswa.this, MenuMahasiswa.class);
                                    startActivity(intent);
                                    Toast.makeText(DataMahasiswa.this,"Berhasil menyimpan", Toast.LENGTH_LONG).show();
                                }
                            });
                    AlertDialog dialog = builder.create();
                    dialog.show();
                }

            }

            @Override
            public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
                switch (requestCode) {
                    case FILE_ACCESS_REQUEST_CODE : if (grantResults.length > 0 && grantResults [0] == PERMISSION_GRANTED) {
                        //Permission Granted
                    }
                        break;
                }
            }

            @Override
            protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
                if (resultCode == Activity.RESULT_OK)
                    switch (requestCode) {
                        case GALLERY_REQUEST_CODE:
                            Uri selectedImage = data.getData();
                            imgMhs.setImageURI(selectedImage);

                            String[] filePathColumn = {MediaStore.Images.Media.DATA};
                            Cursor cursor = getContentResolver().query(selectedImage, filePathColumn, null, null, null);
                            cursor.moveToFirst();
                            int columnIndex = cursor.getColumnIndex(filePathColumn[0]);
                            String imgDecodableString = cursor.getString(columnIndex);
                            txtFoto.setText(imgDecodableString);
                            cursor.close();

                            Bitmap bm = BitmapFactory.decodeFile(imgDecodableString);
                            ByteArrayOutputStream baos = new ByteArrayOutputStream();
                            bm.compress(Bitmap.CompressFormat.JPEG, 100, baos);
                            byte[] b = baos.toByteArray();

                            stringImg = Base64.encodeToString(b, Base64.DEFAULT);
                            break;
                    }
            }
        });


        /*Button simpanButton = (Button) findViewById(R.id.btnSimpanAddMhs);
        simpanButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                AlertDialog.Builder builder = new AlertDialog.Builder(DataMahasiswa.this);
                builder.setMessage("Apakah ingin menyimpan data?").setNegativeButton("Batal", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialogInterface, int which) {
                        Toast.makeText(DataMahasiswa.this, "Tidak jadi menyimpan", Toast.LENGTH_SHORT).show();
                    }
                })
                .setPositiveButton("Ya", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialogInterface, int which) {
                        Intent intent = new Intent(DataMahasiswa.this, MenuMahasiswa.class);
                        startActivity(intent);
                        Toast.makeText(DataMahasiswa.this,"Berhasil menyimpan", Toast.LENGTH_LONG).show();
                    }
                });
                AlertDialog dialog = builder.create();
                dialog.show();
            }
        });*/

    }
}

