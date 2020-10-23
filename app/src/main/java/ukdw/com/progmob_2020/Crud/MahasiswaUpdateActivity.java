package ukdw.com.progmob_2020.Crud;

import android.app.ProgressDialog;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import ukdw.com.progmob_2020.Model.DefaultResult;
import ukdw.com.progmob_2020.Network.GetDataService;
import ukdw.com.progmob_2020.Network.RetrofitClientInstance;
import ukdw.com.progmob_2020.R;

public class MahasiswaUpdateActivity extends AppCompatActivity {

    ProgressDialog pd;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_mahasiswa_update);


        final EditText edNimYgAkanDicari = (EditText)findViewById(R.id.editTextInput);
        final EditText edNamaBru = (EditText)findViewById(R.id.editTextInput);
        final EditText edNimBru = (EditText)findViewById(R.id.editTextInput);
        final EditText edAlmtBru = (EditText)findViewById(R.id.editTextInput);
        final EditText edEmailBru = (EditText)findViewById(R.id.editTextInput);
        Button btnUbah = (Button)findViewById(R.id.buttonUpdate);
        pd = new ProgressDialog(MahasiswaUpdateActivity.this);

        btnUbah.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                pd.setTitle("Please wait..");
                pd.show();

                GetDataService service = RetrofitClientInstance.getRetrofitInstance().create(GetDataService.class);
                Call<DefaultResult> call = service.update_mhs(
                        edNimYgAkanDicari.getText().toString(),
                        edNamaBru.getText().toString(),
                        edNimBru.getText().toString(),
                        edAlmtBru.getText().toString(),
                        edEmailBru.getText().toString(),
                        "Kosongkan Saja disini dirandom sistem"

                );



                call.enqueue(new Callback<DefaultResult>() {
                    @Override
                    public void onResponse(Call<DefaultResult> call, Response<DefaultResult> response) {
                        pd.dismiss();
                        Toast.makeText( MahasiswaUpdateActivity.this, "Data Telah Berhasil Ditambah",Toast.LENGTH_LONG).show();
                    }

                    @Override
                    public void onFailure(Call<DefaultResult> call, Throwable t) {
                        pd.dismiss();
                        Toast.makeText(MahasiswaUpdateActivity.this, "Gagal Melakukan Update", Toast.LENGTH_LONG).show();

                    }
                });
            }
        });



    }
}