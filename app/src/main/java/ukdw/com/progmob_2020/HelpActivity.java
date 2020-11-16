package ukdw.com.progmob_2020;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.widget.TextView;
import ukdw.com.progmob2020.R;

public class HelpActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_help);

        TextView textHelp = (TextView)findViewById(R.id.textViewHelp);

        Bundle b = getIntent().getExtras();
        String helpText = b.getString("helpString");
        textHelp.setText(helpText);



    }
}