import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shoes/core.dart';
import 'package:shoes/model/auth/verify_email_page.dart';
import 'package:shoes/state_util.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes/view/page/category.dart';
import 'package:shoes/view/page/homepage.dart';
import 'package:shoes/view/page/profile.dart';
import 'package:shoes/view/page/wishlist.dart';
import 'view/page/splash.dart';

import 'view/page/cart.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: Utils.messengerKey,
      title: 'Foot Fetish',
      navigatorKey: navigatorKey,
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: splash(),
    );
    // BrandService().getBrand().then((value) => print(" value: $value"));
    // ProductService().getProduct().then((value) => print(" value: $value"));
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Something went wrong'));
            } else if (snapshot.hasData) {
              // return MyHomePage(title: 'title');
              return VerifyEmailPage();
            } else {
              return AuthPage();
            }
          },
        ),
      );
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int pageIndex = 0;

  final page = [
    homepage(),
    category(),
    wishlist(),
    cart(),
    profile(),
  ];

  void updateIndex(int value) {
    setState(() {
      pageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: page[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        enableFeedback: false,
        onTap: updateIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        elevation: 5,
        items: [
          BottomNavigationBarItem(
            icon: pageIndex == 0
                ? const Icon(Iconsax.home_15)
                : const Icon(Iconsax.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: pageIndex == 1
                  ? const Icon(Iconsax.search_normal5)
                  : const Icon(Iconsax.search_normal),
              label: "Search"),
          BottomNavigationBarItem(
              icon: pageIndex == 2
                  ? const Icon(Iconsax.heart5)
                  : const Icon(Iconsax.heart),
              label: "Wishlist"),
          BottomNavigationBarItem(
              icon: pageIndex == 3
                  ? const Icon(Iconsax.shopping_cart5)
                  : const Icon(Iconsax.shopping_cart),
              label: "Cart"),
          BottomNavigationBarItem(
              icon: pageIndex == 4
                  ? const Icon(Iconsax.profile_circle5)
                  : const Icon(Iconsax.profile_circle),
              label: "Profile"),
        ],
      ),
    );
  }
}
