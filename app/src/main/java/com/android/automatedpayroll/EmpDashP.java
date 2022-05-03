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

public class EmpDashP extends AppCompatActivity {

    Button signOut, more, pendingtasks, task, contactUs, resources, report, changepassword, profile, paymentHistory, RosterHistory, leave, attendance, resign;
    String username;
    private ConnectionClass connectionClass;
    String ename, roster, pending, location, Start, End;
    int leaveM, casual, nopay, sick, maternity, annual;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_emp_dash_p);
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


        signOut = findViewById(R.id.loginOut);

        signOut.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(EmpDashP.this, EmpLogin.class);
                intent.putExtra("username", username);

                startActivity(intent);

            }
        });
        profile = findViewById(R.id.profile);
        profile.setText("Welcome " + ename);
        profile.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(EmpDashP.this, Profile.class);
                intent.putExtra("username", username);

                startActivity(intent);

            }
        });


        contactUs = findViewById(R.id.contact);

        contactUs.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(EmpDashP.this, ContactUs.class);
                intent.putExtra("username", username);

                startActivity(intent);

            }
        });

        resources = findViewById(R.id.resourses);

        resources.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(EmpDashP.this, Resources.class);
                intent.putExtra("username", username);
                startActivity(intent);

            }
        });

        report = findViewById(R.id.report);

        report.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(EmpDashP.this, ReportIncident.class);
                intent.putExtra("username", username);

                startActivity(intent);

            }
        });

        changepassword = findViewById(R.id.changePassword);

        changepassword.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(EmpDashP.this, ChangePassword.class);
                intent.putExtra("username", username);

                startActivity(intent);

            }
        });


        paymentHistory = findViewById(R.id.paymentHistory);

        paymentHistory.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(EmpDashP.this, Payment.class);
                intent.putExtra("username", username);

                startActivity(intent);
            }
        });

        leave = findViewById(R.id.leave);

        try {
            Connection conn1 = connectionClass.CONN(); //Connection Object

            String query1 = "Select distinct sum(lm.Annual+lm.Maternity+lm.NoPay+lm.Casual+lm.Sick) as count, e.Ename,et.Type,lm.Annual,lm.Maternity,lm.NoPay,lm.Casual,lm.Sick " +
                    "From LeaveManagment lm,EmployeeLeaves el,Employee e,EmployementTypes et " +
                    "Where e.EID = el.EID AND e.EID = '" + username + "' And et.EmpTID = lm.EmpTID " +
                    "Group by  e.Ename,et.Type,lm.Annual,lm.Maternity,lm.NoPay,lm.Casual,lm.Sick";


            Statement stmt1 = conn1.createStatement();

            ResultSet rs = stmt1.executeQuery(query1);


            if (rs != null) // if resultset not null, I add items to itemArraylist using class created
            {
                while (rs.next()) {
                    try {
                        annual = rs.getInt("Annual");
                        maternity = rs.getInt("Maternity");
                        casual = rs.getInt("Casual");
                        sick = rs.getInt("Sick");
                        nopay = rs.getInt("NoPay");
                        nopay = rs.getInt("NoPay");
                        leaveM = rs.getInt("count");
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                }

            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        if (leaveM == 0) {
            leave.setText("Sorry You don't have leaves");
            leave.setEnabled(false);

        } else {
            leave.setText("You have " + leaveM + " accepteble leaves\n Annual " + annual);

        }
        leave.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(EmpDashP.this, LeaveManagment.class);
                intent.putExtra("username", username);

                startActivity(intent);
            }
        });

        attendance = findViewById(R.id.attendance);
        attendance.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(EmpDashP.this, Attendance.class);
                intent.putExtra("username", username);

                startActivity(intent);
            }
        });


        resign = findViewById(R.id.resign);
        resign.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(EmpDashP.this, Resign.class);
                intent.putExtra("username", username);

                startActivity(intent);
            }
        });
    }


}