package com.example.uts;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;

import androidx.appcompat.app.AppCompatActivity;

public class SplashScreen extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_splash_screen);
    }

    public void Aplikasi(View v) {
        Intent intent = new Intent(SplashScreen.this, LoginScreen.class);
        startActivity(intent);
    }
}
