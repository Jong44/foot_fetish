import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:shoes/core.dart';
import 'package:shoes/view/page/homepage.dart';
import 'package:shoes/main.dart';

class Success extends StatefulWidget {
  State<Success> createState() => _successState();
}

class _successState extends State<Success> {
  final fDatabase = FirebaseDatabase.instance;
  String? nama;

  bool isLoading = false;

  Future<void> getData() async {
    setState(() {
      isLoading = true;
    });

    var name = await fDatabase.ref().child('profile').child('name').get();

    setState(() {
      nama = name.value.toString();
    });

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  String currentDate = DateFormat('MMM dd, yyyy').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Payment Status",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Center(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                color: Colors.transparent,
                height: 665,
                alignment: Alignment.topCenter,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          color: Color(0xff82C639).withOpacity(0.3),
                          shape: BoxShape.circle),
                    ),
                    Container(
                      width: 85,
                      height: 85,
                      decoration: BoxDecoration(
                          color: Color(0xff82C639).withOpacity(0.5),
                          shape: BoxShape.circle),
                    ),
                    Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                          color: Color(0xff82C639), shape: BoxShape.circle),
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 444,
                margin: EdgeInsets.only(top: 70),
                width: MediaQuery.of(context).size.width,
                child: Image.asset("assets/border_success.png",
                    width: 64.0, height: 64.0),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 130.0,
                  ),
                  Text(
                    "Payment Success",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    "Your package is in progress",
                    style: TextStyle(fontSize: 16.0, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 35.0,
                  ),
                  SizedBox(
                    width: 295,
                    height: 30.0,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Date",
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.grey),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            currentDate,
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  SizedBox(
                    width: 295,
                    height: 30.0,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Payment Method",
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.grey),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "BCA",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  SizedBox(
                    width: 295,
                    height: 30.0,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Name",
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.grey),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            nama ?? "Your Name",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  SizedBox(
                    width: 295,
                    height: 30.0,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Amount",
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.grey),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Rp1.620.000",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  SizedBox(
                    width: 295,
                    height: 30.0,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Additional Cart",
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.grey),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Rp0",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "--------------------------",
                    style: TextStyle(
                        fontSize: 25,
                        letterSpacing: 5,
                        color: Color(0xedededed)),
                  ),
                  SizedBox(
                    width: 295,
                    height: 30.0,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Total Pay",
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.black),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Rp1.620.000",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 120.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => MainPage()));
                        },
                        child: Text("Back to Home"),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            fixedSize:
                                Size(MediaQuery.of(context).size.width, 45))),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
