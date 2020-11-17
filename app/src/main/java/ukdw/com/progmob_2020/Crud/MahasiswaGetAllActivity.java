package ukdw.com.progmob_2020.Crud;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.app.ProgressDialog;
import android.os.Bundle;
import android.widget.Toast;

import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import ukdw.com.progmob_2020.Adapter.MahasiswaCRUDRecyclerAdapter;
import ukdw.com.progmob_2020.Model.Mahasiswa;
import ukdw.com.progmob_2020.Network.GetDataService;
import ukdw.com.progmob_2020.Network.RetrofitClientInstance;
import ukdw.com.progmob_2020.R;

public class MahasiswaGetAllActivity extends AppCompatActivity {

    RecyclerView rvMhs;
    MahasiswaCRUDRecyclerAdapter mhsAdapter;
    ProgressDialog pd;
    List<Mahasiswa> mahasiswaList;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_mahasiswa_get_all);

        rvMhs = (RecyclerView)findViewById(R.id.rvGetMhsAll);
        pd = new ProgressDialog(this);
        pd.setTitle("Loading");
        pd.show();

        GetDataService service = RetrofitClientInstance.getRetrofitInstance().create(GetDataService.class);
        Call<List<Mahasiswa>> call = service.getMahasiswa("72170163");

        call.enqueue(new Callback<List<Mahasiswa>>() {
            @Override
            public void onResponse(Call<List<Mahasiswa>> call, Response<List<Mahasiswa>> response) {
                pd.dismiss();
                mahasiswaList = response.body();
                mhsAdapter = new MahasiswaCRUDRecyclerAdapter(mahasiswaList);

                RecyclerView.LayoutManager layoutManager = new LinearLayoutManager(MahasiswaGetAllActivity.this);
                rvMhs.setLayoutManager(layoutManager);
                rvMhs.setAdapter(mhsAdapter);
            }

            @Override
            public void onFailure(Call<List<Mahasiswa>> call, Throwable t) {
                pd.dismiss();
                Toast.makeText(MahasiswaGetAllActivity.this, "Error", Toast.LENGTH_LONG).show();
            }
        });
    }
}