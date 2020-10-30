package com.example.uts;

import android.os.Bundle;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.example.uts.Adapter.DataKelasAdapter;
import com.example.uts.Model.DataKelasModel;

import java.util.ArrayList;

public class LihatKelas extends AppCompatActivity {
    private RecyclerView recyclerView;
    private DataKelasAdapter dataKelasAdapter;
    private ArrayList<DataKelasModel> dataKelasArrayList;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_lihat_kelas);

        setTitle("Lihat Data Kelas");

        addData();

        recyclerView = findViewById(R.id.rvKelas);
        dataKelasAdapter = new DataKelasAdapter(dataKelasArrayList);
        RecyclerView.LayoutManager layoutManager = new LinearLayoutManager(LihatKelas.this);
        recyclerView.setLayoutManager(layoutManager);
        recyclerView.setAdapter(dataKelasAdapter);
    }

    private void addData(){
        dataKelasArrayList = new ArrayList<>();
        dataKelasArrayList.add(new DataKelasModel("SE4323-Data Mining","Sesi : 3", "Hari : Selasa", "Dosen : Eko Verianto", "Peserta : 41"));

    }
}

