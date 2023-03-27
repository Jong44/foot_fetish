import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes/model/auth/login.dart';
import 'package:intl/intl.dart';

import '../../main.dart';

class Register extends StatefulWidget {
  final VoidCallback onClickedSignIn;

  const Register({
    Key? key,
    required this.onClickedSignIn,
  }) : super(key: key);

  State<Register> createState() => _registerState();
}

class _registerState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final emailController = TextEditingController();
  bool hide = true;
  bool hide2 = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  void errorAlert(BuildContext context) {
    AlertDialog alert = AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: EdgeInsets.symmetric(horizontal: 15),
      title: Text("Name"),
      content: Container(
        child: Text("EROR"),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          },
          child: Text("Simpan"),
          style: ElevatedButton.styleFrom(
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
        body: Form(
      key: formKey,
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(top: 100, right: 20, left: 20),
        children: [
          Center(
            child: Image.asset(
              'assets/10.png',
              fit: BoxFit.contain,
              width: 80,
            ),
          ),
          // SizedBox(
          //   height: 20,
          // ),
          // Text(
          //   "Username",
          //   style: TextStyle(fontWeight: FontWeight.bold),
          // ),
          // SizedBox(
          //   height: 5,
          // ),
          // SizedBox(
          //   height: 45,
          //   child: TextFormField(
          //     controller: usernameController,
          //     textInputAction: TextInputAction.newline,
          //     maxLines: 1,
          //     decoration: InputDecoration(
          //         focusedBorder: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(10),
          //           borderSide: BorderSide(color: Colors.grey),
          //         ),
          //         enabledBorder: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(8),
          //           borderSide: BorderSide(color: Colors.grey),
          //         ),
          //         hintText: "Masukkan Username",
          //         hintStyle: TextStyle(color: Colors.grey.shade300),
          //         contentPadding:
          //             EdgeInsets.only(top: 10, right: 20, left: 20)),
          //   ),
          // ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Email",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
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
                contentPadding: EdgeInsets.only(top: 10, right: 20, left: 20)),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (email) =>
                email != null && !EmailValidator.validate(email)
                    ? 'Enter a valid email'
                    : null,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Password",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          TextFormField(
            controller: passwordController,
            obscureText: hide,
            textInputAction: TextInputAction.newline,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => value != null && value.length < 6
                ? 'Enter min. 6 characters'
                : null,
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
                contentPadding: EdgeInsets.only(top: 10, right: 20, left: 20),
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
                          size: 17,
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
          Text(
            "Confirm Password",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          TextFormField(
            controller: confirmPasswordController,
            obscureText: hide2,
            textInputAction: TextInputAction.newline,
            maxLines: 1,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value != passwordController.text) {
                return 'Password is not matched';
              } else if (value != null && value.length < 6) {
                return 'Enter min. 6 characters';
              }
            },
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                hintText: "Confirm Password",
                hintStyle: TextStyle(color: Colors.grey.shade300),
                contentPadding: EdgeInsets.only(top: 10, right: 20, left: 20),
                suffixIcon: hide2 == true
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            hide2 = false;
                          });
                        },
                        icon: Icon(
                          Iconsax.eye_slash,
                          color: Colors.grey,
                          size: 17,
                        ))
                    : IconButton(
                        onPressed: () {
                          setState(() {
                            hide2 = true;
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
            onPressed: signUp,
            child: Text("Sign Up"),
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                primary: Colors.black,
                fixedSize: Size(40, 45),
                elevation: 0),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 10),
                height: 0.3,
                width: 160,
                decoration: BoxDecoration(color: Colors.grey),
              ),
              Text("or"),
              Container(
                margin: EdgeInsets.only(left: 10),
                height: 0.3,
                width: 159,
                decoration: BoxDecoration(color: Colors.grey),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {},
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
                fixedSize: Size(40, 45),
                elevation: 0),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account? ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              RichText(
                text: TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = widget.onClickedSignIn,
                  text: 'Sign In',
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
    ));
  }

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()));

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar(e.message);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}

class Utils {
  static GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackBar(String? text) {
    if (text == null) return;

    final snackBar = SnackBar(content: Text(text), backgroundColor: Colors.red);

    FocusManager.instance.primaryFocus?.unfocus();

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
