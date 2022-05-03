package com.android.automatedpayroll;

import android.Manifest;
import android.app.Activity;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.net.ConnectivityManager;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.ActivityCompat;
import android.support.v4.app.NotificationCompat;
import android.support.v4.content.ContextCompat;
import android.util.Log;
import android.widget.Toast;

import org.json.JSONObject;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

/**
 * Created by Nevon Dell on 4/6/2017.
 */

public class BackgroundService extends Service {

    SimpleDateFormat sdfd = new SimpleDateFormat("yyyy/MM/dd");
    SimpleDateFormat sdft = new SimpleDateFormat("HH:mm");
    Timer timer;
    TimerTask timerTask;
    Handler handler = new Handler();
    SharedPreferences pref;
    String userEmail;
    boolean timeAvailable;
    boolean hourAvailable = false;

    private Context mContext;
    GPSTrack gps_tracker;

    // Flag for GPS status
    boolean isGPSEnabled = false;

    ConnectivityManager cm;
    Boolean internet = null;

    // Flag for network status
    boolean isNetworkEnabled = false;

    // Flag for GPS status
    boolean canGetLocation = false;

    Location location; // Location
    double latitude = 0.0; // Latitude
    double longitude = 0.0; // Longitude

    // The minimum distance to change Updates in meters
    private static final long MIN_DISTANCE_CHANGE_FOR_UPDATES = 1000; // 10 meters

    // The minimum time between updates in milliseconds
    private static final long MIN_TIME_BW_UPDATES = 1000 * 60 * 1; // 1 minute

    // Declaring a Location Manager
    protected LocationManager locationManager;

    @Nullable
    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

    private void startServices() {
        Intent notificationIntent = new Intent(this, HomeActivity.class);
        PendingIntent pendingIntent =
                PendingIntent.getActivity(this, 0, notificationIntent, 0);

        createNotificationChannel(getApplicationContext(), CHANNEL_ID);

        Notification notification = new NotificationCompat
                .Builder(getApplicationContext(), CHANNEL_ID)
                .setContentTitle("Employee payroll")
                .setContentText("Employee payroll")
                .setSmallIcon(R.drawable.app_icon)
                .setContentIntent(pendingIntent)
                .setAutoCancel(true)
                .build();

        startForeground(1000, notification);
    }

    public static String CHANNEL_ID = "LocationUpdates";

    public static void createNotificationChannel(@NonNull Context context, @NonNull String CHANNEL_ID) {
        // Create the NotificationChannel, but only on API 26+ because
        // the NotificationChannel class is new and not in the support library
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            CharSequence name = "LocationUpdates";
            String description = "LocationUpdates";
            int importance = NotificationManager.IMPORTANCE_LOW;
            NotificationChannel channel = new NotificationChannel(CHANNEL_ID, name, importance);
            channel.setDescription(description);
            // Register the channel with the system; you can't change the importance
            // or other notification behaviors after this
            NotificationManager notificationManager = context.getSystemService(NotificationManager.class);
            if (notificationManager != null) {
                notificationManager.createNotificationChannel(channel);
            } else {
                Log.d("NotificationLog", "NotificationManagerNull");
            }
        }
    }

    @Override
    public void onCreate() {
        super.onCreate();
        pref = getSharedPreferences("Human_tracking", Context.MODE_PRIVATE);

        startServices();

        gps_tracker = new GPSTrack(BackgroundService.this);
        timer = new Timer();
        demo();
//        timer.schedule(timerTask, 0, 60000 * 10);
        timer.schedule(timerTask, 0, 5000);

    }

    public void demo() {
        timerTask = new TimerTask() {
            @Override
            public void run() {
                handler.post(new Runnable() {
                    @Override
                    public void run() {
                        userEmail = pref.getString("userEmail", "");
                        if (userEmail.compareTo("") != 0) {

                            getLocation();
                        }
                    }
                });
            }
        };
    }


    public void getLocation() {

        String LatLng;

        Date dt = new Date();
        String date = sdfd.format(dt.getTime());
        String time = sdft.format(dt.getTime());

        try {
            if (gps_tracker.canGetLocation()) {
                double Lat = gps_tracker.getLatitude();
                double Lng = gps_tracker.getLongitude();
                if (Lat != 0 && Lng != 0) {

                    LatLng = Lat + "," + Lng;

//                    String lat,String longi,String userName,String date,String time
                    new getLocationTask().execute(Lat + "", Lng + "", userEmail, date, time);

                }
            } else {
//                Toast.makeText(getApplicationContext(),"else",Toast.LENGTH_LONG).show();

            }
        } catch (Exception e) {
//            Toast.makeText(getApplicationContext(),e.getMessage(),Toast.LENGTH_LONG).show();
        }

    }

    public class getLocationTask extends AsyncTask<String, JSONObject, String> {

        @Override
        protected void onPreExecute() {
            super.onPreExecute();
        }


        @Override
        protected String doInBackground(String... params) {
            String a = "back";
            RestAPI api = new RestAPI();
            try {
                JSONObject json = api.setLog(params[0], params[1], params[2], params[3], params[4]);
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
        }
    }


    public class GPSTrack {


        Activity activity;

        public GPSTrack() {

        }

        public GPSTrack(Context context) {
            mContext = context;
            getLocation();
        }


        public Location getLocation() {
            try {


                locationManager = (LocationManager) mContext.getSystemService(mContext.LOCATION_SERVICE);

                // Getting GPS status
                isGPSEnabled = locationManager
                        .isProviderEnabled(LocationManager.GPS_PROVIDER);

                // Getting network status
                isNetworkEnabled = locationManager
                        .isProviderEnabled(LocationManager.NETWORK_PROVIDER);

                if (!isGPSEnabled && !isNetworkEnabled) {
                    // No network provider is enabled
                } else {
                    canGetLocation = true;
                    if (isNetworkEnabled) {
                        int requestPermissionsCode = 50;

                        if (ActivityCompat.checkSelfPermission(BackgroundService.this, Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED && ActivityCompat.checkSelfPermission(BackgroundService.this, Manifest.permission.ACCESS_COARSE_LOCATION) != PackageManager.PERMISSION_GRANTED) {

                        }
                        locationManager.requestLocationUpdates(LocationManager.NETWORK_PROVIDER, MIN_TIME_BW_UPDATES, MIN_DISTANCE_CHANGE_FOR_UPDATES, mLocationListener);
                        Log.d("Network", "Network");
                        if (locationManager != null) {
                            location = locationManager
                                    .getLastKnownLocation(LocationManager.NETWORK_PROVIDER);
                            if (location != null) {
                                latitude = location.getLatitude();
                                longitude = location.getLongitude();
                            }
                        }
                    }
                }
                // If GPS enabled, get latitude/longitude using GPS Services
                if (isGPSEnabled) {
                    if (location == null) {
                        if (ContextCompat.checkSelfPermission(mContext, Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED && ActivityCompat.checkSelfPermission(mContext, Manifest.permission.ACCESS_COARSE_LOCATION) != PackageManager.PERMISSION_GRANTED) {
//                            ActivityCompat.requestPermissions(mContext, new String[]{Manifest.permission.ACCESS_FINE_LOCATION}, 50);

                        } else {
                            locationManager.requestLocationUpdates(LocationManager.GPS_PROVIDER, MIN_TIME_BW_UPDATES, MIN_DISTANCE_CHANGE_FOR_UPDATES, mLocationListener);
                            Log.d("GPS Enabled", "GPS Enabled");
                            if (locationManager != null) {

                                location = locationManager
                                        .getLastKnownLocation(LocationManager.GPS_PROVIDER);
                                if (location != null) {
                                    latitude = location.getLatitude();
                                    longitude = location.getLongitude();
                                }
                            }
                        }
                    }

                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            return location;
        }


        private final LocationListener mLocationListener = new LocationListener() {
            @Override
            public void onLocationChanged(final Location location) {

                if (location != null) {
                    latitude = location.getLatitude();
                    longitude = location.getLongitude();
                    Log.d("RESPONSE",latitude+","+longitude);
//                    Toast.makeText(Back_Service.this, "Location Changed--"+latitude+","+longitude, Toast.LENGTH_SHORT).show();
                }
            }

            @Override
            public void onStatusChanged(String provider, int status, Bundle extras) {

            }

            @Override
            public void onProviderEnabled(String provider) {

            }

            @Override
            public void onProviderDisabled(String provider) {

            }
        };


        public boolean canGetLocation() {
            return canGetLocation;
        }


        public double getLatitude() {
            if (location != null) {
                latitude = location.getLatitude();
            }

            return latitude;
        }


        public double getLongitude() {
            if (location != null) {
                longitude = location.getLongitude();
            }

            return longitude;
        }

    }

    @Override
    public void onDestroy() {
        try{
            timer.cancel();
        }
        catch (Exception e){}
        stopSelf();
        super.onDestroy();
    }
}
