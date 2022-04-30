import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:intl/intl.dart';
import 'NavigationDrawerWidget.dart';

class  Attendance extends StatelessWidget {
  const Attendance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        backgroundColor: const Color(0xff24695c),
        title: Image.asset('assets/logoWh.jpg',height: 70,width: 70,alignment: Alignment.centerLeft,),
      ),
      body: ListView(
        children: [
          Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 30, 20,20),
              height:MediaQuery.of(context).size.height,
              color: const Color(0xFFd5e1df),

              child: Container(

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFF24695c),
                ),
                child: Column(
                    children: [
                      const Header(),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)
                          ),
                        ),
                        child: Column(
                          children:  [
                            Container(
                              padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
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
                              child: Column(
                                children:  [
                                  const ListTile(
                                    horizontalTitleGap: 4,
                                    leading: Icon(Icons.location_on_rounded,color: Colors.blueGrey,),
                                    title: Text('Location - Horana',style: TextStyle(color: Colors.blueGrey,fontSize: 15,fontWeight: FontWeight.bold),),
                                  ),
                                  const ListTile(
                                    horizontalTitleGap: 4,
                                    leading: Icon(Icons.timer,color: Colors.blueGrey,),
                                    title: Text('Start Time - 8.30 AM',style: TextStyle(color: Colors.blueGrey,fontSize: 15,fontWeight: FontWeight.bold),),
                                  ),
                                  const ListTile(
                                    horizontalTitleGap: 4,
                                    leading: Icon(Icons.timer_off_rounded,color: Colors.blueGrey,),
                                    title: Text('End Time - 5.00 PM',style: TextStyle(color: Colors.blueGrey,fontSize: 15,fontWeight: FontWeight.bold),),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: const [
                                      Button1(),Button2()
                                    ],
                                  )
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                        height: 100,
                        width: MediaQuery.of(context).size.width-10,
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
                      )
                    ]
                ),
              )
          ),

        ],
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

class Header extends StatelessWidget{
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String cdate3 = DateFormat("MMM, EEE, yyyy").format(DateTime.now());
    String tdata = DateFormat("hh:mm a").format(DateTime.now());
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 40, 10, 10),
      decoration: const BoxDecoration(
        color: Color(0xFF24695c),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight : Radius.circular(40.0),
        ),
      ),
      child: Row(
        crossAxisAlignment:CrossAxisAlignment.center ,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            child: const Image(
              image:AssetImage('assets/At.png',),width: 80.0,height: 80.0,),
            width:width * 0.3-10,
            height: 80,
          ),
          Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              width:width * 0.5-10,
              height: 90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("Daily Attendance",style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                  ),),
                  Text(tdata,style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),),
                  Text(cdate3,style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),),

                ],
              )
          )
        ],
      ),
    );
  }
}

class Button1 extends StatelessWidget{
  const Button1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 40,
      width: 80,
      decoration: BoxDecoration(
        color: const Color(0xFF24695c),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Center(
        child: Text("START",style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
}
class Button2 extends StatelessWidget{
  const Button2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 40,
      width: 80,
      decoration: BoxDecoration(
        color: const Color(0xFF24695c),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Center(
        child: Text("END",style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
}