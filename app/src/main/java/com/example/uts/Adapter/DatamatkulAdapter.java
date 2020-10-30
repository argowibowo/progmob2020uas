package com.example.uts.Adapter;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;
import com.example.uts.Model.DataMatkul;
import com.example.uts.R;
import java.util.ArrayList;

public class DataMatkulAdapter extends RecyclerView.Adapter<DataMatkulAdapter.ViewHolder> {
    ArrayList <DataMatkul> dataMatkulArrayList;

    public DataMatkulAdapter (ArrayList<DataMatkul> dataMatkulArrayList) {
        this.dataMatkulArrayList = dataMatkulArrayList;
    }

    @NonNull
    @Override
    public DataMatkulAdapter.ViewHolder onCreateViewHolder (@NonNull ViewGroup parent, int viewType) {
        LayoutInflater layoutInflater = LayoutInflater.from(parent.getContext());
        View view = layoutInflater.inflate(R.layout.card_mhs,parent, false);
        return new ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull DataMatkulAdapter.ViewHolder holder, int position){
        holder.txtHari.setText(dataMatkulArrayList.get(position).getHari());
        holder.txtSesi.setText(dataMatkulArrayList.get(position).getSesi());
        holder.txtKodeMatkul.setText(dataMatkulArrayList.get(position).getKodeMatkul());
        holder.txtJlhSks.setText(dataMatkulArrayList.get(position).getJlhSks());
    }

    @Override
    public int getItemCount(){
        return(dataMatkulArrayList != null) ? dataMatkulArrayList.size() : 0;
    }

    public class ViewHolder extends RecyclerView.ViewHolder{
        private TextView txtHari, txtSesi, txtKodeMatkul, txtJlhSks;

        public ViewHolder (View view) {
            super(view);
            txtHari = view.findViewById(R.id.txtHari);
            txtJlhSks = view.findViewById(R.id.txtJlhSks);
            txtKodeMatkul = view.findViewById(R.id.txtKodeMatkul);
            txtSesi = view.findViewById(R.id.txtSesi);
        }
    }
}

