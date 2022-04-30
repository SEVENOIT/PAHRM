import 'package:flutter/material.dart';
import 'package:pahrm/myProfile.dart';
import 'package:pahrm/permanentEmp.dart';
import 'VaccinePassport.dart';
import 'Welcome.dart';
import 'leaveRequest.dart';
import 'LoginPage.dart';
import 'ChangePassword.dart';
import 'ContactUs.dart';
import 'Incident.dart';
import 'package:device_preview/device_preview.dart';


void main() => runApp(
    DevicePreview(
      builder: (context) => const MyApp(), // Wrap your app
    ));

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      home:Welcome(),
    );
  }
}