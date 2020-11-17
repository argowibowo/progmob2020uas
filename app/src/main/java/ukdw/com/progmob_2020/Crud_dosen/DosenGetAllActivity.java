package ukdw.com.progmob_2020.Crud_dosen;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.app.ProgressDialog;
import android.content.Context;
import android.os.Bundle;
import android.widget.Toast;

import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import ukdw.com.progmob_2020.Adapter.DosenRecyclerAdapter;
import ukdw.com.progmob_2020.Model.Dosen;
import ukdw.com.progmob_2020.Model.Mahasiswa;
import ukdw.com.progmob_2020.Network.GetDataService;
import ukdw.com.progmob_2020.Network.RetrofitClientInstance;
import ukdw.com.progmob_2020.R;

public class DosenGetAllActivity extends AppCompatActivity {
    RecyclerView rvGetDsnAll;
    DosenRecyclerAdapter dsnAdapter;
    ProgressDialog pd;
    List<Dosen> dosenList;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_dosen_get_all);

        rvGetDsnAll = (RecyclerView)findViewById(R.id.rvGetDsnAll);
        pd = new ProgressDialog(this);
        pd.setTitle("Loading");
        pd.show();

        GetDataService service = RetrofitClientInstance.getRetrofitInstance().create(GetDataService.class);
        Call<List<Dosen>> call = service.getDosen("72170163");

        call.enqueue(new Callback<List<Dosen>>() {
            @Override
            public void onResponse(Call<List<Dosen>> call, Response<List<Dosen>> response) {
                pd.dismiss();
                dosenList = response.body();
                dsnAdapter = new DosenRecyclerAdapter (dosenList);

                RecyclerView.LayoutManager layoutManager = new LinearLayoutManager(DosenGetAllActivity.this);
                rvGetDsnAll.setLayoutManager(layoutManager);
                rvGetDsnAll.setAdapter(dsnAdapter);
            }
            @Override
            public void onFailure(Call<List<Dosen>> call, Throwable t) {
                pd.dismiss();
                Toast.makeText(DosenGetAllActivity.this, "Error", Toast.LENGTH_LONG).show();
            }
        });
    }
    }