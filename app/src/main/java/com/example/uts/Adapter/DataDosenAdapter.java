package com.example.uts.Adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.example.uts.Model.DataDosenModel;
import com.example.uts.R;
import com.squareup.picasso.Picasso;

import java.util.ArrayList;

public class DataDosenAdapter extends RecyclerView.Adapter<DataDosenAdapter.ViewHolder> {
    ArrayList <DataDosenModel> dataDosenArrayList;
    Context context;

    public DataDosenAdapter (ArrayList<DataDosenModel> dataDosenArrayList){
        this.dataDosenArrayList = dataDosenArrayList;
    }

    @NonNull
    @Override
    public DataDosenAdapter.ViewHolder onCreateViewHolder (@NonNull ViewGroup parent, int viewType) {
        LayoutInflater layoutInflater = LayoutInflater.from(parent.getContext());
        View view = layoutInflater.inflate(R.layout.card_dosen,parent, false);
        context = parent.getContext();
        return new DataDosenAdapter.ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull DataDosenAdapter.ViewHolder holder, int position){
        holder.txtNidn.setText(dataDosenArrayList.get(position).getNidn());
        holder.txtGelar.setText(dataDosenArrayList.get(position).getGelar());
        holder.txtAlamat.setText(dataDosenArrayList.get(position).getAlamat());
        holder.txtEmail.setText(dataDosenArrayList.get(position).getEmail());
        holder.imgViewDosen.getLayoutParams().width = 100;
        holder.imgViewDosen.getLayoutParams().height = 100;
        if (dataDosenArrayList.get(position).getFoto() != null)
            Picasso.with(this.context).load("https://kpsi.fti.ukdw.ac.id"+dataDosenArrayList.get(position).getFoto())
                    /*.transform(new CropCircleTransformation())*/
                    .into(holder.imgViewDosen);

    }

    @Override
    public int getItemCount(){
        return(dataDosenArrayList != null) ? dataDosenArrayList.size() : 0;
    }

    public class ViewHolder extends RecyclerView.ViewHolder{
        public TextView txtNidn, txtGelar, txtAlamat, txtEmail, txtNama;
        public ImageView imgViewDosen;

        public ViewHolder (View view) {
            super(view);
            txtNidn = view.findViewById(R.id.txtNidnD);
            txtGelar = view.findViewById(R.id.txtGelar);
            txtEmail = view.findViewById(R.id.txtEmailD);
            txtAlamat = view.findViewById(R.id.txtAlamatD);
            txtNama = view.findViewById(R.id.txtNamaD);
            imgViewDosen = view.findViewById(R.id.imgViewDosen);
        }
    }



}

