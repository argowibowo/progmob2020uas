package ukdw.com.progmob_2020.Pertemuan2;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.os.Bundle;

import java.util.ArrayList;
import java.util.List;

import ukdw.com.progmob_2020.Adapter.DebuggingRecyclerAdapter;
import ukdw.com.progmob_2020.Adapter.MahasiswaRecyclerAdapter;
import ukdw.com.progmob_2020.Model.Mahasiswa;
import ukdw.com.progmob_2020.Model.MahasiswaDebugging;
import ukdw.com.progmob_2020.Pertemuan2.RecyclerActivity;
import ukdw.com.progmob_2020.R;

public class DebuggingActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_debugging);

        RecyclerView rv = (RecyclerView)findViewById(R.id.rvLatihan);
        DebuggingRecyclerAdapter debuggingRecyclerAdapter;

        //data dummy
        List<MahasiswaDebugging> mahasiswaListDebug = new ArrayList<MahasiswaDebugging>();

        //generate data mahasiswa
        MahasiswaDebugging m1 = new MahasiswaDebugging("Argo","72110101","084646464646");
        MahasiswaDebugging m2 = new MahasiswaDebugging("Halim","72110101","084646464646");
        MahasiswaDebugging m3 = new MahasiswaDebugging("Jong Jek Siang","72110101","084646464646");
        MahasiswaDebugging m4 = new MahasiswaDebugging("Katon","72110101","084646464646");
        MahasiswaDebugging m5 = new MahasiswaDebugging("Yetli","72110101","084646464646");

        mahasiswaListDebug.add(m1);
        mahasiswaListDebug.add(m2);
        mahasiswaListDebug.add(m3);
        mahasiswaListDebug.add(m4);
        mahasiswaListDebug.add(m5);

        
        debuggingRecyclerAdapter = new DebuggingRecyclerAdapter(DebuggingActivity.this);
        debuggingRecyclerAdapter.setMahasiswaList(mahasiswaListDebug);

        rv.setLayoutManager(new LinearLayoutManager(DebuggingActivity.this));
        rv.setAdapter(debuggingRecyclerAdapter);
    }
}
