import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:intl/intl.dart';

import 'NavigationDrawerWidget.dart';

class leaveRequest extends StatefulWidget {
  const leaveRequest({Key? key}) : super(key: key);

  @override
  _leaveRequestState createState() => _leaveRequestState();
}
int _count = 0;

class _leaveRequestState extends State<leaveRequest> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        backgroundColor: Color(0xFF24695c),
        title: Image.asset('assets/logoWh.jpg',height: 70,width: 70,alignment: Alignment.centerLeft,),
      ),
      body:Container(
        width: double.infinity,
        color: Color(0xFFd5e1df),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 20),
              height: 65,
              decoration: const BoxDecoration(
                color: Color(0xFF24695c),

              ),
              child: const ListTile(
                leading: Icon(Icons.transfer_within_a_station_outlined,color: Colors.white,size: 35,),
                title: Text("Leave Request",style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold
                ),

                ),
              )
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(28, 0, 28, 0),
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),

              child: Column(

                children: [
                  SizedBox(
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 3,
                                blurRadius: 3,

                              ),
                            ],
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Employee Name",
                              hintStyle: const TextStyle(color: Colors.grey),
                              border:OutlineInputBorder(borderSide:const BorderSide(color:Color(0xFF24695c),width: 2),
                                borderRadius: BorderRadius.circular(10),),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(width: 2, color: Color(0xFF24695c),),
                                borderRadius: BorderRadius.circular(10),
                              ),



                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 3,
                                blurRadius: 3,

                              ),
                            ],
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 3,
                                  blurRadius: 3,

                                ),
                              ],
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 3,
                                    blurRadius: 3,

                                  ),
                                ],
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Department",

                                  hintStyle: const TextStyle(color: Colors.grey),
                                  border:OutlineInputBorder(borderSide:const BorderSide(color: Color(0xFF24695c),width: 2),
                                  borderRadius: BorderRadius.circular(10),),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(width: 2, color: Color(0xFF24695c),),
                                    borderRadius: BorderRadius.circular(10),
                                  ),



                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 3,
                                blurRadius: 3,

                              ),
                            ],
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 3,
                                  blurRadius: 3,

                                ),
                              ],
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Manager",
                                hintStyle: const TextStyle(color: Colors.grey),
                                border:OutlineInputBorder(borderSide:const BorderSide(color:Color(0xFF24695c),width: 2),
                                borderRadius: BorderRadius.circular(10),),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(width: 2, color: Color(0xFF24695c),),
                                  borderRadius: BorderRadius.circular(10),
                                ),


                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 250,
                    padding: const EdgeInsets.fromLTRB(0,10, 0, 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                      border: Border.all(color: Color(0xFF24695c),width: 2),
                      borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                    BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 3,

                  ),
                        ]
                    ),
                    child: Column(
                      children: const [
                        Text("Select Leave Type",style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                        ),
                        ),
                        MyStatefulWidget(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 3,
                                blurRadius: 3,

                              ),
                            ],
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 3,
                                  blurRadius: 3,

                                ),
                              ],
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Number of Days in Leave",
                                hintStyle: const TextStyle(color: Colors.grey),
                                border:OutlineInputBorder(borderSide:const BorderSide(color:Color(0xFF24695c),width: 2),
                                borderRadius: BorderRadius.circular(10),),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(width: 2, color: Color(0xFF24695c),),
                                  borderRadius: BorderRadius.circular(10),
                                ),

                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 3,
                                blurRadius: 3,

                              ),
                            ],
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Date of leave",

                              hintStyle: const TextStyle(color: Colors.grey),
                              border:OutlineInputBorder(borderSide:const BorderSide(color: Color(0xFF24695c),width: 2),
                              borderRadius: BorderRadius.circular(10),),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(width: 2, color: Color(0xFF24695c),),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 3,
                                blurRadius: 3,

                              ),
                            ],
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Reason",
                              hintStyle: const TextStyle(color: Colors.grey),
                              border:OutlineInputBorder(borderSide:const BorderSide(color: Color(0xFF24695c),width: 2),
                              borderRadius: BorderRadius.circular(10),),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(width: 2, color: Color(0xFF24695c),),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined,color: Color(0xFF24695c),),
            label: 'Home',
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.logout,color: Color(0xFF24695c),),
          label: 'Sign Out',
        ),]
      ),

      floatingActionButton: SpeedDial(
        backgroundColor: Color(0xFF24695c),
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.date_range),
            label: 'Attendance',
          ),
          SpeedDialChild(
            child: const Icon(Icons.account_box),
            label: 'Profile',
          ),
          SpeedDialChild(
            child: const Icon(Icons.monetization_on_sharp),
            label: 'Payments',
          ),
          SpeedDialChild(
            child: const Icon(Icons.transfer_within_a_station_outlined),
            label: 'Leave Request',
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

enum SingingCharacter { Annual, Casual, Sick, Maternity, NoPay }

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  SingingCharacter? _character = SingingCharacter.Annual;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 40,
          child: RadioListTile<SingingCharacter>(
            title: const Text('Annual',style: TextStyle(color: Colors.grey),),
            value: SingingCharacter.Annual,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        SizedBox(
          height: 40,
          child: RadioListTile<SingingCharacter>(
            title: const Text('Casual',style: TextStyle(color: Colors.grey),),
            value: SingingCharacter.Casual,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        SizedBox(
          height: 40,
          child: RadioListTile<SingingCharacter>(
            title: const Text('Sick',style: TextStyle(color: Colors.grey),),
            value: SingingCharacter.Sick,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        SizedBox(
          height: 40,
          child: RadioListTile<SingingCharacter>(
            title: const Text('Maternity',style: TextStyle(color: Colors.grey),),
            value: SingingCharacter.Maternity,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        SizedBox(
          height: 40,
          child: RadioListTile<SingingCharacter>(
            title: const Text('NoPay ',style: TextStyle(color: Colors.grey),),
            value: SingingCharacter.NoPay ,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
