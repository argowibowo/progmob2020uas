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

import ukdw.com.progmob_2020.Model.MahasiswaDebugging;
import ukdw.com.progmob_2020.R;

public class DebuggingRecyclerAdapter extends RecyclerView.Adapter<DebuggingRecyclerAdapter.ViewHolder> {
    private Context context;
    private List<MahasiswaDebugging> mahasiswaListDebug;

    public DebuggingRecyclerAdapter(Context context) {
        this.context = context;
        mahasiswaListDebug = new ArrayList<>();
    }

    public List<MahasiswaDebugging> getMahasiswaList() {
        return mahasiswaListDebug;
    }

    public void setMahasiswaList(List<MahasiswaDebugging> mahasiswaListDebug) {
        this.mahasiswaListDebug = mahasiswaListDebug;
        notifyDataSetChanged();
    }

    @NonNull
    @Override
    public ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View v = LayoutInflater.from(context).inflate(R.layout.item_list_debugging,parent,false);
        return new ViewHolder(v);
    }

    @Override
    public void onBindViewHolder(@NonNull ViewHolder holder, int position) {
        MahasiswaDebugging m = mahasiswaListDebug.get(position);

        holder.tvNama.setText(m.getNama());
        holder.tvNoTelp.setText(m.getNotelp());
        holder.tvNim.setText(m.getNim());
    }

    @Override
    public int getItemCount() {
        return mahasiswaListDebug.size();
    }

    public class ViewHolder extends RecyclerView.ViewHolder{
        private TextView tvNama, tvNim, tvNoTelp;

        public ViewHolder(@NonNull View itemView) {
            super(itemView);
            tvNama = itemView.findViewById(R.id.tvNamaMhs);
            tvNim = itemView.findViewById(R.id.tvNim);
            tvNoTelp = itemView.findViewById(R.id.tvNoTelp);
        }
    }
}
