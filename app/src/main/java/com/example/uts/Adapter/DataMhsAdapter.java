package com.example.uts.Adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.example.uts.Model.DataMhsModel;
import com.example.uts.R;
import com.squareup.picasso.Picasso;

import java.util.ArrayList;

public class DataMhsAdapter extends RecyclerView.Adapter<DataMhsAdapter.ViewHolder> {
    ArrayList <DataMhsModel> dataMhsArrayList;
    Context context;

    public DataMhsAdapter (ArrayList<DataMhsModel> dataMatkulArrayList) {
        this.dataMhsArrayList = dataMatkulArrayList;
    }

    @NonNull
    @Override
    public DataMhsAdapter.ViewHolder onCreateViewHolder (@NonNull ViewGroup parent, int viewType) {
        LayoutInflater layoutInflater = LayoutInflater.from(parent.getContext());
        View view = layoutInflater.inflate(R.layout.card_mahasiswa,parent, false);
        return new ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull DataMhsAdapter.ViewHolder holder, int position){
        holder.txtNim.setText(dataMhsArrayList.get(position).getNim());
        holder.txtNama.setText(dataMhsArrayList.get(position).getNama());
        holder.txtAlamat.setText(dataMhsArrayList.get(position).getAlamat());
        holder.txtEmail.setText(dataMhsArrayList.get(position).getEmail());
        holder.imgViewMhs.getLayoutParams().width = 100;
        holder.imgViewMhs.getLayoutParams().height = 100;
        if (dataMhsArrayList.get(position).getFoto() != null)
            Picasso.with(this.context).load("https://kpsi.fti.ukdw.ac.id"+dataMhsArrayList.get(position).getFoto())
                    /*.transform(new CropCircleTransformation())*/
                    .into(holder.imgViewMhs);
    }

    @Override
    public int getItemCount(){
        return(dataMhsArrayList != null) ? dataMhsArrayList.size() : 0;
    }

    public class ViewHolder extends RecyclerView.ViewHolder{
        private TextView txtNim, txtAlamat, txtEmail, txtNama;
        ImageView imgViewMhs;

        public ViewHolder (View view) {
            super(view);
            txtNim = view.findViewById(R.id.txtNim);
            txtNama = view.findViewById(R.id.txtNama);
            txtEmail = view.findViewById(R.id.txtEmail);
            txtAlamat = view.findViewById(R.id.txtAlamat);
            imgViewMhs = view.findViewById(R.id.imageView2);
        }
    }
}

