import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'NavigationDrawerWidget.dart';

class myProfile extends StatelessWidget {
  const myProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    return Container(
      child: Scaffold(
        drawer: const NavigationDrawerWidget(),
        appBar: AppBar(
          backgroundColor: Color(0xFF24695c),
          title: Image.asset('assets/logoWh.jpg',height: 70,width: 70,alignment: Alignment.centerLeft,),
        ),
        body: ListView(
          children: [
            Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(20, 30, 20,20),
                height:height,
                color: Color(0xFFd5e1df),

                child: Container(

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: profile(),
                )
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined,color: Color(0xFF24695c),),
                label: 'Home',backgroundColor: Color(0xFF24695c),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.logout,color: Color(0xFF24695c),),
                label: 'Sign Out',
              ),]
        ),

        floatingActionButton: SpeedDial(
          backgroundColor: const Color(0xFF24695c),
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

      ),
    );
  }
}

class profile extends StatelessWidget {
  const profile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.fromLTRB(5,35,5,10),
              margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
              decoration:  const BoxDecoration(
                color: Color(0xFF24695c),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(0),
                  topLeft: Radius.circular(0),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )
              ),
              child: Column(
                children:  const [
                  CircleAvatar(
                    radius: 60,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage('assets/proPic.jpg'),
                    ),
                  ),

                  Text('Dinuka Nawanjana ',style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold,),),

                ],
              ),
            ),
          ],
        ),
        Container(
          alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
            child: const Text('Personal Information ',style: TextStyle(color: Colors.blueGrey, fontSize: 15,fontWeight: FontWeight.bold,),)
        ),
        Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5)
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 3,

                ),
              ],
            ),
            child: const ListTile(
              horizontalTitleGap: 5,
              leading: Icon(Icons.date_range_rounded,color: Colors.blueGrey,),
              title: Text('25th November 1998',style: TextStyle(color: Colors.blueGrey,fontSize: 15,fontWeight: FontWeight.bold),),
            )
        ),
        Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5)
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 3,

                ),
              ],
            ),
            child:ListTile(
              horizontalTitleGap: 5,
              leading: Icon(Icons.location_on_rounded,color: Colors.blueGrey,),
              title: Text('Sri Lanka',style: TextStyle(color: Colors.blueGrey,fontSize: 15,fontWeight: FontWeight.bold),),
            )
        ),
        Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5)
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 3,

                ),
              ],
            ),
            child: const ListTile(
              horizontalTitleGap: 5,
              leading: Icon(Icons.account_box,color: Colors.blueGrey,),
              title: Text('9833012376V',style: TextStyle(color: Colors.blueGrey,fontSize: 15,fontWeight: FontWeight.bold),),
            )
        ),
        Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5)
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 3,

                ),
              ],
            ),
            child: const ListTile(
              horizontalTitleGap: 5,
              leading: Icon(Icons.email_rounded,color: Colors.blueGrey,),
              title: Text('dinuka@gmail.com',style: TextStyle(color: Colors.blueGrey,fontSize: 15,fontWeight: FontWeight.bold),),
            )
        )
      ],
    );
  }
}


