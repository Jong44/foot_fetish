
import 'package:flutter/cupertino.dart';
import 'package:shoes/core.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState () => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) =>
      isLogin 
      ? Login(onClickedSignUp: toggle,) 
      : Register(onClickedSignIn: toggle);

  void toggle() => setState(() => isLogin = !isLogin);
}