package com.android.automatedpayroll;

import android.Manifest;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.Matrix;
import android.graphics.drawable.ColorDrawable;
import android.media.ExifInterface;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.provider.MediaStore;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.util.Base64;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.Window;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONObject;
//import javax.swing.*;

//import java.awt.Button;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

//import javax.swing.text.View;

public class MainActivity extends AppCompatActivity {

    View view;
    SharedPreferences pref;
    SimpleDateFormat sdfd = new SimpleDateFormat("yyyy/MM/dd");
    SimpleDateFormat sdft = new SimpleDateFormat("HH:mm");
//    SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmss");

    private static final int AfterLogin_TAKE_PICTURE = 0;
    protected Button Logout_Btn;
    protected TextView Lat_location, Long_location;
    protected RelativeLayout relativeLayout;
    double Lat = 0, Lng = 0;
    String str;

    String path, Destination;
    String Image;

    ImageView imageView;
    TextView textView;
    Button Nextbutton;
    Button emergency_btn;

    ImageHelper imageHelper;
    Dialog mDialog;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        pref = getSharedPreferences("Human_tracking", Context.MODE_PRIVATE);
        str = pref.getString("userEmail", "");

        mDialog = new Dialog(MainActivity.this, R.style.AppTheme);
        mDialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        mDialog.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
        mDialog.setContentView(R.layout.circular_dialog);
        mDialog.setCancelable(false);

        relativeLayout = (RelativeLayout) findViewById(R.id.main_screen);
        Lat_location = (TextView) findViewById(R.id.lat_location);
        Long_location = (TextView) findViewById(R.id.long_location);

        emergency_btn = (Button) findViewById(R.id.emergency_btn);

        imageHelper = new ImageHelper();

        stopService(new Intent(MainActivity.this, BackgroundService.class));
        startService(new Intent(MainActivity.this, BackgroundService.class));


        /*GPS_Tracker gps_tracker = new GPS_Tracker(MainActivity.this, MainActivity.this);
        if (gps_tracker.canGetLocation()) {
            Lat = gps_tracker.getLatitude();
            Lng = gps_tracker.getLongitude();

//            Toast.makeText(MainActivity.this, Lat+""+Lng, Toast.LENGTH_SHORT).show();

            if (Lat != 0 && Lng != 0) {

                Lat_location.setText("Latitude:-        " + Lat + "");
                Long_location.setText("Longitude:-      " + Lng + "");

            } else {
                Toast.makeText(MainActivity.this, "Determining Your cordinates,please wait", Toast.LENGTH_SHORT).show();

            }
        } else {
            Toast.makeText(MainActivity.this, "Enable Your GPS(Location)", Toast.LENGTH_SHORT).show();
        }

        init();

        Boolean ans = weHavePermission();
        if (!ans) {
            requestforPermissionFirst();
        }*/

    }

    public void init() {

        Logout_Btn = (Button) findViewById(R.id.logout_btn);
//        Lat_location = (TextView) findViewById(R.id.lat_location);
//        Long_location = (TextView) findViewById(R.id.long_location);


       /* emergency_btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                GPS_Tracker gps_tracker = new GPS_Tracker(MainActivity.this, MainActivity.this);
                if (gps_tracker.canGetLocation()) {
                    Lat = gps_tracker.getLatitude();
                    Lng = gps_tracker.getLongitude();

                    if (Lat != 0 && Lng != 0) {

                        Date dt = new Date();
                        String dateText = sdfd.format(dt.getTime());
                        String timeText = sdft.format(dt.getTime());

//                        String userName,String date,String lat,String longi
                        new SendEmergency_task().execute(str, dateText, Lat + "", Lng + "");

                    } else {
                        Toast.makeText(MainActivity.this, "Determining Your cordinates,please wait", Toast.LENGTH_SHORT).show();

                    }
                } else {
                    Toast.makeText(MainActivity.this, "Enable Your GPS(Location)", Toast.LENGTH_SHORT).show();
                }

            }
        });


        Logout_Btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                GPS_Tracker gps_tracker = new GPS_Tracker(MainActivity.this, MainActivity.this);
                if (gps_tracker.canGetLocation()) {
                    Lat = gps_tracker.getLatitude();
                    Lng = gps_tracker.getLongitude();

                    if (Lat != 0 && Lng != 0) {


                    } else {
                        Toast.makeText(MainActivity.this, "Determining Your cordinates,please wait", Toast.LENGTH_SHORT).show();

                    }
                } else {
                    Toast.makeText(MainActivity.this, "Enable Your GPS(Location)", Toast.LENGTH_SHORT).show();
                }


            }
        });*/
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        return super.onCreateOptionsMenu(menu);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {

//        if(item.getItemId()==R.id.logout){
//
//            SharedPreferences pref = getSharedPreferences("Human_trackingUser",Context.MODE_PRIVATE);
//            SharedPreferences.Editor editor = pref.edit();
//            editor.clear();
//            editor.apply();
//            finish();
//        }

        return super.onOptionsItemSelected(item);
    }


    public void takePicture(View view) {
        Intent i = new Intent(android.provider.MediaStore.ACTION_IMAGE_CAPTURE);
        startActivityForResult(i, 0);
    }


    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        switch (requestCode) {

            case AfterLogin_TAKE_PICTURE:
                if (requestCode == AfterLogin_TAKE_PICTURE && resultCode == RESULT_OK) {

                    Bundle extras = data.getExtras();
                    Bitmap imageBitmap = (Bitmap) extras.get("data");
                    Uri uri = getImageUri(getApplicationContext(), imageBitmap);
                    String Filepath = getPath(uri);

                    try {
                        if (Filepath.compareTo("") != 0) {
                            File file = new File(Filepath);
                            if (file.exists()) {

                                Bitmap bm = imageHelper.loadSizeLimitedBitmapFromUri(uri, getContentResolver());
                                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                                bm.compress(Bitmap.CompressFormat.JPEG, 100, baos); //bm is the bitmap object
                                imageView.setImageBitmap(bm);

                                Bitmap ReviewImage = bm;
                                byte[] b = baos.toByteArray();
                                Image = Base64.encodeToString(b, Base64.DEFAULT);


                            } else {

                                AlertDialog.Builder ad = new AlertDialog.Builder(MainActivity.this);
                                ad.setTitle("Can't Upload!");
                                ad.setMessage("Either the file doesnt exists or the user is restricted to access the file");
                                ad.setPositiveButton("OK", new DialogInterface.OnClickListener() {
                                    @Override
                                    public void onClick(DialogInterface dialog, int which) {
                                        dialog.cancel();
                                    }
                                });
                                ad.show();
                            }
                        }
                    } catch (Exception e) {
                        Toast.makeText(this, e.getMessage(), Toast.LENGTH_SHORT).show();
                    }


                }

                break;

        }
    }


    public String getPath(Uri uri) {
        String[] projection = {MediaStore.Images.Media.DATA};
        Cursor cursor = managedQuery(uri, projection, null, null, null);
        if (cursor != null) {
            int column_index = cursor.getColumnIndexOrThrow(MediaStore.Images.Media.DATA);
            cursor.moveToFirst();
            return cursor.getString(column_index);
        } else
            return "null";
    }

    public Uri getImageUri(Context inContext, Bitmap inImage) {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        inImage.compress(Bitmap.CompressFormat.JPEG, 100, bytes);
        String path = MediaStore.Images.Media.insertImage(inContext.getContentResolver(), inImage, "Title", null);
        return Uri.parse(path);
    }

    //Android Runtime Permission
    private boolean weHavePermission() {
        return (ContextCompat.checkSelfPermission(this, Manifest.permission.READ_EXTERNAL_STORAGE) == PackageManager.PERMISSION_GRANTED) && ContextCompat.checkSelfPermission(this, Manifest.permission.WRITE_EXTERNAL_STORAGE) == PackageManager.PERMISSION_GRANTED && ContextCompat.checkSelfPermission(this, Manifest.permission.ACCESS_FINE_LOCATION) == PackageManager.PERMISSION_GRANTED && ContextCompat.checkSelfPermission(this, Manifest.permission.ACCESS_COARSE_LOCATION) == PackageManager.PERMISSION_GRANTED && ContextCompat.checkSelfPermission(this, Manifest.permission.CAMERA) == PackageManager.PERMISSION_GRANTED;
    }

    private void requestforPermissionFirst() {
        if ((ActivityCompat.shouldShowRequestPermissionRationale(this, Manifest.permission.READ_EXTERNAL_STORAGE)) || (ActivityCompat.shouldShowRequestPermissionRationale(this, Manifest.permission.WRITE_EXTERNAL_STORAGE)) || (ActivityCompat.shouldShowRequestPermissionRationale(this, Manifest.permission.CAMERA)) || (ActivityCompat.shouldShowRequestPermissionRationale(this, Manifest.permission.ACCESS_COARSE_LOCATION)) || (ActivityCompat.shouldShowRequestPermissionRationale(this, Manifest.permission.ACCESS_FINE_LOCATION))) {
            requestForResultContactsPermission();
        } else {
            requestForResultContactsPermission();
        }
    }

    private void requestForResultContactsPermission() {
        ActivityCompat.requestPermissions(this, new String[]{Manifest.permission.READ_EXTERNAL_STORAGE, Manifest.permission.WRITE_EXTERNAL_STORAGE, Manifest.permission.CAMERA, Manifest.permission.ACCESS_FINE_LOCATION, Manifest.permission.ACCESS_COARSE_LOCATION}, 111);
    }





    public class LogoutImageUpload_task extends AsyncTask<String, JSONObject, String> {

        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            mDialog.show();
        }

        @Override
        protected String doInBackground(String... params) {
            String a = "back";
            RestAPI api = new RestAPI();
            try {
                //JSONObject json = api.setImage(params[0], params[1], params[2], params[3]);
                JSONPARSE jp = new JSONPARSE();
                //a = jp.parse(json);
            } catch (Exception e) {
                a = e.getMessage();
            }
            return a;
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            mDialog.dismiss();

            if (s.compareTo("true") == 0) {
                Toast.makeText(MainActivity.this, "Logout Image Uploaded", Toast.LENGTH_SHORT).show();
                stopService(new Intent(MainActivity.this, BackgroundService.class));

                SharedPreferences pref = getSharedPreferences("Human_tracking", Context.MODE_PRIVATE);
                SharedPreferences.Editor editor = pref.edit();
                editor.clear();
                editor.apply();
                finish();

            } else {
                if (s.contains("Unable to resolve host")) {
                    AlertDialog.Builder ad = new AlertDialog.Builder(MainActivity.this);
                    ad.setTitle("Unable to Connect!");
                    ad.setMessage("Check your Internet Connection,Unable to connect the Server");
                    ad.setNeutralButton("OK", new DialogInterface.OnClickListener() {
                        @Override
                        public void onClick(DialogInterface dialog, int which) {
                            dialog.cancel();
                        }
                    });
                    ad.show();
//                        dl.dismiss();
                } else {
//                        dl.dismiss();
                    Toast.makeText(MainActivity.this, s, Toast.LENGTH_LONG).show();
                }
            }
        }

    }


    public class SendEmergency_task extends AsyncTask<String, JSONObject, String> {

        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            mDialog.show();
        }

        @Override
        protected String doInBackground(String... params) {
            String a = "back";
            RestAPI api = new RestAPI();
            try {
                JSONObject json = api.emerg(params[0], params[1], params[2], params[3]);
                JSONPARSE jp = new JSONPARSE();
                a = jp.parse(json);
            } catch (Exception e) {
                a = e.getMessage();
            }
            return a;
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            mDialog.dismiss();
            if (s.compareTo("true") == 0) {
                Toast.makeText(MainActivity.this, "Alert Sent Successfully", Toast.LENGTH_SHORT).show();

            } else {
                if (s.contains("Unable to resolve host")) {
                    AlertDialog.Builder ad = new AlertDialog.Builder(MainActivity.this);
                    ad.setTitle("Unable to Connect!");
                    ad.setMessage("Check your Internet Connection,Unable to connect the Server");
                    ad.setNeutralButton("OK", new DialogInterface.OnClickListener() {
                        @Override
                        public void onClick(DialogInterface dialog, int which) {
                            dialog.cancel();
                        }
                    });
                    ad.show();
                } else {
                    Toast.makeText(MainActivity.this, s, Toast.LENGTH_LONG).show();
                }
            }
        }

    }


}
