import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Notif extends StatefulWidget{
  State<Notif> createState() => _notifState();
}

class _notifState extends State<Notif> {

  List days = <String>[
    "Today",
    "Yesterdey",
    "Last Week"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        leadingWidth: 40,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.only(left: 10),
          child: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Iconsax.arrow_left, color: Colors.black,),
          ),
        ),
        centerTitle: true,
        title: Text("Notification", style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold)),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(days[index], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
              SizedBox(height: 10,),
              Container(
                height: 75,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 15),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      child: Icon(Iconsax.receipt_disscount, color: Colors.white, size: 30,),
                    ),
                    SizedBox(
                      width: 260,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("NIKE Up to 50% OFF",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                          Text("Don't miss this discount! Let's checkout...", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),),
                          Text("1 hour ago", style: TextStyle(color: Colors.grey.shade400,fontSize: 12, fontWeight: FontWeight.w400, height: 1),)
                        ],
                      ),
                    ),
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle
                      ),
                    )
                  ],
                ),
              ),
              Divider()
            ],
          );
        },
      ),

    );

  }


}