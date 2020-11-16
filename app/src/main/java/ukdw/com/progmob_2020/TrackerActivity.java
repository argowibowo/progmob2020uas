package ukdw.com.progmob_2020;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.widget.Button;
import android.widget.TextView;
import ukdw.com.progmob2020.R;

public class TrackerActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_tracker);

        final TextView textView = (TextView)findViewById(R.id.trackerActivityTextView);
        Button myBtn = (Button)findViewById(R.id.btnKlik);

    }
}