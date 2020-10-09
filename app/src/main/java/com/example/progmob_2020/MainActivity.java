package com.example.progmob_2020;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import com.example.progmob_2020.Pertemuan2.ListActivity;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.tracker_activity);

        //variable
        final TextView txtView = (TextView) findViewById(R.id.mainActivityTextView);
        Button myBtn = (Button) findViewById((R.id.button1));
        final EditText myEditText = (EditText) findViewById(R.id.editText1);
        final Button btnHelp = (Button) findViewById(R.id.btnHelp);

        //Pertemuan2
        Button btnList = (Button) findViewById(R.id.buttonListVIew);
        Button btnRecycler = (Button) findViewById(R.id.buttonRecycler);
        Button btnCard = (Button) findViewById(R.id.buttonCardView);

        //action
        txtView.setText(R.string.text_hello_world);
        myBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //Log.d("COBA KLIK", myEditText.getText().toString());
                txtView.setText(myEditText.getText().toString());
            }
        });
        btnHelp.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity.this, HelpActivity.class);
                Bundle b = new Bundle();

                b.putString("help_string", myEditText.getText().toString());
                intent.putExtras(b);
                startActivity(intent);
            }
        });
        btnList.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(MainActivity.this, ListActivity.class);
                startActivity(intent);
            }
        });
    }
}