package com.android.automatedpayroll;

import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.location.Location;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
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
import java.util.Timer;
import java.util.TimerTask;

//import static net.sourceforge.jtds.util.Logger.println;

public class Task extends AppCompatActivity {

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
        setContentView(R.layout.activity_task);


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


        Task.SyncData orderData = new SyncData();
        orderData.execute("");


    }

    private class SyncData extends AsyncTask<String, String, String> {
        String msg = "Internet/DB_Credentials/Windows_FireWall_TurnOn Error, See Android Monitor in the bottom For details!";
        ProgressDialog progress;

        @Override
        protected void onPreExecute() //Starts the progress dailog
        {
            progress = ProgressDialog.show(Task.this, "Synchronising",
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

                    String query1 = "SELECT * FROM Roster WHERE EID = '" + username + "' AND JobStatus = 'Not Completed'";


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
            Toast.makeText(Task.this, msg + "", Toast.LENGTH_LONG).show();
            if (success == false) {
            } else {
                try {
                    myAppAdapter = new MyAppAdapter(itemArrayList, Task.this);
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
            ViewHolder viewHolder = null;
            if (rowView == null) {
                LayoutInflater inflater = getLayoutInflater();
                rowView = inflater.inflate(R.layout.task_list_content, parent, false);
                viewHolder = new ViewHolder();
                viewHolder.start = (Button) rowView.findViewById(R.id.startBtn);
                viewHolder.end = (Button) rowView.findViewById(R.id.endBtn);

                viewHolder.rid = (TextView) rowView.findViewById(R.id.RosterID);
                viewHolder.job = (TextView) rowView.findViewById(R.id.job);
                viewHolder.jlocation = (TextView) rowView.findViewById(R.id.location);
                viewHolder.date = (TextView) rowView.findViewById(R.id.timedate);
                viewHolder.description = (TextView) rowView.findViewById(R.id.description);

                rowView.setTag(viewHolder);
            } else {
                viewHolder = (ViewHolder) convertView.getTag();
            }
            // here setting up names and images
            viewHolder.rid.setText(parkingList.get(position).getRosterID()+ "");
            viewHolder.job.setText(parkingList.get(position).getJob() + "");
            viewHolder.jlocation.setText(parkingList.get(position).getJlocation() + "");
            viewHolder.date.setText(parkingList.get(position).getDate() + "");
            viewHolder.description.setText(parkingList.get(position).getDescription() + "");

            final ViewHolder finalViewHolder = viewHolder;
            viewHolder.start.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    Toast.makeText(getApplicationContext(), "start", Toast.LENGTH_SHORT).show();
                    String msg = "start";

                    String location = parkingList.get(position).getDate();
                    String date = parkingList.get(position).getDescription();
                    String rid = parkingList.get(position).getJob();

                    Toast.makeText(getApplicationContext(), rid, Toast.LENGTH_SHORT).show();

                    getLocation(msg,date,rid,location);

                    finalViewHolder.start.setEnabled(false);

                }
            });


            viewHolder.end.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    Toast.makeText(getApplicationContext(), "end", Toast.LENGTH_SHORT).show();
                    String msg = "end";

                    String location = parkingList.get(position).getDate();
                    String date = parkingList.get(position).getDescription();
                    String rid = parkingList.get(position).getJob();


                    Toast.makeText(getApplicationContext(), rid, Toast.LENGTH_SHORT).show();

                    getLocation(msg,date,rid,location);

                    finalViewHolder.end.setEnabled(false);
                    Connection conn1 = connectionClass.CONN();

                    String query4 = "UPDATE Roster SET JobStatus = 'Completed' WHERE RosterID = '"+rid +"'";

                    Statement statement1 = null;
                    try {
                        statement1 = conn1.createStatement();
                    } catch (SQLException throwables) {
                        throwables.printStackTrace();
                    }
                    try {
                        statement1.executeQuery(query4);
                    } catch (SQLException throwables) {
                        throwables.printStackTrace();
                    }



                    Intent intent = new Intent(Task.this, EmpDashboard.class);
                    intent.putExtra("username", username);

                    startActivity(intent);

                    Toast.makeText(Task.this, "Job Completed !!", Toast.LENGTH_LONG).show();
                }
            });
            return rowView;
        }
    }


    public void getLocation(String msg,String date,String rid,String location) {
        try {
            Connection conn = connectionClass.CONN();

            String query2 = "SELECT * FROM Roster WHERE EID = '" + username +  "'AND RosterID = '"+rid+ "'";


            Toast.makeText(Task.this, "quary", Toast.LENGTH_LONG).show();

            Statement stmt2 = conn.createStatement();

            ResultSet rs1 = stmt2.executeQuery(query2);

            Toast.makeText(Task.this, "resultsset", Toast.LENGTH_LONG).show();

            if(rs1.next()) {

                gpsTracker = new GPS_Tracker(Task.this,Task.this);

                if (gpsTracker.canGetLocation()) {
                    final double Lat = gpsTracker.getLatitude();
                    final double Lng = gpsTracker.getLongitude();
                    //String date = rs1.getString("Roster_Cycle");
                   // String rid= rs1.getString("RosterID");
                    final String JLocation_lat= rs1.getString("JLocation_lat");
                    final String JLocation_longi= rs1.getString("JLocation_longi");



                    boolean getstatus =  getStatus(Lat,Lng,JLocation_lat,JLocation_longi);
                     /*if(getstatus == true){
                        Toast.makeText(Task.this, "true", Toast.LENGTH_LONG).show();
                    }else {
                        Toast.makeText(Task.this, "false", Toast.LENGTH_LONG).show();
                    }*/


                    if (date.equals(Cdate)&& getstatus == true && msg == "start") {
                        Toast.makeText(Task.this, "cdate " + Cdate, Toast.LENGTH_LONG).show();
                         StartTime = new SimpleDateFormat("HH:mm", Locale.getDefault()).format(new Date());
                        Toast.makeText(Task.this, StartTime, Toast.LENGTH_LONG).show();

                        lat = latitudelocation();
                        longi = longitudelocation();

                        start_Lat = String.valueOf(lat);
                        start_long = String.valueOf(longi);

                        final Handler handler = new Handler();
                        Timer timer = new Timer();
                        TimerTask doAsynchronousTask = new TimerTask() {
                            @Override
                            public void run() {
                                handler.post(new Runnable() {
                                    public void run() {
                                        try {
                                            boolean getstatus =  getStatus(Lat,Lng,JLocation_lat,JLocation_longi);
                                            if(getstatus==false){
                                                notification();
                                            }
                                        } catch (Exception e) {
                                        }
                                    }
                                });
                            }
                        };
                        timer.schedule(doAsynchronousTask, 0, 600000);

                    }
                    if(date.equals(Cdate)&& getstatus == true && msg == "end"){

                        EndTime = new SimpleDateFormat("HH:mm", Locale.getDefault()).format(new Date());
                        lat = latitudelocation();
                        longi = longitudelocation();

                        String end_lat = String.valueOf(lat);
                        String end_long = String.valueOf(longi);


                        insertData(rid, StartTime, EndTime, start_Lat, start_long,  end_lat, end_long,JLocation_lat,JLocation_longi,date,location);


                    }


                    }if(!date.equals(Cdate)){
                    AlertDialog.Builder builder
                            = new AlertDialog
                            .Builder(Task.this);

                    // Set the message show for the Alert time
                    builder.setMessage("Not in assigned date !!");

                    // Set Alert Title
                    builder.setTitle("Alert !!");

                    // Set Cancelable false
                    // for when the user clicks on the outside
                    // the Dialog Box then it will remain show
                    builder.setCancelable(false);

                    // Set the positive button with yes name
                    // OnClickListener method is use of
                    // DialogInterface interface.


                    builder
                            .setNegativeButton(
                                    "Ok",
                                    new DialogInterface
                                            .OnClickListener() {

                                        @Override
                                        public void onClick(DialogInterface dialog,
                                                            int which)
                                        {

                                            // If user click no
                                            // then dialog box is canceled.
                                            dialog.cancel();
                                        }
                                    });

                    // Create the Alert dialog
                    AlertDialog alertDialog = builder.create();

                    // Show the Alert Dialog box
                    alertDialog.show();                    }

                } else {
                    //gpsTracker.showSettingsAlert();
                }

            } catch(Exception e){
                e.printStackTrace();
                Writer writer = new StringWriter();
                e.printStackTrace(new PrintWriter(writer));
            }


    }

    private boolean getStatus(double lat, double lng, String JLocation_lat, String JLocation_longi) {
        double givenLat = Double.parseDouble(JLocation_lat);
        double givenLong = Double.parseDouble(JLocation_longi);

        float[] results = new float[1];
        Location.distanceBetween(givenLat, givenLong, lat, lng, results);
        float distanceInMeters = results[0];
        boolean isWithin10km = distanceInMeters < 10000;

        if(isWithin10km==true){
            return true;
        }else{
            return false;
        }


    }

    private void notification(){
       /* NotificationCompat.Builder builder =
                new NotificationCompat.Builder(this)
                        .setSmallIcon(R.drawable.notificationbell) //set icon for notification
                        .setContentTitle("Notifications Example") //set title of notification
                        .setContentText("This is a notification message")//this is notification message
                        .setAutoCancel(true) // makes auto cancel of notification
                        .setPriority(NotificationCompat.PRIORITY_DEFAULT); //set priority of notification


        Intent notificationIntent = new Intent(this, Task.class);
        notificationIntent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
        //notification message will get at NotificationView
        notificationIntent.putExtra("message", "This is a notification message");

        PendingIntent pendingIntent = PendingIntent.getActivity(this, 0, notificationIntent,
                PendingIntent.FLAG_UPDATE_CURRENT);
        builder.setContentIntent(pendingIntent);

        // Add as notification
        NotificationManager manager = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);
        manager.notify(0, builder.build());*/

        AlertDialog.Builder builder
                = new AlertDialog
                .Builder(Task.this);

        // Set the message show for the Alert time
        builder.setMessage("Location changed. Please go to the work location!!");

        // Set Alert Title
        builder.setTitle("Warning !!");

        // Set Cancelable false
        // for when the user clicks on the outside
        // the Dialog Box then it will remain show
        builder.setCancelable(false);

        // Set the positive button with yes name
        // OnClickListener method is use of
        // DialogInterface interface.


        builder
                .setNegativeButton(
                        "Ok",
                        new DialogInterface
                                .OnClickListener() {

                            @Override
                            public void onClick(DialogInterface dialog,
                                                int which)
                            {

                                // If user click no
                                // then dialog box is canceled.
                                dialog.cancel();
                            }
                        });

        // Create the Alert dialog
        AlertDialog alertDialog = builder.create();

        // Show the Alert Dialog box
        alertDialog.show();
    }


    private void insertData(String rid, String startTime, String endTime, String scurrent_lat, String scurrent_longi, String ecurrent_lat, String ecurrent_longi, String jLocation_lat, String jLocation_longi, String date,String location) {
        try {



            Connection conn1 = connectionClass.CONN();





            /*try{*/
                /*String query3 = "Insert into Roster_tracker(" +
                        "RosterID," +
                        "EID,"+
                        "JLocation_lat," +
                        "JLocation_longi," +
                        "Start_lat," +
                        "Start_longi," +
                        "End_lat," +
                        "End_longi," +
                        "Start_time," +
                        "End_time," +
                        "Sdate," +
                        "Edate) Values(' "
                        + rid +
                        "','"
                        +username+
                        "','"
                        + jLocation_lat+
                        "','"
                        + jLocation_longi +
                        "','"
                        + scurrent_lat +
                        "','"
                        + scurrent_longi +
                        "','"
                        + ecurrent_lat +
                        "','"
                        + ecurrent_longi +
                        "','"
                        + startTime +
                        "','"
                        + endTime +
                        "','"
                        + date +
                        "','"
                        + date +
                        "')";*/



            String query3 = "Insert into Roster_tracker(RosterID,EID,JLocation,JLocation_lat,JLocation_longi,Start_lat,Start_longi,End_lat,End_longi,Start_time,End_time,Sdate,Edate,PaymentStatus) " +
                    "Values (" +
                    "'"+rid+"'," +
                    "'"+username+"'," +
                    "'"+location+"'," +
                    "'"+jLocation_lat+"'," +
                    "'"+jLocation_longi+"'," +
                    "'"+scurrent_lat+"'," +
                    "'"+scurrent_longi+"'," +
                    "'"+ecurrent_lat+"'," +
                    "'"+ecurrent_longi+"'," +
                    "'"+startTime+"'," +
                    "'"+endTime+"'," +
                    "'"+date+"'," +
                    "'"+Cdate+"'," +
                    "'Not Paid')";

                    //Toast.makeText(Task.this, "query 3 exe", Toast.LENGTH_LONG).show();
/*
            String query4 = "UPDATE Roster SET JobStatus = 'Completed' WHERE RosterID = '"+rid +"'";
*/
/*
            string a = "update Company set Admin_Password='" + TextBox3.Text + "' where CID ='" + TextBox1.Text + "'";
*/
           /* PreparedStatement preparedStatement = conn
                    .prepareStatement(query3);

            preparedStatement.executeUpdate();

            preparedStatement.close();*/
            Toast.makeText(Task.this, "exe1", Toast.LENGTH_LONG).show();

           // Statement stmt3 = conn1.createStatement();
           /* Statement statement1 = conn1.createStatement();
            statement1.executeQuery(query4);*/
            Statement statement2 = conn1.createStatement();
            statement2.executeQuery(query3);
            Toast.makeText(Task.this, " exe2", Toast.LENGTH_LONG).show();





            /*}catch (Exception e){
                Toast.makeText(Task.this, "not exe", Toast.LENGTH_LONG).show();
            }*/



        } catch (Exception e) {
            e.printStackTrace();
            Writer writer = new StringWriter();
            e.printStackTrace(new PrintWriter(writer));

        }

    }
/*"SELECT * FROM Roster WHERE EID = '" + username + "' && Roster_Cycle '"+Cdate+"'";
    private void insertData(String startTime, String current_lat, String current_longi,String JLocation_lat,String JLocation_longi,String date) {
        String query1 = "Insert into Roster_tracker(RosterID," +
                "JLocation_lat," +
                "JLocation_longi" +
                "Start_lat" +
                "Start_longi" +
                "End_lat" +
                "End_longi" +
                "Start_time" +
                "End_time" +
                "Sdate" +
                "Edate " +

                "Values ('" +
                JLocation_lat +
                "','" +
                JLocation_longi +
                "','" +
                Scurrent_lat + "','" + Scurrent_longi + "','" +



        Statement stmt1 = conn.createStatement();

        ResultSet rs = stmt1.executeQuery(query1);


        if (rs != null) // if resultset not null, I add items to itemArraylist using class created
        {
            while (rs.next())
            {
                try {
                    itemArrayList.add(new TaskListItems(rs.getString("Job"),rs.getString("Contact"),rs.getString("Instructions"),rs.getString("Roster_Cycle")));

                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
            msg = "Found";
            success = true;
        }
        if(rs == null){
            msg = "not found";
            success = false;
        }
    }*/

    private double latitudelocation(){
        gpsTracker = new GPS_Tracker(Task.this,Task.this);
        double latitude = gpsTracker.getLatitude();



        return latitude;

    }

    private double longitudelocation(){
        gpsTracker = new GPS_Tracker(Task.this,Task.this);
        double longitude = gpsTracker.getLongitude();
        return longitude;
    }
}