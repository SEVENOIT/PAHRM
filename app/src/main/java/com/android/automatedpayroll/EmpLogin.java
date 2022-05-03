package com.android.automatedpayroll;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.StrictMode;
import android.support.v7.app.AppCompatActivity;
import android.text.Editable;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.android.automatedpayroll.Connection.ConnectionClass;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class EmpLogin extends AppCompatActivity {

    EditText userName, password;
    Button login, changePassword;

    Connection connection;
public String status;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_emp_login);

        userName = findViewById(R.id.loginUserName);
        password = findViewById(R.id.loginPassword);
        login = findViewById(R.id.loginButton);
        changePassword = findViewById(R.id.Pchng);

        login.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                new EmpLogin.checkLogin().execute("");
            }
        });

        changePassword.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(EmpLogin.this, ChangePassword.class);
                startActivity(intent);
            }
        });

    }

    public class checkLogin extends AsyncTask<String, String, String> {
        String z = null;
        Boolean isSuccess = false;


        @Override
        protected void onPreExecute() {

        }

        @Override
        protected void onPostExecute(String s) {

        }

        @Override
        protected String doInBackground(String... strings) {
            connection = connectionClass(ConnectionClass.un.toString(), ConnectionClass.pass.toString(), ConnectionClass.db.toString(), ConnectionClass.ip.toString());
            if (connection == null) {
                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        Toast.makeText(EmpLogin.this, "Check Internet Connection", Toast.LENGTH_LONG).show();
                    }
                });
                z = "On Internet Connection";
            } else {
                try {
                    String sql = "SELECT * FROM Employee WHERE EID = '" + userName.getText() + "' AND Epassword = '" + password.getText() + "' ";
                    Statement stmt = connection.createStatement();
                    ResultSet rs = stmt.executeQuery(sql);

                    if (rs.next()) {
                        runOnUiThread(new Runnable() {
                            @Override
                            public void run() {
                                Toast.makeText(EmpLogin.this, "Login Success", Toast.LENGTH_LONG).show();

                            }
                        });
                        z = "Success";

                        if (rs != null) {
                            try {
                                status = rs.getString("ContractType");

                                Log.d("myTag", status);



                            } catch (Exception ex) {
                                ex.printStackTrace();
                            }
                        }


                    } else {
                        runOnUiThread(new Runnable() {
                            @Override
                            public void run() {
                                Toast.makeText(EmpLogin.this, "Check email or password", Toast.LENGTH_LONG).show();
                            }
                        });

                        userName.setText("");
                        password.setText("");
                    }
                    Editable name = userName.getText();
                    Intent intent;
                    Log.d("myTag2", status);
                    if (status.equals("Permanent")) {

                        intent = new Intent(EmpLogin.this, Dashboard_Permanent.class);
                        intent.putExtra("username", name.toString());
                        startActivity(intent);
                    } else if (status.equals("Casual")) {

                        intent = new Intent(EmpLogin.this, Dashbard_Casual.class);
                        intent.putExtra("username", name.toString());
                        startActivity(intent);
                    }
                } catch (Exception e) {
                    isSuccess = false;
                    Log.e("SQL Error : ", e.getMessage());
                }
            }
            return z;
        }
    }

    @SuppressLint("NewApi")
    public Connection connectionClass(String user, String password, String database, String server) {
        StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
        StrictMode.setThreadPolicy(policy);
        Connection connection = null;
        String connectionURL = null;
        try {
            Class.forName("net.sourceforge.jtds.jdbc.Driver");
            connectionURL = "jdbc:jtds:sqlserver://" + server + "/" + database + ";user=" + user + ";password=" + password + ";";
            connection = DriverManager.getConnection(connectionURL);
        } catch (Exception e) {
            Log.e("SQL Connection Error : ", e.getMessage());
        }

        return connection;
    }


}



