import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'NavigationDrawerWidget.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
        appBar: AppBar(
          backgroundColor:Color(0xFF24695c),
          title: Image.asset('assets/logoWh.jpg',height: 70,width: 70,alignment: Alignment.centerLeft,),
        ),
        body: ListView(
          children: [
            Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(20, 30, 20,20),
                height:height,
                color: const Color(0xFFd5e1df),

                child: Container(

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF24695c),
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
              icon: Icon(Icons.home_rounded,color: Color(0xFF24695c),),
              label: 'Home',backgroundColor: Color(0xFF24695c),
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
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(

          ),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.password_rounded,size: 30,color: Color(0xFF24695c),),
              hintText: "CURRENT PASSWORD",
              hintStyle: const TextStyle(color: Colors.grey),
              border:OutlineInputBorder(borderSide:const BorderSide(color: Color(0xFF24695c),),
                borderRadius: BorderRadius.circular(10),),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: Color(0xFF24695c),),
                borderRadius: BorderRadius.circular(15),
              ),


            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
          ),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.password_rounded,size: 30,color: Color(0xFF24695c)),
              border:OutlineInputBorder(borderSide:BorderSide(color: const Color(0xFF24695c),),
                borderRadius: BorderRadius.circular(10),),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: Color(0xFF24695c),),
                borderRadius: BorderRadius.circular(15),
              ),
              hintText: "NEW PASSWORD",
              hintStyle: const TextStyle(color: Colors.grey),

            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
          ),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.password_rounded,size: 30,color: const Color(0xFF24695c)),
              border:OutlineInputBorder(borderSide:BorderSide(color: Color(0xFF24695c),),
                borderRadius: BorderRadius.circular(10),),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: Color(0xFF24695c),),
                borderRadius: BorderRadius.circular(15),
              ),
              hintText: "CONFIRM PASSWORD",
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
        padding: const EdgeInsets.only(bottom: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget>[

            Center(
              child: Image(
                image:AssetImage('assets/PasswordChange.png',),width: 170.0,height: 100.0,),
            ),
            Center(
              child: Text("Change Password", style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold,),),
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
        child: Text("Change",style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
}