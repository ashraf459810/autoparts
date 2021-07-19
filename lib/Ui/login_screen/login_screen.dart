import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: size.height*0.2,
            width: size.width,
            
            child: Image.asset("assets/images/cover.png",fit: BoxFit.fill,),
          )
        ],
      ),
    );
  }
}
