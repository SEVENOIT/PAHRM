package com.android.automatedpayroll;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.Toast;

import com.android.automatedpayroll.Connection.ConnectionClass;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.Writer;
import java.sql.Connection;
import java.sql.Statement;


public class ReportIncident extends AppCompatActivity {
    private ConnectionClass connectionClass;
    String username,type;
    EditText Date,Time,Location,Description;
    RadioButton yes,no;
    Button send;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_report_incident);

        username = getIntent().getStringExtra("username");

        Date = findViewById(R.id.date2);
        Time = findViewById(R.id.time2);
        Location = findViewById(R.id.location2);
        Description = findViewById(R.id.detail2);

        yes = findViewById(R.id.radioButton1);
        no = findViewById(R.id.radioButton2);





        send = findViewById(R.id.send);

        send.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                connectionClass = new ConnectionClass();

                if(yes.isChecked()){
                    type = "Yes";
                }
                else{
                    type = "No";
                }

                try
                {
                    Connection conn = connectionClass.CONN(); //Connection Object
                    if (conn == null)
                    {
                        Toast.makeText(ReportIncident.this, "Not done", Toast.LENGTH_LONG).show();

                    }
                    else {
                        Toast.makeText(ReportIncident.this, "done", Toast.LENGTH_LONG).show();

                        // Change below query according to your own database.
                        String query = "Insert into ReportIncident(EID,Isinvolved,Date,Time,Location,Description) " +
                                "Values (" +
                                "'"+username+"',"+
                                "'"+type+"',"+
                                "'"+Date.getText()+"',"+
                                "'"+Time.getText()+"',"+
                                "'"+Location.getText()+"',"+
                                "'"+Description.getText()+"')";

                        Statement stmt = conn.createStatement();
                        stmt.executeQuery(query);



                    }
                } catch (Exception e)
                {
                    e.printStackTrace();
                    Writer writer = new StringWriter();
                    e.printStackTrace(new PrintWriter(writer));
                }
                Intent intent = new Intent(ReportIncident.this,EmpDashboard.class);
                startActivity(intent);
            }
        });

    }
}