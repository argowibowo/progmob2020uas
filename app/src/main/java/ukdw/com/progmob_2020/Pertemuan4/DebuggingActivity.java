package ukdw.com.progmob_2020.Pertemuan4;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.os.Bundle;

import java.util.ArrayList;
import java.util.List;
import ukdw.com.progmob2020.R;
import ukdw.com.progmob_2020.Adapter.MahasiswaRecyclerAdapter;
import ukdw.com.progmob_2020.Model.Mahasiswa;


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

        List<Mahasiswa> mahasiswaListDebug = new ArrayList<Mahasiswa>();
        
        mahasiswaRecyclerAdapter = new MahasiswaRecyclerAdapter(DebuggingActivity.this);
        mahasiswaRecyclerAdapter.setMahasiswaList(mahasiswaListDebug);

        rv.setLayoutManager(new LinearLayoutManager(DebuggingActivity.this));
        rv.setAdapter(mahasiswaRecyclerAdapter);
    }
}
