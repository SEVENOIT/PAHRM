import 'package:flutter/material.dart';
import 'package:pahrm/permanentEmp.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height1=MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).viewPadding;
    double height2 = height1 - padding.top - padding.bottom;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image:DecorationImage(
                  image: AssetImage('assets/Welcome4.jpg'),fit: BoxFit.cover,opacity: 09
              )
          ),
          child: Column(
            children: [
              Container(
              child: Column(
                    children:   [
                      SafeArea(
                        child: LayoutBuilder(
                          builder: (BuildContext context, BoxConstraints constraints) {
                            return Container(
                              child: Column(
                                children: [
                                  Container(
                                      height: height1 * 0.81,
                                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                      child: Header()
                                  ),
                                  Container(

                                      child: Button()
                                  )

                                ],
                              ),
                            );
                          }
                        ),
                      ),
                    ]
                ),
              ),
            ],
          ),

        )

    );
  }
}


class Header extends StatelessWidget{
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children:  <Widget>[

        Container(
          alignment: Alignment.topCenter,
          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Image(
            image:AssetImage('assets/logoWH2.png',),width: 180.0,height: 120.0,),
        ),
        Container(
          alignment: Alignment.topCenter,
          margin: EdgeInsets.zero,
          child: Text("Employee Monitoring With GPS Tracking", style: TextStyle(color:Color(0xFF24695c), fontSize: 17,fontWeight: FontWeight.bold,),),
        ),

      ],
    );
  }
}

class Button extends StatelessWidget{
  const Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_){
              return const permanentEmp();
            }));
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
        height: 50,
        decoration: BoxDecoration(
          color: Color(0xFF24695c),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Text("Get Started",style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),),
        ),
      ),
    );
  }
}