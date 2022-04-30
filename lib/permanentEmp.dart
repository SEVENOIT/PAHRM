import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pahrm/leaveRequest.dart';

import 'myProfile.dart';

class permanentEmp extends StatefulWidget {
  const permanentEmp({Key? key}) : super(key: key);

  @override
  _permanentEmpState createState() => _permanentEmpState();
}

class _permanentEmpState extends State<permanentEmp> {
  @override
  Widget build(BuildContext context) {
    String cdate3 = DateFormat("MMM, EEE, yyyy").format(DateTime.now());
    String tdata = DateFormat("hh:mm a").format(DateTime.now());
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(

        body: Container(
          color: const Color(0xFFd5e1df),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                width: double.infinity,
                height:height*0.2,

                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 40, 10, 10),
                  decoration: const BoxDecoration(
                    color: Color(0xFF24695c),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40.0),
                      bottomRight : Radius.circular(40.0),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment:CrossAxisAlignment.center ,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        child: const Image(
                          image:AssetImage('assets/sun.png',),width: 180.0,height: 150.0,),
                        width:width * 0.3,
                        height: 100,
                      ),
                      Container(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          width:width * 0.5,
                          height: 105,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text("Good Morning!!",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold
                              ),),
                              const Text("Mishane Perera",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),),
                              Text(cdate3+","+tdata,style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                              ),),
                            ],
                          )
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                height:height-(height*0.2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width:width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                     GestureDetector(
                       onTap: (){
                         Navigator.of(context).push(MaterialPageRoute(
                             builder: (_){
                               return const myProfile();
                             }));
                       },
                      child: Container(
                        width:width * 0.35,
                        height: height*0.2,
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Color(0xFF24695c),
                            width: 5,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Image(image:AssetImage('assets/profile2.png',),width: 70.0,height: 70.0,),
                            Text("Profile",style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),),
                          ],
                        ),

                      ),

                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_){
                                    return const leaveRequest();
                                  }));
                            },
                            child: Container(
                              width:width * 0.35,
                              height: height*0.2,
                              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Color(0xFF24695c),
                                  width: 5,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Image(image:AssetImage('assets/At.png',),width: 70.0,height: 70.0,),
                                  Text("Attendance",style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width:width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width:width * 0.35,
                            height: height*0.2,
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Color(0xFF24695c),
                                width: 5,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Image(image:AssetImage('assets/pay.png',),width: 70.0,height: 70.0,),
                                Text("Payments",style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                ),),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_){
                                    return const leaveRequest();
                                  }));
                            },
                            child: Container(
                              width:width * 0.35,
                              height: height*0.2,
                              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: const Color(0xFF24695c),
                                  width: 5,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Image(image:AssetImage('assets/leave.png',),width: 70.0,height: 70.0,),
                                  Text("Leave Request",style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold
                                  ),),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width:width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width:width * 0.35,
                            height: height*0.2,
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color:const Color(0xFF24695c),
                                width: 5,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Image(image:AssetImage('assets/more2.png',),width: 70.0,height: 70.0,),
                                Text("More Options",style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                ),),
                              ],
                            ),
                          ),
                          Container(
                            width:width * 0.35,
                            height: height*0.2,
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: const Color(0xFF24695c),
                                width: 5,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Image(image:AssetImage('assets/logout.png',),width: 70.0,height: 70.0,),
                                Text("Sign Out",style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                ),),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}

