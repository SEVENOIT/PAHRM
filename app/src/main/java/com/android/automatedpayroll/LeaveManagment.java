package com.android.automatedpayroll;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioButton;

import com.android.automatedpayroll.Connection.ConnectionClass;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.Writer;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class LeaveManagment extends AppCompatActivity {
    private ConnectionClass connectionClass;

    int LeaveType, hours, tot, leaveHours, currentLeaveStatus;
    String username, type;
    EditText name, department, manager, days, date, reason;
    RadioButton r1, r2, r3, r4, r5;
    Button submit;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_leave_managment);
        username = getIntent().getStringExtra("username");

        name = findViewById(R.id.name2);
        department = findViewById(R.id.Department);
        manager = findViewById(R.id.Manager);
        days = findViewById(R.id.date2);
        date = findViewById(R.id.days2);
        reason = findViewById(R.id.reason2);

        r1 = findViewById(R.id.radio_B1);
        r2 = findViewById(R.id.radio_B2);
        r3 = findViewById(R.id.radio_B3);
        r4 = findViewById(R.id.radio_B4);
        r5 = findViewById(R.id.radio_B5);

        submit = findViewById(R.id.send);

         submit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                try {
                    Connection conn = connectionClass.CONN(); //Connection Object
                    if (conn == null) {

                    } else {
                        if (r1.isChecked()) {
                            type = "Annual";
                        } else if (r2.isChecked()) {
                            type = "Casual";
                        } else if (r3.isChecked()) {
                            type = "Sick";
                        } else if (r4.isChecked()) {
                            type = "Maternity";
                        } else if (r5.isChecked()) {
                            type = "NoPay";
                        }
                        // Change below query according to your own database.
                        String query1 = "Select distinct e.ContractType, DATEDIFF(hour,w.StartTime, w.EndTime)As diff, e.Ename,et.Type,lm.'" + type + "' as type, el.Sick as leaveType  " +
                                "From LeaveManagment lm,EmployeeLeaves el,Employee e,EmployementTypes et " +
                                "Where e.EID = el.EID AND e.EID = '" + username + "' And et.EmpTID = lm.EmpTID ";

                        Statement stmt1 = conn.createStatement();

                        ResultSet rs1 = stmt1.executeQuery(query1);

                        if (rs1 != null) // if resultset not null, I add items to itemArraylist using class created
                        {
                            while (rs1.next()) {
                                try {
                                    LeaveType = rs1.getInt("type");
                                    hours = rs1.getInt("diff");
                                    leaveHours = rs1.getInt("leaveType");

                                } catch (Exception ex) {
                                    ex.printStackTrace();
                                }
                            }

                        }

                        String value= days.getText().toString();
                        final int NoOfDays =Integer.parseInt(value);

                        tot = NoOfDays * hours;

                        currentLeaveStatus = leaveHours + tot;
                        String query2 = "UPDATE LeaveManagment " +
                                "SET'" + LeaveType + "' = '" + currentLeaveStatus + "' " +
                                "WHERE EID='" + username + "' ";


                        Statement statement2 = conn.createStatement();
                        statement2.executeQuery(query2);

                        String query3 = "Insert into LeaveManagmentDetails(EID,EmpName,Department,Manager,LeaveType,NoOfDays,Date,Reason) " +
                                "Values (" +
                                "'" + username + "'," +
                                "'" + name.getText() + "'," +
                                "'" + department.getText() + "'," +
                                "'" + manager.getText() + "'," +
                                "'" + type + "' ," +
                                "'" + days.getText() + "' ," +
                                "'" + date.getText() + "' ," +
                                "'" + reason.getText() + "')";

                        Statement stmt3 = conn.createStatement();
                        stmt3.executeQuery(query3);
                    }


                } catch (Exception e) {
                    e.printStackTrace();
                    Writer writer = new StringWriter();
                    e.printStackTrace(new PrintWriter(writer));

                }
                    Intent intent;


                        intent = new Intent(LeaveManagment.this, Dashboard_Permanent.class);
                        intent.putExtra("username", username);
                        startActivity(intent);


            }
        });
    }
}
