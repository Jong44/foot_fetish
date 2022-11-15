import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes/category.dart';
import 'package:shoes/homepage.dart';
import 'package:shoes/profile.dart';
import 'package:shoes/wishlist.dart';

import 'cart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foot Fetish',
      theme: ThemeData(
        
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Foot Fetish'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

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

  void updateIndex(int value){
    setState(() {
      pageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
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
            label: "Home"
          ),
          BottomNavigationBarItem(
              icon: pageIndex == 1
                  ? const Icon(Iconsax.search_normal5)
                  : const Icon(Iconsax.search_normal),
              label: "Home"
          ),
          BottomNavigationBarItem(
              icon: pageIndex == 2
                  ? const Icon(Iconsax.heart5)
                  : const Icon(Iconsax.heart),
              label: "Home"
          ),
          BottomNavigationBarItem(
              icon: pageIndex == 3
                  ? const Icon(Iconsax.shopping_cart5)
                  : const Icon(Iconsax.shopping_cart),
              label: "Home"
          ),
          BottomNavigationBarItem(
              icon: pageIndex == 4
                  ? const Icon(Iconsax.profile_circle5)
                  : const Icon(Iconsax.profile_circle),
              label: "Home"
          ),
        ],
        ),
    );
  }
}
