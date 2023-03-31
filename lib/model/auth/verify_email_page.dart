import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes/core.dart';
import 'package:shoes/main.dart';

class VerifyEmailPage extends StatefulWidget {
  @override
  _VerifyEmailPage createState() => _VerifyEmailPage();
}

class _VerifyEmailPage extends State<VerifyEmailPage> {
  bool isEmailVerifed = false;
  bool canResendEmail = false;
  bool cancel = true;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    isEmailVerifed = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerifed) {
      sendVerificationEmail();

      timer =
          Timer.periodic(Duration(seconds: 3), (_) => checkEmailisVerifed());
    }
  }

  @override
  void dispose() {
    timer?.cancel();

    super.dispose();
  }

  Future checkEmailisVerifed() async {
    await FirebaseAuth.instance.currentUser!.reload();

    setState(() {
      isEmailVerifed = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerifed) timer?.cancel();
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();

      setState(() => canResendEmail = false);
      await Future.delayed(Duration(seconds: 5));
      setState(() => canResendEmail = true);
    } catch (e) {
      Utils.showSnackBar(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) => isEmailVerifed
      ? MyHomePage()
      : Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text('Verify Email'),
          ),
          body: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('A verification email has been sent to your email',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton.icon(
                  onPressed: canResendEmail ? sendVerificationEmail : null,
                  label: Text("Resend Email"),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      primary: Colors.black,
                      fixedSize: Size(175, 45),
                      elevation: 0),
                  icon: Icon(
                    Iconsax.refresh,
                    size: 18,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      primary: Colors.black,
                      fixedSize: Size(175, 45),
                      elevation: 0),
                  child: Text(
                    'Cancel',
                    style: const TextStyle(color: Colors.white),
                  ),
                  onPressed: () => FirebaseAuth.instance.signOut(),
                )
              ],
            ),
          ),
        );
}
