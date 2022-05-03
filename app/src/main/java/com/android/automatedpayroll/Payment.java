package com.android.automatedpayroll;

import android.app.ProgressDialog;
import android.content.Context;
import android.content.pm.PackageManager;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;
import android.support.v7.app.AppCompatActivity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import com.android.automatedpayroll.Connection.ConnectionClass;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.Writer;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

public class Payment extends AppCompatActivity {
    private ArrayList<PaymentListItems> itemArrayList;
    private MyAppAdapter myAppAdapter;
    private ListView listView;
    private boolean success = false;
    private ConnectionClass connectionClass;
    String username;

    private GPS_Tracker gpsTracker;
    String Cdate = new SimpleDateFormat("yyyy-MM-dd", Locale.getDefault()).format(new Date());
    String StartTime;
    String EndTime;
    double lat;
    double longi;

    private Object Lat;
    private Object Lng;

    String start_Lat = "";
    String start_long = "";


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_payment);


        username = getIntent().getStringExtra("username");

        listView = (ListView) findViewById(R.id.listView);
        connectionClass = new ConnectionClass();
        itemArrayList = new ArrayList<PaymentListItems>();


        //get curent date and time
        // SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd G 'at' HH:mm:ss z");
        //String currentDateandTime = sdf.format(new Date());

        try {
            if (ContextCompat.checkSelfPermission(getApplicationContext(), android.Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED) {
                ActivityCompat.requestPermissions(this, new String[]{android.Manifest.permission.ACCESS_FINE_LOCATION}, 101);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        SyncData orderData = new SyncData();
        orderData.execute("");


    }

    private class SyncData extends AsyncTask<String, String, String> {
        String msg = "Internet/DB_Credentials/Windows_FireWall_TurnOn Error, See Android Monitor in the bottom For details!";
        ProgressDialog progress;

        @Override
        protected void onPreExecute() //Starts the progress dailog
        {
            progress = ProgressDialog.show(Payment.this, "Synchronising",
                    "Listview Loading! Please Wait...", true);
        }

        @Override
        protected String doInBackground(String... strings)  // Connect to the database, write query and add items to array list
        {
            try {
                Connection conn = connectionClass.CONN(); //Connection Object
                if (conn == null) {
                    success = false;
                } else {

                    String query1 = "select * from PaymentInvoice where EID = '"+username+"' ";


                    Statement stmt1 = conn.createStatement();

                    ResultSet rs = stmt1.executeQuery(query1);


                    if (rs != null) // if resultset not null, I add items to itemArraylist using class created
                    {
                        while (rs.next()) {
                            try {
                                itemArrayList.add(new PaymentListItems(rs.getString("RosterID"),rs.getString("GrossPayment"), rs.getString("InvoiceID"), rs.getString("Job") ,rs.getString("Tax") ,rs.getString("WorkedHours") ,rs.getString("HourRate"),rs.getString("Paycycle")));

                            } catch (Exception ex) {
                                ex.printStackTrace();
                            }
                        }
                        msg = "Found";
                        success = true;
                    }
                    if (rs == null) {
                        msg = "not found";
                        success = false;
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                Writer writer = new StringWriter();
                e.printStackTrace(new PrintWriter(writer));
                msg = writer.toString();
                success = false;
            }
            return msg;
        }

        @Override
        protected void onPostExecute(String msg) // disimissing progress dialoge, showing error and setting up my listview
        {
            progress.dismiss();
            Toast.makeText(Payment.this, msg + "", Toast.LENGTH_LONG).show();
            if (success == false) {
            } else {
                try {
                    myAppAdapter = new Payment.MyAppAdapter(itemArrayList, Payment.this);
                    listView.setChoiceMode(ListView.CHOICE_MODE_NONE);
                    listView.setAdapter(myAppAdapter);
                } catch (Exception ex) {

                }

            }
        }
    }

    public class MyAppAdapter extends BaseAdapter         //has a class viewholder which holds
    {
        public class ViewHolder {
            TextView GrossPayment,HourRate,InvoiceID,Job,Paycycle,RosterID,Tax,WorkedHours;
            Button start, end;

        }

        public List<PaymentListItems> parkingList;

        public Context context;
        ArrayList<PaymentListItems> arraylist;

        private MyAppAdapter(List<PaymentListItems> apps, Context context) {
            this.parkingList = apps;
            this.context = context;
            arraylist = new ArrayList<PaymentListItems>();
            arraylist.addAll(parkingList);
        }

        @Override
        public int getCount() {
            return parkingList.size();
        }

        @Override
        public Object getItem(int position) {
            return position;
        }

        @Override
        public long getItemId(int position) {
            return position;
        }

        @Override
        public View getView(final int position, View convertView, ViewGroup parent) // inflating the layout and initializing widgets
        {

            View rowView = convertView;
            MyAppAdapter.ViewHolder viewHolder = null;
            if (rowView == null) {
                LayoutInflater inflater = getLayoutInflater();
                rowView = inflater.inflate(R.layout.payment_single_layout, parent, false);
                viewHolder = new MyAppAdapter.ViewHolder();
                viewHolder.GrossPayment = (TextView) rowView.findViewById(R.id.GrossPayment);
                viewHolder.HourRate = (TextView) rowView.findViewById(R.id.HourRate);
                viewHolder.InvoiceID = (TextView) rowView.findViewById(R.id.InvoiceID);
                viewHolder.Job = (TextView) rowView.findViewById(R.id.Job);
                viewHolder.Paycycle = (TextView) rowView.findViewById(R.id.Paycycle);
                viewHolder.RosterID = (TextView) rowView.findViewById(R.id.RosterID);
                viewHolder.Tax = (TextView) rowView.findViewById(R.id.Tax);
                viewHolder.WorkedHours = (TextView) rowView.findViewById(R.id.WorkedHours);

                rowView.setTag(viewHolder);
            } else {
                viewHolder = (MyAppAdapter.ViewHolder) convertView.getTag();
            }
            // here setting up names and images

            viewHolder.GrossPayment.setText(parkingList.get(position).getGrossPayment()+ "");
            viewHolder.HourRate.setText(parkingList.get(position).getHourRate() + "");
            viewHolder.InvoiceID.setText(parkingList.get(position).getInvoiceID() + "");
            viewHolder.Job.setText(parkingList.get(position).getJob() + "");
            viewHolder.Paycycle.setText(parkingList.get(position).getPaycycle() + "");
            viewHolder.RosterID.setText(parkingList.get(position).getRosterID() + "");
            viewHolder.Tax.setText(parkingList.get(position).getTax() + "");
            viewHolder.WorkedHours.setText(parkingList.get(position).getWorkedHours() + "");

            final MyAppAdapter.ViewHolder finalViewHolder = viewHolder;

            return rowView;
        }
    }

}