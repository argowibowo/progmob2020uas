package com.example.uts.Network;

import com.example.uts.Model.DataDosenModel;

import java.util.List;

import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Path;

public interface DataMahasiswaService {
    @GET("/api/progmob/mahasiswa/{nim_progmob}")
    Call<List<DataDosenModel>> getMhsAll(@Path("nim_progmob") String nimProgmob);
}