import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'NavigationDrawerWidget.dart';

class Incident extends StatelessWidget {
  const Incident({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
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
                height:height*1.3,
               color: const Color(0xFFd5e1df),

                child: Container(

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFF24695c),
                  ),
                  child: Column(
                      children: [
                        Header(),
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
                            children: const [
                              InputField(),Button(),
                            ],
                          ),
                        ),
                      ]
                  ),
                )
            )
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

class InputField extends StatelessWidget{
  const InputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xFF24695c),
                width: 2,
              ),
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
          child:Column(
            children: const [
              Text('Does this incident involve you?',style: TextStyle(color: Colors.black38,fontSize: 18,),),
              MyStatefulWidget()
            ],
          )
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
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
              prefixIcon: const Icon(Icons.date_range_rounded,size: 30,color: Color(0xFF24695c)),
              border:OutlineInputBorder(borderSide:const BorderSide(color:Color(0xFF24695c),width: 2),
                borderRadius: BorderRadius.circular(10),),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: Color(0xFF24695c),),
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: "INCIDENT DATE",
              hintStyle: const TextStyle(color: Colors.grey),


            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          decoration:  BoxDecoration(
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
              prefixIcon: const Icon(Icons.access_time_rounded,size: 35,color: Color(0xFF24695c)),
              border:OutlineInputBorder(borderSide:const BorderSide(color: Color(0xFF24695c),),
                borderRadius: BorderRadius.circular(10),),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: Color(0xFF24695c),),
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: "TIME OF INCIDENT",
              hintStyle: const TextStyle(color: Colors.grey),

            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
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
              prefixIcon: const Icon(Icons.location_on_rounded,size: 35,color: Color(0xFF24695c)),
              border:OutlineInputBorder(borderSide:const BorderSide(color: Color(0xFF24695c),),
                borderRadius: BorderRadius.circular(10),),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: Color(0xFF24695c),),
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: "LOCATION",
              hintStyle: const TextStyle(color: Colors.grey),

            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
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
            maxLines: 3,
            decoration: InputDecoration(
              prefixIcon: const Padding( padding: EdgeInsets.fromLTRB(5, 0, 5, 36), child: Icon(Icons.message,size: 35,color: Color(0xFF24695c),), ),
              border:OutlineInputBorder(borderSide:const BorderSide(color: Color(0xFF24695c),),
                borderRadius: BorderRadius.circular(10),),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: Color(0xFF24695c),),
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: "DESCRIBE THE INCIDENT",
              hintStyle: const TextStyle(color: Colors.grey),

            ),
          ),
        ),
      ],
    );
  }
}
class Header extends StatelessWidget{
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: const [
                Center(
                  child: Image(
                    image:AssetImage('assets/Incident.png',),width: 120.0,height: 80.0,),
                ),
                Center(
                  child: Text("Report Safety Incident", style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.bold,),),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              decoration:  BoxDecoration(
                  border: Border.all(
                    color: Colors.yellow,
                    width: 2,
                  )
              ),
              child: const Text('Fill the details and click submit to report an incident at your workplace.',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500),)
            ),


          ],
        ),
      ),
    );
  }
}

class Button extends StatelessWidget{
  const Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 50,
      margin: const EdgeInsets.fromLTRB(50, 30, 50, 0),
      decoration: BoxDecoration(
        color: const Color(0xFF24695c),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Center(
        child: Text("Send",style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
}

enum SingingCharacter { Yes, No}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  SingingCharacter? _character = SingingCharacter.Yes;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 40,
          child: RadioListTile<SingingCharacter>(
            title: const Text('YES',style: TextStyle(color: Colors.black38)),
            value: SingingCharacter.Yes,
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
            title: const Text('NO',style: TextStyle(color: Colors.black38),),
            value: SingingCharacter.No,
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
