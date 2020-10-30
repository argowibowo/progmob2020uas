package com.example.uts.Adapter;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.example.uts.Model.DataKelasModel;
import com.example.uts.R;

import java.util.ArrayList;

public class DataKelasAdapter extends RecyclerView.Adapter<DataKelasAdapter.ViewHolder> {
    ArrayList <DataKelasModel> dataKelasArrayList;

    public DataKelasAdapter (ArrayList<DataKelasModel> dataKelasArrayList){
        this.dataKelasArrayList = dataKelasArrayList;
    }

    @NonNull
    @Override
    public DataKelasAdapter.ViewHolder onCreateViewHolder (@NonNull ViewGroup parent, int viewType) {
        LayoutInflater layoutInflater = LayoutInflater.from(parent.getContext());
        View view = layoutInflater.inflate(R.layout.card_kelas,parent, false);
        return new ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull DataKelasAdapter.ViewHolder holder, int position){
        holder.txtHariKls.setText(dataKelasArrayList.get(position).getHariKls());
        holder.txtSesiKls.setText(dataKelasArrayList.get(position).getSesiKls());
        holder.txtKodeMatkulKls.setText(dataKelasArrayList.get(position).getKodeMatkulKls());
        holder.txtDosenPengampuKls.setText(dataKelasArrayList.get(position).getDosenPengampuKls());
        holder.txtJlhMhsKls.setText(dataKelasArrayList.get(position).getJlhMhsKls());
    }

    @Override
    public int getItemCount(){
        return(dataKelasArrayList != null) ? dataKelasArrayList.size() : 0;
    }

    public class ViewHolder extends RecyclerView.ViewHolder{
        private TextView txtHariKls, txtSesiKls, txtKodeMatkulKls, txtDosenPengampuKls, txtJlhMhsKls;

        public ViewHolder (View view) {
            super(view);
            txtHariKls = view.findViewById(R.id.txtHariKls);
            txtKodeMatkulKls = view.findViewById(R.id.txtKodeMatkulKls);
            txtSesiKls = view.findViewById(R.id.txtSesiKls);
            txtDosenPengampuKls = view.findViewById(R.id.txtDosenPengampuKls);
            txtJlhMhsKls = view.findViewById(R.id.txtJlhMhsKls);
        }
    }



}

