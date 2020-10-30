package com.example.uts;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.app.ProgressDialog;
import android.os.Bundle;

import com.example.uts.Adapter.DataDosenAdapter;
import com.example.uts.Model.DataDosenModel;
import com.example.uts.Network.GetDataService;
import com.example.uts.Network.RetrofitClientInstance;
/*import com.example.uts_progmob.Network.GetDataService;*/

import java.util.ArrayList;

public class LihatDosen extends AppCompatActivity {
    private RecyclerView recyclerView;
    private DataDosenAdapter dataDosenAdapter;
    private ArrayList<DataDosenModel> dataDosenArrayList;
    ProgressDialog progressDialog;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_lihat_dosen);

        addData();

        progressDialog = new ProgressDialog(this);
        progressDialog.setMessage("Loading...");
        progressDialog.show();

        /*GetDataService service = RetrofitClientInstance.getRetrofitInstance().create(GetDataService.class);
        Call<List<DataDosen>> call = service.getDosenAll("72160071");
        call.enqueue(new Call.Callback<List<DataDosen>>());
        @Override
        public void onResponse
        (Call < List < DataDosen >> call, Response < List < DataDosen >> Response){
            progressDialog.dismiss();*/

        recyclerView = findViewById(R.id.rvDosen);
        dataDosenAdapter = new DataDosenAdapter(dataDosenArrayList);
        RecyclerView.LayoutManager layoutManager = new LinearLayoutManager(LihatDosen.this);
        recyclerView.setLayoutManager(layoutManager);
        recyclerView.setAdapter(dataDosenAdapter);
    }


    /*@Override
    public void onFailure(Call<List<DataDosen>> call, Throwable t) {
        progressDialog.dismiss();
        Toast.makeText(LihatDosen.this,"Login Gagal", Toast.LENGTH_SHORT).show();
    }*/

    private void addData(){
        dataDosenArrayList = new ArrayList<>();
        dataDosenArrayList.add(new DataDosenModel("72170093","S.Kom", "Selokan Mataram" ,"andrew.azio@si.ukdw.ac.id","","Andrew Azio"));
    }}

