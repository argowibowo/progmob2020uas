package ukdw.com.progmob_2020.Crud_matkul;

import androidx.appcompat.app.AppCompatActivity;

import android.app.ProgressDialog;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import ukdw.com.progmob_2020.Crud_dosen.DosenUpdateActivity;
import ukdw.com.progmob_2020.Crud_dosen.MainDsnActivity;
import ukdw.com.progmob_2020.Model.DefaultResult;
import ukdw.com.progmob_2020.Network.GetDataService;
import ukdw.com.progmob_2020.Network.RetrofitClientInstance;
import ukdw.com.progmob_2020.R;

public class MatkulUpdateActivity extends AppCompatActivity {
    ProgressDialog pd;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_matkul_update);

        EditText edkodelama = (EditText)findViewById(R.id.editkodemklama);
        EditText ednama = (EditText)findViewById(R.id.editnamamk);
        EditText edkode = (EditText)findViewById(R.id.editkodemk);
        EditText edhari = (EditText)findViewById(R.id.editharimk);
        EditText edsks = (EditText)findViewById(R.id.editsksmk);
        EditText edsesi = (EditText)findViewById(R.id.editsesimk);
        Button btnedit = (Button)findViewById(R.id.btnUpdatemk);
        pd = new ProgressDialog(MatkulUpdateActivity.this);

        Intent data = getIntent();
        if(data.getExtras() != null){

            ednama.setText(data.getStringExtra("nama"));
            edkode.setText(data.getStringExtra("kode"));
            edhari.setText(data.getStringExtra("hari"));
            edsks.setText(data.getStringExtra("sks"));
            edsesi.setText(data.getStringExtra("sesi"));
            edkodelama.setText(data.getStringExtra("kode"));

        }
        btnedit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                pd.setTitle("Loading");
                pd.show();

                GetDataService service = RetrofitClientInstance.getRetrofitInstance().create(GetDataService.class);
                Call<DefaultResult> call = service.update_mtkl(

                        ednama.getText().toString(),
                        edkode.getText().toString(),
                        edhari.getText().toString(),
                        edsks.getText().toString(),
                        edsesi.getText().toString(),
                        edkodelama.getText().toString(),
                        "72170163"

                );
                call.enqueue(new Callback<DefaultResult>() {
                    @Override
                    public void onResponse(Call<DefaultResult> call, Response<DefaultResult> response) {
                        pd.dismiss();
                        Toast.makeText(MatkulUpdateActivity.this, "Data Berhasil Diubah", Toast.LENGTH_LONG).show();
                        Intent intent = new Intent(MatkulUpdateActivity.this, MainMatkulActivity.class);
                        startActivity(intent);
                    }
                    @Override
                    public void onFailure(Call<DefaultResult> call, Throwable t) {
                        pd.dismiss();
                        Toast.makeText(MatkulUpdateActivity.this, "Data Gagal Diubah", Toast.LENGTH_LONG).show();
                    }
                });
            }
        });

    }
}