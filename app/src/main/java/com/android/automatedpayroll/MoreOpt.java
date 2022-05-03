package com.android.automatedpayroll;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;

import com.android.automatedpayroll.Connection.ConnectionClass;

public class MoreOpt extends AppCompatActivity {
    Button resource,report,resign,vaccine,contact,payslip;
    String username;

    private ConnectionClass connectionClass;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_more_opt);

        username = getIntent().getStringExtra("username");
        connectionClass = new ConnectionClass();


        resource = findViewById(R.id.resourses);

        resource.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(MoreOpt.this, Resources.class);
                intent.putExtra("username", username);

                startActivity(intent);

            }
        });
        report = findViewById(R.id.report);

        report.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(MoreOpt.this, ReportIncident.class);
                intent.putExtra("username", username);

                startActivity(intent);

            }
        });

        resign = findViewById(R.id.Resign);
        resign.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(MoreOpt.this, Resign.class);
                intent.putExtra("username", username);

                startActivity(intent);
            }
        });

        vaccine = findViewById(R.id.Vaccine);
        vaccine.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(MoreOpt.this, Vaccine.class);
                intent.putExtra("username", username);

                startActivity(intent);
            }
        });

        contact = findViewById(R.id.contactus);
        contact.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(MoreOpt.this, ContactUs.class);
                intent.putExtra("username", username);

                startActivity(intent);
            }
        });

        payslip = findViewById(R.id.Payslips);
        payslip.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(MoreOpt.this, Payslip.class);
                intent.putExtra("username", username);

                startActivity(intent);
            }
        });
    }
}