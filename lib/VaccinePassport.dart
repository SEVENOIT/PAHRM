import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:intl/intl.dart';
import 'NavigationDrawerWidget.dart';
import 'package:file_picker/file_picker.dart';

class VaccinePassport extends StatefulWidget {
  const VaccinePassport({Key? key}) : super(key: key);

  @override
  State<VaccinePassport> createState() => _VaccinePassportState();
}

class _VaccinePassportState extends State<VaccinePassport> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        backgroundColor:const Color(0xFF24695c),
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
                          children:   [
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

class InputField extends StatefulWidget{
  const InputField({Key? key}) : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  DateTime V1=DateTime.now();
  DateTime V2=DateTime.now();
  String getText() {
    if (V1 == null) {
      return 'Select Date';
    } else {
      return DateFormat.yMMMMd('en_US').format(V1);
    }
  }
  String getText2() {
    if (V2 == null) {
      return 'Select Date';
    } else {
      return DateFormat.yMMMMd('en_US').format(V2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(

          padding: const EdgeInsets.all(10),
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
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  decoration: const BoxDecoration(
                    color: Color(0xFFd5e1df),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5)
                    ),
                  ),

                  child: Text('Date of first Dose',style: TextStyle(fontSize: 18,color: Colors.black),)
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(getText(),style: TextStyle(fontSize: 18,color: Colors.blueGrey),),
                  RaisedButton(
                    color:Color(0xFF24695c) ,
                    child:  const Text('Select',style: TextStyle(color:Colors.white)),
                    onPressed: (){
                      showDatePicker(context: context, initialDate:DateTime.now(), firstDate: DateTime(2019), lastDate: DateTime(2024)).then((date){
                        setState(() {
                          V1=date!;
                        });
                      });
                    },
    ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
          padding: const EdgeInsets.all(10),
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
            children: [
              Container(

                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  decoration: const BoxDecoration(
                    color: Color(0xFFd5e1df),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5)
                    ),
                  ),

                  child: Text('Date of Second Dose',style: TextStyle(fontSize: 18,color: Colors.black),)
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(getText2(),style: const TextStyle(fontSize: 18,color: Colors.blueGrey),),
                  RaisedButton(
                    color:Color(0xFF24695c) ,
                    child:  const Text('Select',style: TextStyle(color:Colors.white)),
                    onPressed: (){
                      showDatePicker(context: context, initialDate:DateTime.now(), firstDate: DateTime(2019), lastDate: DateTime(2024)).then((date){
                        setState(() {
                          V2=date!;
                        });
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          padding: const EdgeInsets.all(10),
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
            children: [
              Container(

                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                  decoration: const BoxDecoration(
                    color: Color(0xFFd5e1df),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5)
                    ),
                  ),

                  child: const Text('Upload Vaccine Card',style: TextStyle(fontSize: 18,color: Colors.black),)
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    color:Color(0xFF24695c) ,
                    child:  const Text('Choose',style: TextStyle(color:Colors.white)),
                      onPressed: () async {
                        FilePickerResult? result = await FilePicker.platform.pickFiles();
                        if (result == null) return;  // if user don't pick any thing then do nothing just return.
                        PlatformFile file = result!.files.first;
                      },
                  )
                ],
              ),
            ],
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
                image:AssetImage('assets/vaccine.png',),width: 170.0,height: 100.0,),
            ),
            Center(
              child: Text("Vaccine Passport", style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold,),),
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
        child: Text("Submit",style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
}