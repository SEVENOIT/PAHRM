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

public class RosterHistory extends AppCompatActivity {
    private ArrayList<TaskListItems> itemArrayList;
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
        setContentView(R.layout.activity_roster_history);


        username = getIntent().getStringExtra("username");

        listView = (ListView) findViewById(R.id.listView);
        connectionClass = new ConnectionClass();
        itemArrayList = new ArrayList<TaskListItems>();


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
        //  LayoutInflater inflater = getLayoutInflater();

        // inflate the layout
        // View myLayout = LayoutInflater.from(this).inflate(R.layout.task_list_content,null);

// load the text view
        //start = (Button) myLayout.findViewById(R.id.startBtn);


        //View inflatedView = getLayoutInflater().inflate(R.layout.task_list_content, null);
        //TextView text = (TextView) inflatedView.findViewById(R.id.text_view);
        // text.setText("Hello!");

        // start = (Button)  inflatedView.findViewById(R.id.start);
        //end = (Button) myLayout.findViewById(R.id.endBtn);

       /* start.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                println("8888888888888888888888888888888888888888888888888888888888888888888888");
                Toast.makeText(getApplicationContext(),"start",Toast.LENGTH_SHORT).show();
                String msg = "end";
                getLocation(msg);





            }
        });

        end.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Toast.makeText(getApplicationContext(),"end",Toast.LENGTH_SHORT).show();
                String msg = "end";
                getLocation(msg);
            }
        });*/

        SyncData orderData = new SyncData();
        orderData.execute("");


    }

    private class SyncData extends AsyncTask<String, String, String> {
        String msg = "Internet/DB_Credentials/Windows_FireWall_TurnOn Error, See Android Monitor in the bottom For details!";
        ProgressDialog progress;

        @Override
        protected void onPreExecute() //Starts the progress dailog
        {
            progress = ProgressDialog.show(RosterHistory.this, "Synchronising",
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

                    String query1 = "SELECT * FROM Roster WHERE EID = '" + username + "' AND JobStatus = 'Completed'";


                    Statement stmt1 = conn.createStatement();

                    ResultSet rs = stmt1.executeQuery(query1);


                    if (rs != null) // if resultset not null, I add items to itemArraylist using class created
                    {
                        while (rs.next()) {
                            try {
                                itemArrayList.add(new TaskListItems(rs.getString("RosterID"),rs.getString("Job"), rs.getString("JLocation"), rs.getString("Roster_Cycle") ,rs.getString("Instructions")));

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
            Toast.makeText(RosterHistory.this, msg + "", Toast.LENGTH_LONG).show();
            if (success == false) {
            } else {
                try {
                    myAppAdapter = new RosterHistory.MyAppAdapter(itemArrayList, RosterHistory.this);
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
            TextView job, jlocation, date, description,rid;
            Button start, end;

        }

        public List<TaskListItems> parkingList;

        public Context context;
        ArrayList<TaskListItems> arraylist;

        private MyAppAdapter(List<TaskListItems> apps, Context context) {
            this.parkingList = apps;
            this.context = context;
            arraylist = new ArrayList<TaskListItems>();
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
                rowView = inflater.inflate(R.layout.roster_history_content, parent, false);
                viewHolder = new MyAppAdapter.ViewHolder();

                viewHolder.rid = (TextView) rowView.findViewById(R.id.RosterID);
                viewHolder.job = (TextView) rowView.findViewById(R.id.job);
                viewHolder.jlocation = (TextView) rowView.findViewById(R.id.location);
                viewHolder.date = (TextView) rowView.findViewById(R.id.timedate);
                viewHolder.description = (TextView) rowView.findViewById(R.id.description);

                rowView.setTag(viewHolder);
            } else {
                viewHolder = (MyAppAdapter.ViewHolder) convertView.getTag();
            }
            // here setting up names and images
            viewHolder.rid.setText(parkingList.get(position).getRosterID()+ "");
            viewHolder.job.setText(parkingList.get(position).getJob() + "");
            viewHolder.jlocation.setText(parkingList.get(position).getJlocation() + "");
            viewHolder.date.setText(parkingList.get(position).getDate() + "");
            viewHolder.description.setText(parkingList.get(position).getDescription() + "");

            final MyAppAdapter.ViewHolder finalViewHolder = viewHolder;

            return rowView;
        }
    }

}