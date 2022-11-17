import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shoes/auth/login.dart';
import 'package:shoes/homepage.dart';
import 'package:shoes/main.dart';

class splash extends StatefulWidget{
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 3),
            ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset('assets/9.png'),
      ),

    );

  }

}