import 'dart:core';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes/main.dart';
import 'package:shoes/model/auth/forgot_password_page.dart';
import 'package:shoes/model/auth/register.dart';

class Login extends StatefulWidget {
  final VoidCallback onClickedSignUp;

  const Login({
    Key? key,
    required this.onClickedSignUp,
  }) : super(key: key);

  State<Login> createState() => _loginState();
}

class _loginState extends State<Login> {
  bool hide = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  String emailDefault = "a";
  String passwordDefault = "a";

  String? email;
  String? password;

  void errorAlert(BuildContext context) {
    AlertDialog alert = AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: EdgeInsets.symmetric(horizontal: 15),
      title: Center(
        child: Icon(
          Iconsax.warning_2,
          size: 50,
        ),
      ),
      content: Container(
        child: Text(
          "Wrong email and password",
          textAlign: TextAlign.center,
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          },
          child: Text(
            "OKE",
            style: TextStyle(fontSize: 12),
          ),
          style: ElevatedButton.styleFrom(
              primary: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              fixedSize: Size(MediaQuery.of(context).size.width, 20)),
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
          Center(
            child: Image.asset(
              'assets/10.png',
              fit: BoxFit.contain,
              width: 80,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Email",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 7,
          ),
          TextFormField(
            controller: emailController,
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
              hintText: "Email",
              hintStyle: TextStyle(color: Colors.grey.shade300),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Password",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 7,
          ),
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
                hintText: "Password",
                hintStyle: TextStyle(color: Colors.grey.shade300),
                suffixIcon: hide == true
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            hide = false;
                          });
                        },
                        icon: Icon(
                          Iconsax.eye_slash,
                          color: Colors.grey,
                          size: 20,
                        ))
                    : IconButton(
                        onPressed: () {
                          setState(() {
                            hide = true;
                          });
                        },
                        icon: Icon(
                          Iconsax.eye,
                          color: Colors.grey,
                          size: 20,
                        ))),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: signIn,
            child: Text("Sign In"),
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                primary: Colors.black,
                fixedSize: Size(50, 50),
                elevation: 0),
          ),
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              alignment: Alignment.center,
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
              ),
            ),
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ForgotPasswordPage())),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 0.3,
                width: 160,
                decoration: BoxDecoration(color: Colors.grey),
              ),
              Text("or"),
              Container(
                height: 0.3,
                width: 159,
                decoration: BoxDecoration(color: Colors.grey),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: (){},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/11.png'),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Sign in with Google',
                  style: TextStyle(color: Color(0x9C9C9C9C)),
                )
              ],
            ),
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(width: 1, color: Colors.grey.shade300)),
                primary: Colors.white,
                fixedSize: Size(50, 50),
                elevation: 0),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account? ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              RichText(
                text: TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = widget.onClickedSignUp,
                  text: 'Sign Up',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Future signIn() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()));

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseException catch (e) {
      print(e);

      Utils.showSnackBar(e.message);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
