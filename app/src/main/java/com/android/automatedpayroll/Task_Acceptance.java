package com.android.automatedpayroll;

import android.annotation.SuppressLint;
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
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

public class Task_Acceptance extends AppCompatActivity {

    private ArrayList<Task_Acceptance_Items> itemArrayList;
    private Task_Acceptance.MyAppAdapter myAppAdapter;
    private ListView listView;
    private boolean success = false;
    private ConnectionClass connectionClass;
    String username;

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
        setContentView(R.layout.activity_task__acceptance);


        username = getIntent().getStringExtra("username");

        listView = (ListView) findViewById(R.id.listView);
        connectionClass = new ConnectionClass();
        itemArrayList = new ArrayList<Task_Acceptance_Items>();


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


        Task_Acceptance.SyncData orderData = new SyncData();
        orderData.execute("");


    }

    private class SyncData extends AsyncTask<String, String, String> {
        String msg = "Internet/DB_Credentials/Windows_FireWall_TurnOn Error, See Android Monitor in the bottom For details!";
        ProgressDialog progress;

        @Override
        protected void onPreExecute() //Starts the progress dailog
        {
            progress = ProgressDialog.show(Task_Acceptance.this, "Synchronising",
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

                    String query1 = "SELECT * FROM AssignRoster WHERE EID = '" + username + "' AND Status = 'Pending'";


                    Statement stmt1 = conn.createStatement();

                    ResultSet rs = stmt1.executeQuery(query1);


                    if (rs != null) // if resultset not null, I add items to itemArraylist using class created
                    {
                        while (rs.next()) {
                            try {

                                itemArrayList.add(new Task_Acceptance_Items(rs.getString("AssignID"),rs.getString("EID"),rs.getString("Job"), rs.getString("JLocation"), rs.getString("JLocation_lat") ,rs.getString("JLocation_longi"),rs.getString("Instructions"),rs.getString("Special"),rs.getString("Contact"),rs.getString("Roster_Cycle"),rs.getString("StartTime"),rs.getString("EndTime"),rs.getString("JobID"),rs.getString("Status")));
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
            Toast.makeText(Task_Acceptance.this, msg + "", Toast.LENGTH_LONG).show();
            if (success == false) {
            } else {
                try {
                    myAppAdapter = new Task_Acceptance.MyAppAdapter(itemArrayList, Task_Acceptance.this);
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
            TextView AssignID, EID, Job, JLocation, JLocation_lat, JLocation_longi, Instructions, Special, Contact, Roster_Cycle, StartTime, EndTime, JobID, Status;
            Button accept, decline;

        }

        public List<Task_Acceptance_Items> parkingList;

        public Context context;
        ArrayList<Task_Acceptance_Items> arraylist;

        private MyAppAdapter(List<Task_Acceptance_Items> apps, Context context) {
            this.parkingList = apps;
            this.context = context;
            arraylist = new ArrayList<Task_Acceptance_Items>();
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

        @SuppressLint("ResourceAsColor")
        @Override
        public View getView(final int position, View convertView, ViewGroup parent) // inflating the layout and initializing widgets
        {
            View rowView = convertView;
            ViewHolder viewHolder = null;
            if (rowView == null) {
                LayoutInflater inflater = getLayoutInflater();
                rowView = inflater.inflate(R.layout.task_acceptance_list_content, parent, false);
                viewHolder = new ViewHolder();
                viewHolder.accept = (Button) rowView.findViewById(R.id.accept);
                viewHolder.decline = (Button) rowView.findViewById(R.id.decline);

                viewHolder.AssignID = (TextView) rowView.findViewById(R.id.AssignID);
                viewHolder.EID = (TextView) rowView.findViewById(R.id.EID);
                viewHolder.Job = (TextView) rowView.findViewById(R.id.Job);
                viewHolder.JLocation = (TextView) rowView.findViewById(R.id.JLocation);
                viewHolder.JLocation_lat = (TextView) rowView.findViewById(R.id.JLocation_lat);
                viewHolder.JLocation_longi = (TextView) rowView.findViewById(R.id.JLocation_longi);
                viewHolder.Instructions = (TextView) rowView.findViewById(R.id.Instructions);
                viewHolder.Special = (TextView) rowView.findViewById(R.id.Special);
                viewHolder.Contact = (TextView) rowView.findViewById(R.id.Contact);
                viewHolder.Roster_Cycle = (TextView) rowView.findViewById(R.id.Roster_Cycle);
                viewHolder.StartTime = (TextView) rowView.findViewById(R.id.StartTimetxt);
                viewHolder.EndTime = (TextView) rowView.findViewById(R.id.EndTimetxt);
                viewHolder.JobID = (TextView) rowView.findViewById(R.id.JobID);
                viewHolder.Status = (TextView) rowView.findViewById(R.id.Status);

                rowView.setTag(viewHolder);
            } else {
                viewHolder = (ViewHolder) convertView.getTag();
            }
            // here setting up names and images
            viewHolder.AssignID.setText(parkingList.get(position).getAssignID() + "");
            viewHolder.EID.setText(parkingList.get(position).getEID() + "");
            viewHolder.Job.setText(parkingList.get(position).getJob() + "");
            viewHolder.JLocation.setText(parkingList.get(position).getJLocation() + "");
            viewHolder.JLocation_lat.setText(parkingList.get(position).getJLocation_lat() + "");
            viewHolder.JLocation_longi.setText(parkingList.get(position).getJLocation_longi() + "");
            viewHolder.Instructions.setText(parkingList.get(position).getInstructions() + "");
            viewHolder.Special.setText(parkingList.get(position).getSpecial() + "");
            viewHolder.Contact.setText(parkingList.get(position).getContact() + "");
            viewHolder.Roster_Cycle.setText(parkingList.get(position).getRoster_Cycle() + "");
            viewHolder.StartTime.setText(parkingList.get(position).getStartTime() + "");
            viewHolder.EndTime.setText(parkingList.get(position).getEndTime() + "");
            viewHolder.JobID.setText(parkingList.get(position).getJobID() + "");
            viewHolder.Status.setText(parkingList.get(position).getStatus() + "");

            String Status = parkingList.get(position).getStatus();
            final ViewHolder finalViewHolder = viewHolder;

            if(Status.equals("Accepted")){
                finalViewHolder.Status.setBackgroundColor(android.R.color.holo_green_dark);
                finalViewHolder.accept.setVisibility(View.INVISIBLE);
                finalViewHolder.decline.setVisibility(View.INVISIBLE);

            }else if(Status.equals("Declined")){
                finalViewHolder.Status.setBackgroundColor(android.R.color.holo_red_dark);
            finalViewHolder.accept.setVisibility(View.INVISIBLE);
            finalViewHolder.decline.setVisibility(View.INVISIBLE);

        }


            viewHolder.accept.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    Toast.makeText(getApplicationContext(), "accept", Toast.LENGTH_SHORT).show();
                    String msg = "accept";

                    String assignID = parkingList.get(position).getAssignID();
                    String EID = parkingList.get(position).getEID();
                    String Job = parkingList.get(position).getJob();
                    String JLocation = parkingList.get(position).getJLocation();
                    String JLocation_lat = parkingList.get(position).getJLocation_lat();
                    String JLocation_longi = parkingList.get(position).getJLocation_longi();
                    String Instructions = parkingList.get(position).getInstructions();
                    String Special = parkingList.get(position).getSpecial();
                    String Contact = parkingList.get(position).getContact();
                    String Roster_Cycle = parkingList.get(position).getRoster_Cycle();
                    String StartTime = parkingList.get(position).getStartTime();
                    String EndTime = parkingList.get(position).getEndTime();
                    String JobID = parkingList.get(position).getJobID();


                    Boolean success = Update(msg,assignID);
                    Toast.makeText(getApplicationContext(), success.toString(), Toast.LENGTH_SHORT).show();

                    if(success==true) {

                            try {
                                Connection conn1 = connectionClass.CONN();
                                String query3 = "Insert into Roster(EID,Job,JLocation,JLocation_lat,JLocation_longi,Instructions,Contact,Roster_Cycle,JobStatus,JobID,StartTime,EndTime) " +
                                        "Values (" +
                                        "'" + EID + "'," +
                                        "'" + Job + "'," +
                                        "'" + JLocation + "'," +
                                        "'" + JLocation_lat + "'," +
                                        "'" + JLocation_longi + "'," +
                                        "'" + Instructions + "'," +
                                        "'" + Contact + "'," +
                                        "'" + Roster_Cycle + "'," +
                                        "'Not Completed '," +
                                        "'" + JobID + "'," +
                                        "'" + StartTime + "'," +
                                        "'"+EndTime+"')";


                                Toast.makeText(Task_Acceptance.this, "exe1", Toast.LENGTH_LONG).show();


                                Statement statement2 = conn1.createStatement();
                                statement2.executeQuery(query3);
                                Toast.makeText(Task_Acceptance.this, " exe2", Toast.LENGTH_LONG).show();

                            } catch (Exception e) {
                                e.printStackTrace();
                                Writer writer = new StringWriter();
                                e.printStackTrace(new PrintWriter(writer));

                            }
                    }

                }
            });


            viewHolder.decline.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    String msg = "decline";

                    String assignID = parkingList.get(position).getAssignID();
                    String EID = parkingList.get(position).getEID();
                    String Job = parkingList.get(position).getJob();
                    String JLocation = parkingList.get(position).getJLocation();
                    String JLocation_lat = parkingList.get(position).getJLocation_lat();
                    String JLocation_longi = parkingList.get(position).getJLocation_longi();
                    String Instructions = parkingList.get(position).getInstructions();
                    String Special = parkingList.get(position).getSpecial();
                    String Contact = parkingList.get(position).getContact();
                    String Roster_Cycle = parkingList.get(position).getRoster_Cycle();
                    String StartTime = parkingList.get(position).getStartTime();
                    String EndTime = parkingList.get(position).getEndTime();
                    String JobID = parkingList.get(position).getJobID();
                    String Status = parkingList.get(position).getStatus();
                    Boolean success = Update(msg,assignID);
                    if(success==true) {

                        try {
                            Connection conn1 = connectionClass.CONN();
                            String query3 = "Insert into DeclinedRoster(EID,Job,JLocation,JLocation_lat,JLocation_longi,Instructions,Contact,Roster_Cycle,JobStatus,JobID,StartTime,EndTime) " +
                                    "Values (" +
                                    "'" + EID + "'," +
                                    "'" + Job + "'," +
                                    "'" + JLocation + "'," +
                                    "'" + JLocation_lat + "'," +
                                    "'" + JLocation_longi + "'," +
                                    "'" + Instructions + "'," +
                                    "'" + Contact + "'," +
                                    "'" + Roster_Cycle + "'," +
                                    "'Declined'," +
                                    "'" + JobID + "'," +
                                    "'" + StartTime + "'," +
                                    "'"+EndTime+"')";


                            Toast.makeText(Task_Acceptance.this, "exe1", Toast.LENGTH_LONG).show();

                            Statement statement2 = conn1.createStatement();
                            statement2.executeQuery(query3);
                            Toast.makeText(Task_Acceptance.this, " exe2", Toast.LENGTH_LONG).show();

                        } catch (Exception e) {
                            e.printStackTrace();
                            Writer writer = new StringWriter();
                            e.printStackTrace(new PrintWriter(writer));

                        }

                    }
                }
            });
            return rowView;
        }
    }

    private Boolean Update(String msg,String AssignID) {
        if(msg=="accept"){
            Connection conn = connectionClass.CONN();

            String query4 = "UPDATE AssignRoster SET Status = 'Accepted' WHERE AssignID = '" + AssignID + "'";

            Statement statement1 = null;
            try {
                statement1 = conn.createStatement();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                statement1.executeQuery(query4);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }else if(msg=="decline"){
            Connection conn = connectionClass.CONN();

            String query4 = "UPDATE AssignRoster SET Status = 'Declined' WHERE AssignID = '" + AssignID + "'";

            Statement statement1 = null;
            try {
                statement1 = conn.createStatement();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                statement1.executeQuery(query4);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return true;
    }
}