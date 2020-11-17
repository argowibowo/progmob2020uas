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

import ukdw.com.progmob_2020.Crud.MahasiswaUpdateActivity;
import ukdw.com.progmob_2020.Crud_matkul.MatkulUpdateActivity;
import ukdw.com.progmob_2020.Model.Mahasiswa;
import ukdw.com.progmob_2020.Model.Matakuliah;
import ukdw.com.progmob_2020.R;

public class MatkulRecyclerAdapter extends RecyclerView.Adapter<MatkulRecyclerAdapter.ViewHolder> {
        private Context context;
        private List<Matakuliah> matakuliahList;

    public MatkulRecyclerAdapter(Context context) {
            this.context = context;
            matakuliahList = new ArrayList<>();
        }

        public MatkulRecyclerAdapter(List<Matakuliah> matakuliahList) {
            this.matakuliahList = matakuliahList;
        }

        public List<Matakuliah> getMatakuliahList() {
            return matakuliahList;
        }

        public void setMatakuliahList(List<Matakuliah> matakuliahList) {
            this.matakuliahList = matakuliahList;
            notifyDataSetChanged();
        }

        @NonNull
        @Override
        public ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
            View v = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_list_cardviewmatakuliah,parent,false);
            return new ViewHolder(v);
        }

        @Override
        public void onBindViewHolder(@NonNull ViewHolder holder, int position) {
            Matakuliah mk = matakuliahList.get(position);

            holder.tvNamaMk.setText(mk.getNama());
            holder.tvKodeMk.setText(mk.getKode());
            holder.tvHariMk.setText(mk.getHari());
            holder.tvSesi.setText(mk.getSesi());
            holder.tvSks.setText(mk.getSks());
            holder.mk = mk;
        }

        @Override
        public int getItemCount() {
            return matakuliahList.size();
        }

        public class ViewHolder extends RecyclerView.ViewHolder{
            private TextView tvNamaMk, tvKodeMk, tvHariMk, tvSesi, tvSks ;
            private RecyclerView rvMatakuliah;
            Matakuliah mk;

            public ViewHolder(@NonNull View itemView) {
                super(itemView);
                tvNamaMk = itemView.findViewById(R.id.tvNamaMk);
                tvKodeMk = itemView.findViewById(R.id.tvKodeMk);
                tvHariMk = itemView.findViewById(R.id.tvHariMk);
                tvSesi = itemView.findViewById(R.id.tvSesi);
                tvSks = itemView.findViewById(R.id.tvSks);

                itemView.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        Intent intent = new Intent(itemView.getContext(), MatkulUpdateActivity.class);
                        intent.putExtra("nama",mk.getNama());
                        intent.putExtra("kode",mk.getKode());
                        intent.putExtra("hari",mk.getHari());
                        intent.putExtra("sks",mk.getSks());
                        intent.putExtra("sesi",mk.getSesi());

                        itemView.getContext().startActivity(intent);
                    }
                });
            }
        }
}
