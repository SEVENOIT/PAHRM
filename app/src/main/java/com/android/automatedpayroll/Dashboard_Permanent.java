package com.android.automatedpayroll;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;

import com.android.automatedpayroll.Connection.ConnectionClass;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.Writer;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class Dashboard_Permanent extends AppCompatActivity {

    Button signOut, more, profile, paymentHistory, RosterHistory, leave, attendance, resign;
    String username;
    TextView name,day, dateNow;
    ImageView imageView;
    private ConnectionClass connectionClass;
    String ename, roster, pending, location, Start, End;

    DateFormat df = new SimpleDateFormat("dd, MMM YYYY, h:mm a");
    String date = df.format(Calendar.getInstance().getTime());

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_dashboard_permanent);
        username = getIntent().getStringExtra("username");
        connectionClass = new ConnectionClass();

        try {
            Connection conn = connectionClass.CONN(); //Connection Object


            String query1 = "SELECT * FROM Employee WHERE EID = '" + username + "'";


            Statement stmt1 = conn.createStatement();

            ResultSet rs = stmt1.executeQuery(query1);


            if (rs != null) // if resultset not null, I add items to itemArraylist using class created
            {
                while (rs.next()) {
                    try {
                        ename = rs.getString("Ename");
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

        imageView = findViewById(R.id.imageView3);

        day = findViewById(R.id.day);
        Calendar c = Calendar.getInstance();
        int timeOfDay = c.get(Calendar.HOUR_OF_DAY);

        if (timeOfDay >= 0 && timeOfDay < 12) {
            day.setText("Good Morning !!");
            imageView.setImageResource(R.drawable.sun);
        } else if (timeOfDay >= 12 && timeOfDay < 16) {
            day.setText("Good Afternoon !!");
            imageView.setImageResource(R.drawable.sunsets);
        } else if (timeOfDay >= 16 && timeOfDay < 21) {
            day.setText("Good Evening !!");
            imageView.setImageResource(R.drawable.sunsets);
        } else if (timeOfDay >= 21 && timeOfDay < 24) {
            day.setText("Good Night !!");
            imageView.setImageResource(R.drawable.night);
        }

        dateNow = findViewById(R.id.date);
        dateNow.setText(date);


        signOut = findViewById(R.id.signout);

        signOut.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(Dashboard_Permanent.this, EmpLogin.class);
                intent.putExtra("username", username);

                startActivity(intent);

            }
        });
        profile = findViewById(R.id.profile);

        name = findViewById(R.id.name);
        name.setText(ename);

        profile.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(Dashboard_Permanent.this, Profile.class);
                intent.putExtra("username", username);

                startActivity(intent);

            }
        });

        leave = findViewById(R.id.leave);
        leave.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(Dashboard_Permanent.this, LeaveManagment.class);
                intent.putExtra("username", username);

                startActivity(intent);
            }
        });

        attendance = findViewById(R.id.att);
        attendance.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(Dashboard_Permanent.this, Attendance.class);
                intent.putExtra("username", username);

                startActivity(intent);
            }
        });

        more = findViewById(R.id.more);
        more.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(Dashboard_Permanent.this, MoreOpt.class);
                intent.putExtra("username", username);

                startActivity(intent);
            }
        });


    }


}