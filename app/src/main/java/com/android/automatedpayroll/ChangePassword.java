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
import java.sql.ResultSet;
import java.sql.Statement;

public class ChangePassword extends AppCompatActivity {
    private ConnectionClass connectionClass;

    String username;
    EditText currentPassword,newPassword,confirmPassword;
    Button changePassword;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_change_password);
        username = getIntent().getStringExtra("username");

        currentPassword = findViewById(R.id.Cpassword2);
        newPassword = findViewById(R.id.NPassword2);
        confirmPassword = findViewById(R.id.CmPassword2);

        changePassword = findViewById(R.id.changepassword);

        changePassword.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                connectionClass = new ConnectionClass();

            try {
                Connection conn = connectionClass.CONN();

                String query1 = "SELECT * FROM Employee WHERE EID = '" + username + "'";

                Statement stmt1 = conn.createStatement();

                ResultSet rs = stmt1.executeQuery(query1);
                String Password = null;
                while (rs.next()) {
                    try {
                        Password = rs.getString("Epassword");
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                }




                if (currentPassword.getText().toString().equals(Password)) {

                    if (newPassword.getText().toString().equals(confirmPassword.getText().toString())) {
                        String query = "update Employee set Epassword='" + newPassword.getText() + "' where EID ='" + username + "'";

                        Toast.makeText(ChangePassword.this, "Password Changed!!", Toast.LENGTH_LONG).show();

                        Intent intent = new Intent(ChangePassword.this, EmpLogin.class);
                        startActivity(intent);

                        Statement stmt = conn.createStatement();
                        stmt.executeQuery(query);


                    } else {
                        Toast.makeText(ChangePassword.this, "confirm password failed!!", Toast.LENGTH_LONG).show();


                    }



                } else {
                    Toast.makeText(ChangePassword.this, "Current password matching failed!!", Toast.LENGTH_LONG).show();

                }


            }catch (Exception e){
                e.printStackTrace();
                Writer writer = new StringWriter();
                e.printStackTrace(new PrintWriter(writer));
                String msg = writer.toString();

            }

            }
        });

    }
}