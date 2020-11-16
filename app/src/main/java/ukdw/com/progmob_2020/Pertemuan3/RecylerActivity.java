package ukdw.com.progmob_2020.Pertemuan3;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.os.Bundle;

import java.util.ArrayList;
import java.util.List;

import ukdw.com.progmob_2020.Adapter.MahasiswaRecyclerAdapter;
import ukdw.com.progmob_2020.Model.Mahasiswa;
//import ukdw.com.progmob_2020.R;
import ukdw.com.progmob2020.R;

public class RecylerActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_recyler);

        RecyclerView rv = (RecyclerView)findViewById(R.id.rvLatihan);
        MahasiswaRecyclerAdapter mahasiswaRecyclerAdapter;

        //data array
        List<Mahasiswa> mahasiswaList = new ArrayList<Mahasiswa>();


        //Generate mahasiswa
        Mahasiswa m1 = new Mahasiswa("Salvador", "72170129" ,"08123446478");
        Mahasiswa m2 = new Mahasiswa("Cristiano", "72170130" ,"08123446543");
        Mahasiswa m3 = new Mahasiswa("Skolastika", "72170011" ,"08123422221");
        Mahasiswa m4 = new Mahasiswa("Tatan", "72171234" ,"123456768");
        Mahasiswa m5 = new Mahasiswa("Beni", "72170456" ,"08123234245");

        mahasiswaList.add(m1);
        mahasiswaList.add(m2);
        mahasiswaList.add(m3);
        mahasiswaList.add(m4);
        mahasiswaList.add(m5);

        mahasiswaRecyclerAdapter = new MahasiswaRecyclerAdapter( RecylerActivity.this);
        mahasiswaRecyclerAdapter.setMahasiswaList(mahasiswaList);

        rv.setLayoutManager(new LinearLayoutManager( RecylerActivity.this));
        rv.setAdapter(mahasiswaRecyclerAdapter);
    }
}