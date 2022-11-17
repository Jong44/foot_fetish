import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class address extends StatefulWidget{
  State<address> createState() => _addresState();
}

class _addresState extends State<address>{

  String? nama = "Kevin";



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
        title: Text("Address", style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 25),
              height: 45,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0x9C9C9C9C)),
                borderRadius: BorderRadius.circular(10)
              ),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 15),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                  hintText: "Search",
                  prefixIcon: Icon(Iconsax.search_normal, color: Color(0x9C9C9C9C),)
                ),
              ),
            ),
            InkWell(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                width: MediaQuery.of(context).size.width,
                height: 185,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(nama!, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                    Text("081331739192", style: TextStyle(color: Colors.white, fontSize: 16, height: 2),),
                    SizedBox(height: 5,),
                    SizedBox(height: 45, child: AutoSizeText('New Sapphire Regency, Jalan K.S Tubun No.51, Kober, Purwokerto Barat', style: TextStyle(color: Colors.white), maxLines: 2,),),
                    Row(
                      children: [
                        ElevatedButton(
                            onPressed: (){},
                            child: Text("Edit Address"),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shape: RoundedRectangleBorder(side: BorderSide(color: Colors.white), borderRadius: BorderRadius.circular(10))
                          ),
                        ),
                        SizedBox(width: 10,),
                        ElevatedButton(
                          onPressed: (){},
                          child: Text("Select Address"),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              shape: RoundedRectangleBorder(side: BorderSide(color: Colors.white), borderRadius: BorderRadius.circular(10))
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ),
            SizedBox(height: 20,),
            InkWell(
                onTap: (){
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  width: MediaQuery.of(context).size.width,
                  height: 185,
                  decoration: BoxDecoration(
                      color: Color(0xF5F5F5F5),
                      borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0x9C9C9C9C))
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(nama!, style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                      Text("081331739192", style: TextStyle(color: Colors.black, fontSize: 16, height: 2),),
                      SizedBox(height: 5,),
                      SizedBox(height: 45, child: AutoSizeText('New Sapphire Regency, Jalan K.S Tubun No.51, Kober, Purwokerto Barat', style: TextStyle(color: Colors.black), maxLines: 2,),),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: (){},
                            child: Text("Edit Address", style: TextStyle(color: Colors.black),),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black), borderRadius: BorderRadius.circular(10)),
                                elevation: 0
                            ),
                          ),
                          SizedBox(width: 10,),
                          ElevatedButton(
                            onPressed: (){},
                            child: Text("Select Address", style: TextStyle(color: Colors.black)),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black), borderRadius: BorderRadius.circular(10)),
                              elevation: 0
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
            ),
            SizedBox(height: 20,),
            InkWell(
                onTap: (){
                },
                child: DottedBorder(
                  radius: Radius.circular(10),
                  dashPattern: [5],
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    decoration: BoxDecoration(
                        color: Color(0xF5F5F5F5),
                    ),
                    child: Text("+Add New Shipping Address", style: TextStyle(fontSize: 15),),
                  ),
                )
            )
          ],
        ),
      )
    );
  }

}