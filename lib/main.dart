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

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 275,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffededed)
                ),
                child: TextField(
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 13
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.transparent
                        )
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    hintText: "Search",
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 13
                    ),
                    suffixIcon: Icon(
                      Iconsax.search_normal_14,
                      color: Colors.black,
                      size: 18,
                    )
                  ),
                ),
              ),
              Icon(
                Iconsax.notification,
                color: Colors.black,
                size: 28,
              )
            ],
          ),
        )
      ),
      body: page[pageIndex],
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              enableFeedback: false,
                onPressed: (){
                setState(() {
                  pageIndex = 0;
                });
                },
                icon: pageIndex == 0
                    ? const Icon(Iconsax.home_15)
                    : const Icon(Iconsax.home)
            ),
            IconButton(
                enableFeedback: false,
                onPressed: (){
                  setState(() {
                    pageIndex = 1;
                  });
                },
                icon: pageIndex == 1
                    ? const Icon(Iconsax.search_normal5)
                    : const Icon(Iconsax.search_normal)
            ),
            IconButton(
                enableFeedback: false,
                onPressed: (){
                  setState(() {
                    pageIndex = 2;
                  });
                },
                icon: pageIndex == 2
                    ? const Icon(Iconsax.heart5)
                    : const Icon(Iconsax.heart)
            ),
            IconButton(
                enableFeedback: false,
                onPressed: (){
                  setState(() {
                    pageIndex = 3;
                  });
                },
                icon: pageIndex == 3
                    ? const Icon(Iconsax.shopping_cart5)
                    : const Icon(Iconsax.shopping_cart)
            ),
            IconButton(
                enableFeedback: false,
                onPressed: (){
                  setState(() {
                    pageIndex = 4;
                  });
                },
                icon: pageIndex == 4
                    ? const Icon(Iconsax.profile_circle5)
                    : const Icon(Iconsax.profile_circle)
            )
          ],
        ),
      )
    );
  }
}
