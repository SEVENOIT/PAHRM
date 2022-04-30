import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pahrm/ContactUs.dart';
import 'package:pahrm/Incident.dart';
import 'package:pahrm/Resign.dart';
import 'package:pahrm/VaccinePassport.dart';
import 'package:pahrm/myProfile.dart';

import 'Attendance.dart';
import 'ChangePassword.dart';
import 'leaveRequest.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child:Container(
        decoration:  const BoxDecoration(
          color: Color(0xFF062444),
          image:DecorationImage(
              image: AssetImage('assets/green4.jpg'),fit: BoxFit.cover,opacity: 09
          ),
        ),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*0.3,
                  alignment: Alignment.topCenter,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.fromLTRB(5,50,5,10),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: Column(
                    children:  const [
                      CircleAvatar(
                        radius: 50,
                        child: CircleAvatar(
                          radius: 80,
                          backgroundImage: AssetImage('assets/proPic.jpg'),
                        ),
                      ),

                      Text('Dinuka Nawanjana ',style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold,),),
                      Text('dinuka@gmail.com ',style: TextStyle(color: Colors.white, fontSize: 15,),),

                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  decoration:  const BoxDecoration(
                      color: Color(0xFF24695c),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                      )
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        horizontalTitleGap:10,
                        leading: const Icon(Icons.account_box,color: Colors.white,),
                        title: const Text('Profile',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_){
                                return const myProfile()
                                ;
                              }));
                        },
                      ),
                      ListTile(
                        horizontalTitleGap:10,
                        leading: const Icon(Icons.date_range_rounded,color: Colors.white,),
                        title: const Text('Attendance',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_){
                                return const Attendance()
                                ;
                              }));
                        },
                      ),
                      ListTile(
                        horizontalTitleGap:10,
                        leading: const Icon(Icons.transfer_within_a_station_outlined,color: Colors.white,),
                        title: const Text('Leave Request',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_){
                                return const leaveRequest()
                                ;
                              }));
                        },
                      ),
                      ListTile(
                        horizontalTitleGap:10,
                        leading: const Icon(Icons.payments_rounded,color: Colors.white,),
                        title: const Text('Payments',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                        onTap: () {

                        },
                      ),
                      ListTile(
                        horizontalTitleGap:10,
                        leading: const Icon(Icons.assignment_outlined,color: Colors.white,),
                        title: const Text('Payslips',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                        onTap: () {},
                      ),
                      ListTile(
                        horizontalTitleGap:10,
                        leading: const Icon(Icons.medical_services_rounded,color: Colors.white,),
                        title: const Text('Vaccine Passport',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_){
                                return const VaccinePassport()
                                ;
                              }));
                        },
                      ),
                      ListTile(
                        horizontalTitleGap:10,
                        leading: const Icon(Icons.account_tree_rounded,color: Colors.white,),
                        title: const Text('Resources',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                        onTap: () {},
                      ),
                      ListTile(
                        horizontalTitleGap:10,
                        leading: const Icon(Icons.warning_rounded,color: Colors.white,),
                        title: const Text('Safety Incident Report ',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_){
                                return const Incident()
                                ;
                              }));
                        },
                      ),
                      ListTile(
                        horizontalTitleGap:10,
                        leading: const Icon(Icons.article_outlined,color: Colors.white,),
                        title: const Text('Resign',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_){
                                return const Resign()
                                ;
                              }));
                        },
                      ),
                      const Divider(color: Colors.white,thickness: 1,),
                      ListTile(
                        horizontalTitleGap:10,
                        leading: const Icon(Icons.password_rounded,color: Colors.white,),
                        title: const Text('Change Password',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_){
                                return const ChangePassword()
                                  ;
                              }));
                        },
                      ),
                      ListTile(
                        horizontalTitleGap:10,
                        leading: const Icon(Icons.message,color: Colors.white,),
                        title: const Text('Contact Us',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_){
                                return const ContactUs();
                              }));
                        },
                      ),
                      ListTile(
                        horizontalTitleGap:10,
                        leading: const Icon(Icons.logout,color: Colors.white,),
                        title: const Text('Log out',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                        onTap: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),

          ),
    );
  }

}
