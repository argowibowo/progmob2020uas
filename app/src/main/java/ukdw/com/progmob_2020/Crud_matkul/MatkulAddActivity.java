package ukdw.com.progmob_2020.Crud_matkul;
import androidx.appcompat.app.AppCompatActivity;

import android.app.ProgressDialog;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import ukdw.com.progmob_2020.Model.DefaultResult;
import ukdw.com.progmob_2020.Network.GetDataService;
import ukdw.com.progmob_2020.Network.RetrofitClientInstance;
import ukdw.com.progmob_2020.R;

public class MatkulAddActivity extends AppCompatActivity {
    ProgressDialog pd;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_matkul_add);

        final EditText ednama = (EditText)findViewById(R.id.ednama);
        final EditText edkode = (EditText)findViewById(R.id.edkode);
        final EditText edhari = (EditText)findViewById(R.id.edhari);
        final EditText edsesi = (EditText)findViewById(R.id.edsesi);
        final EditText edsks = (EditText)findViewById(R.id.edsks);
        Button btnsimpanmk = (Button)findViewById(R.id.btnsimpanmk);
        pd = new ProgressDialog(MatkulAddActivity.this);

        btnsimpanmk.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                pd.setTitle("Mohon Menunggu");
                pd.show();

                GetDataService service = RetrofitClientInstance.getRetrofitInstance().create(GetDataService.class);
                Call<DefaultResult> call = service.add_mtkl(
                        ednama.getText().toString(),
                        edkode.getText().toString(),
                        edhari.getText().toString(),
                        edsesi.getText().toString(),
                        edsks.getText().toString(),
                        "72170108"
                );
                call.enqueue(new Callback<DefaultResult>() {
                    @Override
                    public void onResponse(Call<DefaultResult> call, Response<DefaultResult> response) {
                        pd.dismiss();
                        Toast.makeText(MatkulAddActivity.this, "Data Berhasil Disimpan", Toast.LENGTH_LONG).show();
                    }

                    @Override
                    public void onFailure(Call<DefaultResult> call, Throwable t) {
                        pd.dismiss();
                        Toast.makeText(MatkulAddActivity.this, "Data Tidak Berhasil Disimpan", Toast.LENGTH_LONG).show();
                    }
                });
            }
        });
    }
}