package com.android.automatedpayroll;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;

import com.android.automatedpayroll.Connection.ConnectionClass;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.Writer;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class EmpDashboard extends AppCompatActivity {

    Button signOut,more,pendingtasks,task,contactUs,resources,report,changepassword,profile,paymentHistory,RosterHistory,leave;
    String username;
    private ConnectionClass connectionClass;
    String ename,roster,pending,leaveM;

   

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_emp_dashboard);
        username = getIntent().getStringExtra("username");
         connectionClass = new ConnectionClass();

        try {
            Connection conn = connectionClass.CONN(); //Connection Object


                String query1 = "SELECT * FROM Employee WHERE EID = '"+username+"'";


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
        try{
    Connection conn1 = connectionClass.CONN(); //Connection Object

    String query1 = "SELECT distinct Count(JobStatus) as Count FROM Roster WHERE EID ='"+username+"'  AND JobStatus = 'Not Completed'";


    Statement stmt1 = conn1.createStatement();

    ResultSet rs = stmt1.executeQuery(query1);


    if (rs != null) // if resultset not null, I add items to itemArraylist using class created
    {
        while (rs.next()) {
            try {
                roster = rs.getString("Count");
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }

    }

} catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        // final String password = getIntent().getStringExtra("password");
        try{
            Connection conn1 = connectionClass.CONN(); //Connection Object

            String query1 = "SELECT distinct Count(Status) as Count FROM AssignRoster WHERE EID ='"+username+"'  AND Status = 'Pending'";


            Statement stmt1 = conn1.createStatement();

            ResultSet rs = stmt1.executeQuery(query1);


            if (rs != null) // if resultset not null, I add items to itemArraylist using class created
            {
                while (rs.next()) {
                    try {
                        pending = rs.getString("Count");
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                }

            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        pendingtasks = findViewById(R.id.attendance);
        int pendingint = Integer.parseInt(pending);

        if(pendingint==1){
            pendingtasks.setText(pending+ " task pending");

        }else if(pendingint==0){
            pendingtasks.setText("Hurray no tasks are pending");

        }else {
            pendingtasks.setText(pending+ " tasks pending");

        }

        pendingtasks.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(EmpDashboard.this,Task_Acceptance.class);
                intent.putExtra("username", username);

                startActivity(intent);

            }
        });


        signOut = findViewById(R.id.loginOut);

        signOut.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(EmpDashboard.this,EmpLogin.class);
                intent.putExtra("username", username);

                startActivity(intent);

            }
        });
        profile = findViewById(R.id.profile);
profile.setText("Welcome "+ename );
         profile.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(EmpDashboard.this,Profile.class);
                intent.putExtra("username", username);

                startActivity(intent);

            }
        });


        task = findViewById(R.id.roster);
        int rosterint = Integer.parseInt(roster);
        if(rosterint==1){
            task.setText("You Have "+roster+ " task to complete");

        }else if(rosterint==0){
            task.setText("Hurray all tasks are completed");

        }else {
            task.setText("You Have "+roster+ " tasks to complete");

        }

        task.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {


                Intent intent = new Intent(EmpDashboard.this,Task.class);
                intent.putExtra("username", username);
                startActivity(intent);

            }
        });



        contactUs = findViewById(R.id.contact);

        contactUs.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(EmpDashboard.this,ContactUs.class);
                intent.putExtra("username", username);

                startActivity(intent);

            }
        });

        resources = findViewById(R.id.resourses);

        resources.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(EmpDashboard.this,Resources.class);
                intent.putExtra("username", username);
                startActivity(intent);

            }
        });

        report = findViewById(R.id.report);

        report.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(EmpDashboard.this,ReportIncident.class);
                intent.putExtra("username", username);

                startActivity(intent);

            }
        });

        changepassword = findViewById(R.id.changePassword);

        changepassword.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(EmpDashboard.this,ChangePassword.class);
                intent.putExtra("username", username);

                startActivity(intent);

            }
        });

        RosterHistory = findViewById(R.id.RosterHistory);

        RosterHistory.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(EmpDashboard.this,RosterHistory.class);
                intent.putExtra("username", username);

                startActivity(intent);
            }
        });

        paymentHistory = findViewById(R.id.paymentHistory);

        paymentHistory.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(EmpDashboard.this,Payment.class);
                intent.putExtra("username", username);

                startActivity(intent);
            }
        });

        leave = findViewById(R.id.leave);

        try{
            Connection conn1 = connectionClass.CONN(); //Connection Object

            String query1 = "SELECT distinct Leaves FROM Employee WHERE EID ='"+username+"'";


            Statement stmt1 = conn1.createStatement();

            ResultSet rs = stmt1.executeQuery(query1);


            if (rs != null) // if resultset not null, I add items to itemArraylist using class created
            {
                while (rs.next()) {
                    try {
                        leaveM = rs.getString("Leaves");
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                }

            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        int Leavesint = Integer.parseInt(leaveM);

        if(Leavesint==0){
            leave.setText("Sorry You don't have leaves");
            leave.setEnabled(false);

        }else {
            leave.setText("You have "+leaveM+ " accepteble leaves");

        }
        leave.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(EmpDashboard.this,LeaveManagment.class);
                intent.putExtra("username", username);

                startActivity(intent);
            }
        });
    }


}