package ukdw.com.progmob_2020.Crud;

import androidx.appcompat.app.AppCompatActivity;

import android.app.ProgressDialog;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import ukdw.com.progmob_2020.Model.DefaultResult;
import ukdw.com.progmob_2020.Network.GetDataService;
import ukdw.com.progmob_2020.Network.RetrofitClientInstance;
import ukdw.com.progmob_2020.R;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class MahasiswaUpdateActivity extends AppCompatActivity {
    ProgressDialog pd;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_mahasiswa_update);

        final EditText upNimLama = (EditText)findViewById(R.id.upNimLama);
        final EditText upNama = (EditText)findViewById(R.id.upNama);
        final EditText upNim = (EditText)findViewById(R.id.upNim);
        final EditText upAlamat = (EditText)findViewById(R.id.upAlamat);
        final EditText upEmail = (EditText)findViewById(R.id.upEmail);
        Button btnUpdt = (Button) findViewById(R.id.btnUpdt);
        pd = new ProgressDialog(MahasiswaUpdateActivity.this);

        btnUpdt.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                pd.setTitle("Mohon Tunggu");
                pd.show();

                GetDataService service = RetrofitClientInstance.getRetrofitInstance().create(GetDataService.class);
                Call<DefaultResult> del= service.delete_mhs(
                        upNimLama.getText().toString(),
                        "72170108"

                );

                del.enqueue(new Callback<DefaultResult>() {
                    @Override
                    public void onResponse(Call<DefaultResult> call, Response<DefaultResult> response) {
                        Toast.makeText(MahasiswaUpdateActivity.this,"Update Berhasil", Toast.LENGTH_LONG).show();

                    }

                    @Override
                    public void onFailure(Call<DefaultResult> call, Throwable t) {
                        pd.dismiss();
                        Toast.makeText(MahasiswaUpdateActivity.this,"Error!",Toast.LENGTH_LONG).show();
                    }
                });

                Call<DefaultResult> add= service.add_mhs(
                        upNama.getText().toString(),
                        upNim.getText().toString(),
                        upAlamat.getText().toString(),
                        upEmail.getText().toString(),
                        "Keep Smile",
                        "72170108"
                );
                add.enqueue(new Callback<DefaultResult>() {
                    @Override
                    public void onResponse(Call<DefaultResult> call, Response<DefaultResult> response) {
                        pd.dismiss();
                        Toast.makeText(MahasiswaUpdateActivity.this,"Berhasil disimpan",Toast.LENGTH_LONG).show();

                    }

                    @Override
                    public void onFailure(Call<DefaultResult> call, Throwable t) {
                        pd.dismiss();
                        Toast.makeText(MahasiswaUpdateActivity.this,"Error",Toast.LENGTH_LONG).show();
                    }
                });
            }
        });

    }

}