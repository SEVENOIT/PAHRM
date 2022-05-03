package com.android.automatedpayroll;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.android.automatedpayroll.Connection.ConnectionClass;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.Writer;
import java.sql.Connection;
import java.sql.Statement;

public class ContactUs extends AppCompatActivity {
    private ConnectionClass connectionClass;

    String username;
    String msg;
    EditText Name,Email,ContactNumber,Message;
    Button send;
    private boolean success = false;



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_contact_us);
        username = getIntent().getStringExtra("username");

        Name = findViewById(R.id.to);
        Email = findViewById(R.id.from);
        ContactNumber = findViewById(R.id.letter);
        Message = findViewById(R.id.message2);
        Toast.makeText(ContactUs.this, username, Toast.LENGTH_LONG).show();

        send = findViewById(R.id.send);
        send.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                connectionClass = new ConnectionClass();

                try
                {
                    Connection conn = connectionClass.CONN(); //Connection Object
                    if (conn == null)
                    {
                        success = false;
                        Toast.makeText(ContactUs.this, "Not done", Toast.LENGTH_LONG).show();

                    }
                    else {
                        Toast.makeText(ContactUs.this, "done", Toast.LENGTH_LONG).show();

                        // Change below query according to your own database.
                        String query = "Insert into ContactUs(EID,Name,Email,ContactNumber,Message) " +
                                "Values (" +
                                "'"+username+"',"+
                                "'"+Name.getText()+"',"+
                                "'"+Email.getText()+"',"+
                                "'"+ContactNumber.getText()+"',"+
                                "'"+Message.getText()+"')";

                        Statement stmt = conn.createStatement();
                        stmt.executeQuery(query);



                    }
                } catch (Exception e)
                {
                    e.printStackTrace();
                    Writer writer = new StringWriter();
                    e.printStackTrace(new PrintWriter(writer));
                    msg = writer.toString();
                    success = false;
                }
                Intent intent = new Intent(ContactUs.this,EmpDashboard.class);
                startActivity(intent);
            }
        });

    }
}