package ukdw.com.progmob_2020.Pertemuan4;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.os.Bundle;

import java.util.ArrayList;
import java.util.List;

import ukdw.com.progmob_2020.Adapter.MahasiswaRecyclerAdapter;
import ukdw.com.progmob_2020.Model.Mahasiswa;
import ukdw.com.progmob_2020.Pertemuan2.RecyclerActivity;
import ukdw.com.progmob_2020.R;

public class DebuggingActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_debugging);

        RecyclerView rv = (RecyclerView)findViewById(R.id.rvLatihan);
        MahasiswaRecyclerAdapter mahasiswaRecyclerAdapter;

        //data dummy
        List<Mahasiswa> mahasiswaList = new ArrayList<Mahasiswa>();

        //generate data mahasiswa
        Mahasiswa m1 = new Mahasiswa("Argo","72110101","084646464646");
        Mahasiswa m2 = new Mahasiswa("Halim","72110101","084646464646");
        Mahasiswa m3 = new Mahasiswa("Jong Jek Siang","72110101","084646464646");
        Mahasiswa m4 = new Mahasiswa("Katon","72110101","084646464646");
        Mahasiswa m5 = new Mahasiswa("Yetli","72110101","084646464646");

        mahasiswaList.add(m1);
        mahasiswaList.add(m2);
        mahasiswaList.add(m3);
        mahasiswaList.add(m4);
        mahasiswaList.add(m5);

        List<Mahasiswa> mahasiswaListDebug = new ArrayList<Mahasiswa>();
        
        mahasiswaRecyclerAdapter = new MahasiswaRecyclerAdapter(DebuggingActivity.this);
        mahasiswaRecyclerAdapter.setMahasiswaList(mahasiswaListDebug);

        rv.setLayoutManager(new LinearLayoutManager(DebuggingActivity.this));
        rv.setAdapter(mahasiswaRecyclerAdapter);
    }
}
