package ukdw.com.progmob_2020.Adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;
import java.util.List;

import ukdw.com.progmob_2020.Model.Mahasiswa;
import ukdw.com.progmob_2020.R;

public class MahasiswaRecyclerAdapter extends RecyclerView.Adapter<MahasiswaRecyclerAdapter.viewHolder> {
    private Context context;

    public List<Mahasiswa> getMahasiswaList() {
        return mahasiswaList;
    }

    public void setMahasiswaList(List<Mahasiswa> mahasiswaList) {
        this.mahasiswaList = mahasiswaList;
        notifyDataSetChanged();
    }

    private List<Mahasiswa> mahasiswaList;

    public MahasiswaRecyclerAdapter(Context context) {
        this.context = context;
        mahasiswaList = new ArrayList<>();
    }

    @NonNull
    @Override
    public viewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View v = LayoutInflater.from(context).inflate(R.layout.item_list_cardview,parent, false);
        return new viewHolder(v);
    }

    @Override
    public void onBindViewHolder(@NonNull viewHolder holder, int position) {
        Mahasiswa m = mahasiswaList.get(position);

        holder.tvNama.setText(m.getNama());
        holder.tvNim.setText(m.getNim());
        holder.txtNoTelp.setText(m.getNotelp());

    }

    @Override
    public int getItemCount() {
        return mahasiswaList.size();
    }

    public class viewHolder extends RecyclerView.ViewHolder{
        private TextView tvNama, tvNim, txtNoTelp;

        public viewHolder(@NonNull View itemView) {
            super(itemView);
            tvNama = itemView.findViewById(R.id.tvNama);
            tvNim = itemView.findViewById(R.id.tvNim);
            txtNoTelp = itemView.findViewById(R.id.txtNoTelp);
        }
    }
}
