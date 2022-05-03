package com.android.automatedpayroll;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.widget.ListView;
import android.widget.TextView;

import com.android.automatedpayroll.Connection.ConnectionClass;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.Writer;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class Profile extends AppCompatActivity {

    private ArrayList<ResourceClass> itemArrayList;
    private Resources.MyAppAdapter myAppAdapter;
    private ListView listView;
    private boolean success = false;
    private ConnectionClass connectionClass;
    String username,msg;
    TextView CompanyID,EID,Ename,DOB,Tel,Country,DriversLicense_NIC,Email,PayCycle,WeeklyAvailability;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_profile);
        username = getIntent().getStringExtra("username");

        listView = (ListView) findViewById(R.id.listView);

        CompanyID = findViewById(R.id.CompanyID2);
        EID = findViewById(R.id.eid2);
        Ename = findViewById(R.id.Pname2);
        DOB = findViewById(R.id.Pdob2);
        Tel = findViewById(R.id.Pmobile2);
        Country = findViewById(R.id.Pcountry2);
        DriversLicense_NIC = findViewById(R.id.Pnic2);
        Email = findViewById(R.id.Pemail2);
        PayCycle = findViewById(R.id.paycycle2);
        WeeklyAvailability = findViewById(R.id.Pavailable2);

        connectionClass = new ConnectionClass();
        itemArrayList = new ArrayList<ResourceClass>();


            try
            {
                Connection conn = connectionClass.CONN(); //Connection Object
                if (conn == null)
                {
                    success = false;
                }
                else {
                    // Change below query according to your own database.
                    String query = "Select CompanyID,EID,Ename,DOB,Country,DriversLicense_NIC,Tel,Email,PayCycle,WeeklyAvailability From Employee Where EID = '"+ username+"'";
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery(query);
                    if (rs != null) // if resultset not null, I add items to itemArraylist using class created
                    {
                        while (rs.next())
                        {
                            try {
                                Ename.setText(rs.getString("Ename"));
                                CompanyID.setText(rs.getString("CompanyID"));
                                EID.setText(rs.getString("EID"));
                                DOB.setText(rs.getString("DOB"));
                                Tel.setText(rs.getString("Tel"));
                                Country.setText(rs.getString("Country"));
                                DriversLicense_NIC.setText(rs.getString("DriversLicense_NIC"));
                                Email.setText(rs.getString("Email"));
                                PayCycle.setText(rs.getString("PayCycle"));
                                WeeklyAvailability.setText(rs.getString("WeeklyAvailability"));
                            } catch (Exception ex) {
                                ex.printStackTrace();
                            }
                        }
                        msg = "Found";
                        success = true;
                    } else {
                        msg = "No Data found!";
                        success = false;
                    }
                }
            } catch (Exception e)
            {
                e.printStackTrace();
                Writer writer = new StringWriter();
                e.printStackTrace(new PrintWriter(writer));
                msg = writer.toString();
                success = false;
            }
        }

       /* @Override
        protected void onPostExecute(String msg) // disimissing progress dialoge, showing error and setting up my listview
        {
            progress.dismiss();
            Toast.makeText(Profile.this, msg + "", Toast.LENGTH_LONG).show();
            if (success == false)
            {
            }
            else {
                try {
                    myAppAdapter = new Profiles.MyAppAdapter(itemArrayList, Profile.this);
                    listView.setChoiceMode(ListView.CHOICE_MODE_MULTIPLE);
                    listView.setAdapter(myAppAdapter);
                } catch (Exception ex)
                {

                }

            }
        }*/

}