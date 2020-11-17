package ukdw.com.progmob_2020.Pertemuan2;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.os.Bundle;

import java.util.ArrayList;
import java.util.List;

import ukdw.com.progmob_2020.Adapter.MahasiswaCardAdapter;
import ukdw.com.progmob_2020.Adapter.MahasiswaRecyclerAdapter;
import ukdw.com.progmob_2020.Model.Mahasiswa;
import ukdw.com.progmob_2020.R;

public class CardActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_card);

        RecyclerView rv = (RecyclerView)findViewById(R.id.cvLatihan);
        MahasiswaCardAdapter mahasiswaCardAdapter;

        //data dummy
        List<Mahasiswa> mahasiswaList = new ArrayList<Mahasiswa>();

        //generate data mahasiswa
        Mahasiswa m1 = new Mahasiswa("Sui", "721700123","081235531231");
        Mahasiswa m2 = new Mahasiswa("Dylen", "72101231","0812311235231");
        Mahasiswa m3 = new Mahasiswa("Scarlet", "721019123","081235126862");
        Mahasiswa m4 = new Mahasiswa("Laura", "7210124124","0817252313");
        Mahasiswa m5 = new Mahasiswa("Yi", "721323333","081384534523");

        mahasiswaList.add(m1);
        mahasiswaList.add(m2);
        mahasiswaList.add(m3);
        mahasiswaList.add(m4);
        mahasiswaList.add(m5);

        mahasiswaCardAdapter = new MahasiswaCardAdapter(CardActivity.this);
        mahasiswaCardAdapter.setMahasiswaList(mahasiswaList);

        rv.setLayoutManager(new LinearLayoutManager(CardActivity.this));
        rv.setAdapter(mahasiswaCardAdapter);


    }

}