package ukdw.com.progmob_2020.Adapter;

import android.content.Context;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;
import java.util.List;

import ukdw.com.progmob_2020.Crud_dosen.DosenUpdateActivity;
import ukdw.com.progmob_2020.Model.Dosen;
import ukdw.com.progmob_2020.R;

public class DosenRecyclerAdapter extends RecyclerView.Adapter<DosenRecyclerAdapter.ViewHolder> {
    private Context context;
    private List<Dosen> dosenList;

    public DosenRecyclerAdapter(Context context) {
        this.context = context;
        dosenList = new ArrayList<>();
    }

    public DosenRecyclerAdapter(List<Dosen> dosenList) {
        this.dosenList = dosenList;
    }

    public List<Dosen> getDosenList() {
        return dosenList;
    }

    public void setDosenList(List<Dosen> dosenList) {
        this.dosenList = dosenList;
        notifyDataSetChanged();
    }

    @NonNull
    @Override
    public DosenRecyclerAdapter.ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View v = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_list_cardviewdosen,parent,false);
        return new DosenRecyclerAdapter.ViewHolder(v);
    }

    @Override
    public void onBindViewHolder(@NonNull ViewHolder holder, int position) {
        Dosen d = dosenList.get(position);

        holder.tvNamaDosen.setText(d.getNama());
        //holder.tvNoTelp.setText(m.getNotelp());
        holder.tvNidn.setText(d.getNidn());
        holder.tvAlamat.setText(d.getAlamat());
        holder.tvEmail.setText(d.getEmail());
        holder.tvGelar.setText(d.getGelar());
        holder.d = d;
    }


    @Override
    public int getItemCount() {
        return dosenList.size();
    }

    public class ViewHolder extends RecyclerView.ViewHolder{
        private TextView tvNamaDosen, tvNidn, tvAlamat, tvEmail, tvGelar ;
        private RecyclerView rvGetDsnAll;
        Dosen d;

        public ViewHolder(@NonNull View itemView) {
            super(itemView);
            tvNamaDosen = itemView.findViewById(R.id.tvNamaMk);
            tvNidn = itemView.findViewById(R.id.tvKodeMk);
            tvAlamat = itemView.findViewById(R.id.tvHariMk);
            tvEmail = itemView.findViewById(R.id.tvSesi);
            tvGelar = itemView.findViewById(R.id.tvSks);
            //tvNoTelp = itemView.findViewById(R.id.tvNoTelp);
            rvGetDsnAll = itemView.findViewById(R.id.rvGetDsnAll);

            itemView.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    Intent intent = new Intent(itemView.getContext(), DosenUpdateActivity.class);
                    intent.putExtra("nidn",d.getNidn());
                    intent.putExtra("nama",d.getNama());
                    intent.putExtra("alamat",d.getAlamat());
                    intent.putExtra("email",d.getEmail());
                    intent.putExtra("gelar",d.getGelar());

                    itemView.getContext().startActivity(intent);
                }
            });
        }
    }

}
