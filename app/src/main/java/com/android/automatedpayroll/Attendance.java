package com.android.automatedpayroll;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.location.Location;
import android.os.Bundle;
import android.os.Handler;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
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
import java.util.Date;
import java.util.Locale;
import java.util.Timer;
import java.util.TimerTask;

public class Attendance extends AppCompatActivity {
    String Cdate = new SimpleDateFormat("yyyy-MM-dd HH:mm", Locale.getDefault()).format(new Date());
    TextView date, time, details, reminder,attenddetails;
    String Ctime = new SimpleDateFormat("h:mm a", Locale.getDefault()).format(new Date());
    private ConnectionClass connectionClass;
    String username, WID;
    String location, start, end, locationLongi, locationLat;
    String StartTime,Startdatetime,Enddatetime;
    String EndTime, Date;
    Button clockIn, clockOut;
    private GPS_Tracker gpsTracker;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_attendance);
        username = getIntent().getStringExtra("username");

        date = findViewById(R.id.date);
        time = findViewById(R.id.time);
        details = findViewById(R.id.Details);
        reminder = findViewById(R.id.reminder);
        clockIn = findViewById(R.id.StartBtn);
        clockOut = findViewById(R.id.EndBtn);
        attenddetails = findViewById(R.id.details2);
        date.setText(Cdate);
        time.setText(Ctime);

        connectionClass = new ConnectionClass();

        try {
            Connection conn = connectionClass.CONN(); //Connection Object


            String query1 = "SELECT * FROM Work WHERE EID = '" + username + "'";
            String query2 = "SELECT a.* from Attendance a,DateDiff d where a.EID = '"+username+"' AND d.Date = convert(varchar(10), '"+Cdate+"', 120)";


            Statement stmt1 = conn.createStatement();
            Statement stmt2 = conn.createStatement();

            ResultSet rs = stmt1.executeQuery(query1);
            ResultSet rs2 = stmt2.executeQuery(query2);


            if (rs != null) // if resultset not null, I add items to itemArraylist using class created
            {
                while (rs.next()) {
                    try {
                        WID = rs.getString("WID");
                        location = rs.getString("Location");
                        locationLat = rs.getString("LocationLat");
                        locationLongi = rs.getString("LocationLongi");
                        start = rs.getString("StartTime");
                        end = rs.getString("EndTime");
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                }

            }
            if (rs2 != null) // if resultset not null, I add items to itemArraylist using class created
            {
                while (rs2.next()) {
                    try {
                         Startdatetime = rs2.getString("StartDateTime");
                        Enddatetime = rs2.getString("EndDateTime");

                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                }

            }

        } catch (Exception e) {
            e.printStackTrace();
            Writer writer = new StringWriter();
            e.printStackTrace(new PrintWriter(writer));

        }


        details.setText("Work Location: " + location + "\n" +
                "Start Time: " + start + "\n" +
                "End Time: " + end);

        reminder.setText("Quick reminders!!");


        if(Startdatetime != null && Enddatetime == null){
            attenddetails.setText("You already clocked in to work !!");
            clockIn.setEnabled(false);
        }
        else if(Startdatetime != null && Enddatetime != null){
            attenddetails.setText("Attendance is done for the day !!");

            clockIn.setEnabled(false);
            clockOut.setEnabled(false);

        }else{
            attenddetails.setText("Mark your attendance from here");

        }
        clockIn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                ClockIn(locationLat, locationLongi, start, end, WID, Date);
                clockIn.setEnabled(false);
            }
        });
        clockOut.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                clockOut(locationLat, locationLongi, start, end, WID, Date);
                clockOut.setEnabled(false);
            }
        });
    }


    private void ClockIn(final String locationLat, final String locationLongi, String start, String end, String WID, String Date) {
        try {
            Connection conn = connectionClass.CONN();

            gpsTracker = new GPS_Tracker(Attendance.this, Attendance.this);
            if (Date == null) {
                if (gpsTracker.canGetLocation()) {

                    final Double lat = latitudelocation();
                    final Double longi = longitudelocation();

                    boolean getstatus = getStatus(lat, longi, locationLat, locationLongi);


                    if (getstatus == true) {
                        StartTime = new SimpleDateFormat("HH:mm", Locale.getDefault()).format(new Date());
                        String query3 = "Insert into Attendance(WID,EID,StartDateTime,Mark) " +
                                "Values (" +
                                "'" + WID + "'," +
                                "'" + username + "'," +
                                "'" + Cdate + "'," +
                                "'0')";


                        Statement statement2 = conn.createStatement();
                        statement2.executeQuery(query3);

                        final Handler handler = new Handler();
                        Timer timer = new Timer();
                        TimerTask doAsynchronousTask = new TimerTask() {
                            @Override
                            public void run() {
                                handler.post(new Runnable() {
                                    public void run() {
                                        try {
                                            boolean getstatus = getStatus(lat, longi, locationLat, locationLongi);
                                            if (getstatus == false) {
                                                notification();
                                            }
                                        } catch (Exception e) {
                                        }
                                    }
                                });
                            }
                        };
                        timer.schedule(doAsynchronousTask, 0, 600000);


                    } else {
                        AlertDialog.Builder builder
                                = new AlertDialog
                                .Builder(Attendance.this);

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
                                                                int which) {

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


                }

            } else {

            }
        } catch (Exception e) {
            e.printStackTrace();
            Writer writer = new StringWriter();
            e.printStackTrace(new PrintWriter(writer));
        }
    }

    private void clockOut(String locationLat, String locationLongi, String start, String end, String wid, String date) {
        try {
            Connection conn = connectionClass.CONN();

            gpsTracker = new GPS_Tracker(Attendance.this, Attendance.this);
            if (end != null) {
                if (gpsTracker.canGetLocation()) {

                    final Double lat = latitudelocation();
                    final Double longi = longitudelocation();

                    boolean getstatus = getStatus(lat, longi, locationLat, locationLongi);


                    if (getstatus == true) {
                        EndTime = new SimpleDateFormat("HH:mm", Locale.getDefault()).format(new Date());
                        String query3 = "UPDATE Attendance " +
                                "SET EndDateTime = '" + Cdate + "', Mark = '1'" +
                                " WHERE EID='" + username + "' AND WID = '" + wid + "'";


                        Statement statement2 = conn.createStatement();
                        statement2.executeQuery(query3);



                    } else {
                        Toast.makeText(Attendance.this, "False", Toast.LENGTH_LONG).show();

                    }


                }

            } else {
                Toast.makeText(Attendance.this, "False", Toast.LENGTH_LONG).show();

            }
        } catch (Exception e) {
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

        if (isWithin10km == true) {
            return true;
        } else {
            return false;
        }


    }

    private void notification() {
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
                .Builder(Attendance.this);

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
                                                int which) {

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

    private double latitudelocation() {
        gpsTracker = new GPS_Tracker(Attendance.this, Attendance.this);
        double latitude = gpsTracker.getLatitude();


        return latitude;

    }

    private double longitudelocation() {
        gpsTracker = new GPS_Tracker(Attendance.this, Attendance.this);
        double longitude = gpsTracker.getLongitude();
        return longitude;
    }
}
