import 'package:flutter/material.dart';
import 'package:pahrm/permanentEmp.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image:DecorationImage(
                image: AssetImage('assets/LoginBack0.jpg'),fit: BoxFit.cover,opacity: 09
            )
        ),
          child: Column(
            children: [
              SafeArea(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(30, 25, 30, 25),
                  padding: const EdgeInsets.fromLTRB(10, 35, 10, 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                      children:  const [
                        Header(),InputField(),Button(),
                      ]
                  ),
                ),
              ),
            ],
          ),

      )

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
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(10),
          child: const Text("Login", style: TextStyle(color: Color(0xFF24695c), fontSize: 35,fontWeight: FontWeight.bold,),),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(

          ),
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.account_box,size: 40,color: Color(0xFF24695c),),
                hintText: "USER NAME",
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
                prefixIcon: Icon(Icons.password_rounded,size: 30,color: const Color(0xFF24695c)),
                border:OutlineInputBorder(borderSide:BorderSide(color: Color(0xFF24695c),),
                  borderRadius: BorderRadius.circular(10),),
                enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: Color(0xFF24695c),),
                borderRadius: BorderRadius.circular(15),
              ),
                hintText: "PASSWORD",
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[

          Center(

            child: Image(
              image:AssetImage('assets/logo2.png',),width: 190.0,height: 120.0,),
          ),
          Center(
            child: Text("Employee Monitoring With GPS Tracking", style: TextStyle(color: Color(0xFF0D203B), fontSize: 15,fontWeight: FontWeight.bold,),),
          ),

        ],
      ),
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
        height: 50,
        margin: const EdgeInsets.fromLTRB(50, 20, 50, 0),
        decoration: BoxDecoration(
          color: const Color(0xFF24695c),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Text("Login",style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold
          ),),
        ),
      ),
    );
  }
}