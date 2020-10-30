package com.example.uts;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import retrofit2.Call;
import retrofit2.Callback;

import android.Manifest;
import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Intent;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.Bundle;
import android.provider.MediaStore;
import android.util.Base64;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.Toast;

import com.example.uts_progmob.Network.GetDataService;
import com.example.uts_progmob.Network.RetrofitClientInstance;

import java.io.ByteArrayOutputStream;
import java.util.List;

import static android.content.pm.PackageManager.PERMISSION_GRANTED;

public class DataDosen extends AppCompatActivity {

    private EditText txtNama, txtNidn, txtAlamat, txtGelar, txtEmail, txtFoto;
    private ImageView imgDosen;
    private ProgressDialog progressDialog;
    private static final int GALLERY_REQUEST_CODE = 58;
    private static final int FILE_ACCESS_REQUEST_CODE = 59;
    private String stringImg= "";
    private boolean isUpdate = false;
    private String idDosen = "";

    EditText nama, nidn, alamat, email, gelar, foto;
    Button simpan;



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_data_dosen);

        setTitle("Tambah Dosen");

        nama = (EditText) findViewById(R.id.editTxtNamaDosen);
        nidn = (EditText) findViewById(R.id.editTxtNidnDosen);
        alamat = (EditText) findViewById(R.id.editTxtAlamatDosen);
        email = (EditText) findViewById(R.id.editTxtEmailDosen);
        gelar = (EditText) findViewById(R.id.editTxtGelarDosen);
        foto = (EditText) findViewById(R.id.editTxtFotoDosen);
        simpan = (Button) findViewById(R.id.btnAddDosen);

        if (ActivityCompat.checkSelfPermission(this, Manifest.permission.READ_EXTERNAL_STORAGE) != PERMISSION_GRANTED) {
            ActivityCompat.requestPermissions(this, new String[]{
                    Manifest.permission.READ_EXTERNAL_STORAGE},FILE_ACCESS_REQUEST_CODE);
        }
        txtNama = findViewById(R.id.editTxtNamaDosen);
        txtNidn = findViewById(R.id.editTxtNidnDosen);
        txtAlamat = findViewById(R.id.editTxtAlamatDosen);
        txtEmail = findViewById(R.id.editTxtEmailDosen);
        txtGelar = findViewById(R.id.editTxtGelarDosen);
        txtFoto = findViewById(R.id.editTxtFotoDosen);

        final Button btnUpload = findViewById(R.id.btnUploadFoto);
        btnUpload.setOnClickListener(new View.OnClickListener() {
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
                if(nama.getText().toString().length()==0){
                    nama.setError("Nama Dosen");
                }else if (nidn.getText().toString().length()==0){
                    nidn.setError("NIDN");
                }else if (alamat.getText().toString().length()==0){
                    nidn.setError("Alamat Dosen");
                }else if (gelar.getText().toString().length()==0){
                    gelar.setError("Gelar Dosen");
                }else if (email.getText().toString().length()==0) {
                    email.setError("Email Dosen");
                }else if (foto.getText().toString().length()==0){
                    foto.setError("Foto Dosen");
                }else{
                    Toast.makeText(getApplicationContext(),"Registrasi Berhasil",Toast.LENGTH_SHORT).show();
                }
            }
        });



        /*Button btnSimpan = (Button) findViewById(R.id.btnSimpan);
        progressDialog = new ProgressDialog(this);
        progressDialog.setMessage("Loading...");
        progressDialog.show();

        GetDataService service = RetrofitClientInstance.getRetrofitInstance().create(GetDataService.class);
        android.telecom.Call<List<com.example.uts_progmob.Model.DataDosen>> call = service.getDosenAll("72160071");
        call.enqueue(new android.telecom.Call.Callback<List<com.example.uts_progmob.Model.DataDosen>>());
        @Override
        public void onResponse
        (Call < List < DataDosen >> call, Response < List < DataDosen >> Response){
            progressDialog.dismiss();*/
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
        super.onActivityResult(requestCode, resultCode, data);
        if (resultCode == Activity.RESULT_OK)
            switch (requestCode) {
                case GALLERY_REQUEST_CODE:
                    Uri selectedImage = data.getData();
                    imgDosen.setImageURI(selectedImage);

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
}


