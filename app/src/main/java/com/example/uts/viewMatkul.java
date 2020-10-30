package com.example.uts;

import android.os.Bundle;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.example.uts.R;
import com.example.uts.Adapter.DataMatkulAdapter;
import com.example.uts.Model.DataMatkul;

import java.util.ArrayList;

public class LihatMatkul extends AppCompatActivity {
    private RecyclerView recyclerView;
    private DataMatkulAdapter dataMatkulAdapter;
    private ArrayList<DataMatkul> dataMatkulArrayList;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_lihat_matkul);

        setTitle("Lihat Data MataKuliah");

        addDate();

        recyclerView = findViewById(R.id.rvMatkul);
        dataMatkulAdapter = new DataMatkulAdapter(dataMatkulArrayList);
        RecyclerView.LayoutManager layoutManager = new LinearLayoutManager(LihatMatkul.this);
        recyclerView.setLayoutManager(layoutManager);
        recyclerView.setAdapter(dataMatkulAdapter);
    }

    private void addDate(){
        dataMatkulArrayList = new ArrayList<>();
        dataMatkulArrayList.add(new DataMatkul("SE4323-Data Mining","Sesi : 3", "Hari : Selasa", "Dosen : Eko Verianto", "Jumlah Peserta : 41"));
    }

}

