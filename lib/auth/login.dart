import 'dart:core';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes/auth/register.dart';
import 'package:shoes/main.dart';

class Login extends StatefulWidget{
  State<Login> createState() => _loginState();
}

class _loginState extends State<Login>{

  bool hide = true;
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  String usernameDefault = "tanjung";
  String passwordDefault = "tanjung45";

  String? username;
  String? password;

  void errorAlert(BuildContext context){
    AlertDialog alert = AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: EdgeInsets.symmetric(horizontal: 15),
      title: Text("Name"),
      content: Container(child: Text("EROR"),),
      actions: [
        ElevatedButton(
          onPressed: (){
            setState(() {
              Navigator.pop(context);
            });
          },
          child: Text("Simpan"),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              fixedSize: Size(MediaQuery.of(context).size.width, 20)
          ),
        )
      ],
    );

    showDialog(context: context, builder: (context) => alert);
    return;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.only(top: 120, right: 20, left: 20),
        physics: NeverScrollableScrollPhysics(),
        children: [
          Center(child: Image.asset('assets/10.png', fit: BoxFit.contain, width: 80,),),
          SizedBox(height: 30,),
          Text("Username", style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(height: 7,),
          TextFormField(
            controller: usernameController,
            textInputAction: TextInputAction.newline,
            maxLines: 1,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey),
              ),
              hintText: "Masukkan Username",
              hintStyle: TextStyle(color: Colors.grey.shade300),
            ),
          ),
          SizedBox(height: 30,),
          Text("Password", style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(height: 7,),
          TextFormField(
            controller: passwordController,
            obscureText: hide,
            textInputAction: TextInputAction.newline,
            maxLines: 1,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey),
              ),
              hintText: "Masukkan Password",
              hintStyle: TextStyle(color: Colors.grey.shade300),
              suffixIcon:  hide == true
                ? IconButton(onPressed: (){
                    setState(() {
                      hide = false;
                    });
                  },
                  icon: Icon(Iconsax.eye_slash, color: Colors.grey, size: 20,))
                  : IconButton(onPressed: (){
                    setState(() {
                      hide = true;
                    });
                  }, icon: Icon(Iconsax.eye, color: Colors.grey, size: 20,))
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(
              onPressed: (){
                setState(() {
                  username = usernameController.text;
                  password = passwordController.text;
                  if (username == usernameDefault || password == passwordDefault ){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: "foot_fetish")));
                  }
                  else {
                    errorAlert(context);
                  }
                });
              },
              child: Text("Sign In"),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                primary: Colors.black,
                fixedSize: Size(50, 50),
                elevation: 0
              ),
          ),
          SizedBox(height: 30,),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 10),
                height: 0.3,
                width: 160,
                decoration: BoxDecoration(
                  color: Colors.grey
                ),
              ),
              Text("or"),
              Container(
                margin: EdgeInsets.only(left: 10),
                height: 0.3,
                width: 159,
                decoration: BoxDecoration(
                    color: Colors.grey
                ),
              ),
            ],
          ),
          SizedBox(height: 30,),
          ElevatedButton(
            onPressed: (){
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/11.png'),
                SizedBox(width: 10,),
                Text('Sign in with Google', style: TextStyle(color: Color(0x9C9C9C9C)),)
              ],
            ),
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(width: 1, color: Colors.grey.shade300)),
                primary: Colors.white,
                fixedSize: Size(50, 50),
              elevation: 0
            ),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account? ", style: TextStyle(fontWeight: FontWeight.bold),),
              TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
                },
                child: Text("Sign Up", style: TextStyle(color: Colors.black, decoration: TextDecoration.underline),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}