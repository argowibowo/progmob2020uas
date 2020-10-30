package com.example.uts;

import android.os.Bundle;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.example.uts.Adapter.DataMhsAdapter;
import com.example.uts.Model.DataMhsModel;

import java.util.ArrayList;

public class LihatDataMhs extends AppCompatActivity {
    private RecyclerView recyclerView;
    private DataMhsAdapter dataMhsAdapter;
    private ArrayList<DataMhsModel> dataMhsArrayList;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_lihat_data_mhs);
        setTitle("Lihat Data Mahasiswa");

        addData();

        recyclerView = findViewById(R.id.rcMhs);
        dataMhsAdapter = new DataMhsAdapter(dataMhsArrayList);
        RecyclerView.LayoutManager layoutManager = new LinearLayoutManager(LihatDataMhs.this);
        recyclerView.setLayoutManager(layoutManager);
        recyclerView.setAdapter(dataMhsAdapter);
    }

    private void addData(){
        dataMhsArrayList = new ArrayList<>();
        dataMhsArrayList.add(new DataMhsModel("72170099", "Kupang", "jonathan.leonardo@si.ukdw.ac.id", "Jonathan mata"));
        dataMhsArrayList.add(new DataMhsModel("72170123", "Kupang", "joze.francesco@si.ukdw.ac.id", "Joze Haroen"));
        dataMhsArrayList.add(new DataMhsModel("72170159", "Medan", "steinly.douklas@si.ukdw.ac.id", "Steinly Siahaan"));
    }
}

