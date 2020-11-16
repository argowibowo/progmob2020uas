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

public class HapusDsnActivity extends AppCompatActivity {
    ProgressDialog pd;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_hapus_dsn);

        final EditText edNidn = (EditText)findViewById(R.id.editTextNidn);
        Button btnHapus = (Button)findViewById(R.id.btnHapusDsn);
        pd = new ProgressDialog(HapusDsnActivity.this);

        btnHapus.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                GetDataService service = RetrofitClientInstance.getRetrofitInstance().create(GetDataService.class);
                Call<DefaultResult> call = service.delete_dsn(
                        edNidn.getText().toString(),
                        "72170108"
                );

                call.enqueue(new Callback<DefaultResult>() {
                    @Override
                    public void onResponse(Call<DefaultResult> call, Response<DefaultResult> response) {
                        pd.dismiss();
                        Toast.makeText(HapusDsnActivity.this, "Data Berhasil Dihapus", Toast.LENGTH_LONG).show();
                        Intent intent = new Intent(HapusDsnActivity.this, MainDsnActivity.class);
                        startActivity(intent);
                    }

                    @Override
                    public void onFailure(Call<DefaultResult> call, Throwable t) {
                        pd.dismiss();
                        Toast.makeText(HapusDsnActivity.this, "Gagal Dihapus", Toast.LENGTH_LONG).show();
                    }
                });
            }
        });
    }
}