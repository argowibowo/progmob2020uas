package ukdw.com.progmob_2020.Crud_dosen;

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
import ukdw.com.progmob_2020.Model.DefaultResult;
import ukdw.com.progmob_2020.Network.GetDataService;
import ukdw.com.progmob_2020.Network.RetrofitClientInstance;
import ukdw.com.progmob_2020.R;

public class DosenUpdateActivity extends AppCompatActivity {
    ProgressDialog pd;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_dosen_update);

        final EditText ednidnlama = (EditText)findViewById(R.id.editTextNidnLama);
        final EditText ednama = (EditText)findViewById(R.id.editTextNamaDsnBaru);
        final EditText ednidn = (EditText)findViewById(R.id.editTextNidnBaru);
        final EditText edalamat = (EditText)findViewById(R.id.edalamat);
        final EditText edemail = (EditText)findViewById(R.id.editTextEmailDsn);
        final EditText edgelar = (EditText)findViewById(R.id.editTextGelarDsn);
        Button btnedit = (Button)findViewById(R.id.btnUbah);
        pd = new ProgressDialog(DosenUpdateActivity.this);

        Intent data = getIntent();
        if(data.getExtras() != null){
            ednama.setText(data.getStringExtra("nama"));
            ednidn.setText(data.getStringExtra("nidn"));
            edalamat.setText(data.getStringExtra("alamat"));
            edemail.setText(data.getStringExtra("email"));
            edgelar.setText(data.getStringExtra("gelar"));
            ednidnlama.setText(data.getStringExtra("nidn"));
        }

        btnedit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                pd.setTitle("Mohon Tunggu");
                pd.show();

                GetDataService service = RetrofitClientInstance.getRetrofitInstance().create(GetDataService.class);
                Call<DefaultResult> call = service.update_dsn(
                        ednama.getText().toString(),
                        ednidn.getText().toString(),
                        edalamat.getText().toString(),
                        edemail.getText().toString(),
                        edgelar.getText().toString(),
                        "Kosongkan saja",
                        "72170108",
                        ednidnlama.getText().toString()
                );
                call.enqueue(new Callback<DefaultResult>() {
                    @Override
                    public void onResponse(Call<DefaultResult> call, Response<DefaultResult> response) {
                        pd.dismiss();
                        Toast.makeText(DosenUpdateActivity.this, "Data Berhasil Diubah", Toast.LENGTH_LONG).show();
                        Intent intent = new Intent(DosenUpdateActivity.this, MainDsnActivity.class);
                        startActivity(intent);
                    }
                    @Override
                    public void onFailure(Call<DefaultResult> call, Throwable t) {
                        pd.dismiss();
                        Toast.makeText(DosenUpdateActivity.this, "Data Tidak Berhasil Diubah", Toast.LENGTH_LONG).show();
                    }
                });
            }
        });

    }
}