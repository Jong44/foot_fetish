

import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class wishlist extends StatefulWidget{
  State<wishlist> createState() => _wishlistState();
}

class _wishlistState extends State<wishlist>{

  String selected = "38";

  void alert(BuildContext context){
    AlertDialog alert = AlertDialog(
      title: Text("Alert"),
      content: Container(
        child: Text("Apakah anda yakin akan menghapus?"),
      ),
      actions: [
        TextButton(
          child: Text("Tidak"),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
          child: Text('Iya'),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );

    showDialog(context: context, builder: (context) => alert);
    return;
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
        title: Text("Wishlist", style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 10),
                width: 120,
                height: 190,
                decoration: BoxDecoration(
                    color: Color(0xffededed),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Image.asset('assets/7.png', fit: BoxFit.fitWidth,),
              ),
              Container(
                padding: EdgeInsets.only(top: 3),
                width: 220,
                height: 190,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Nike", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                        IconButton(onPressed: (){
                          alert(context);
                        }, icon: Icon(Icons.close, size: 23,), alignment: Alignment.topCenter, padding: EdgeInsets.zero, splashRadius: 20,)
                      ],
                    ),
                    Text("Zoom Fly 5 Mint Foam", style: TextStyle(color: Color(0x9c9c9c9c), height: 0.1,  fontSize: 12),),
                    Text("Rp 1.800.000", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, height: 2, fontSize: 12),),
                    SizedBox(height: 10,),
                    SizedBox(height: 55, width: 200, child: DropdownButtonFormField(
                      hint: Text("Size"),
                      itemHeight:50,
                      iconSize: 15,
                      style: TextStyle(fontSize: 15, color: Colors.black),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                      icon: Icon(CupertinoIcons.chevron_down),
                      value: selected,
                      onChanged: (String? newValue){
                        setState(() {
                          selected = newValue!;
                        });
                      },
                      items: [
                        DropdownMenuItem(
                          child: Text("38"), value: "38",
                        ),
                        DropdownMenuItem(
                            child: Text("39"), value: "39"
                        ),
                        DropdownMenuItem(
                            child: Text("40"), value: "40"
                        ),
                        DropdownMenuItem(
                            child: Text("41"), value: "41"
                        ),
                        DropdownMenuItem(
                            child: Text("42"), value: "42"
                        ),
                        DropdownMenuItem(
                            child: Text("43"), value: "43"
                        ),
                      ],

                    ),),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        fixedSize: Size(210, 30)
                      ),
                        onPressed: (){}, child:Text("Buy")
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 10),
                width: 120,
                height: 190,
                decoration: BoxDecoration(
                    color: Color(0xffededed),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Image.asset('assets/7.png', fit: BoxFit.fitWidth,),
              ),
              Container(
                padding: EdgeInsets.only(top: 3),
                width: 220,
                height: 190,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Nike", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                        IconButton(onPressed: (){
                          alert(context);
                        }, icon: Icon(Icons.close, size: 23,), alignment: Alignment.topCenter, padding: EdgeInsets.zero, splashRadius: 20,)
                      ],
                    ),
                    Text("Zoom Fly 5 Mint Foam", style: TextStyle(color: Color(0x9c9c9c9c), height: 0.1,  fontSize: 12),),
                    Text("Rp 1.800.000", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, height: 2, fontSize: 12),),
                    SizedBox(height: 10,),
                    SizedBox(height: 55, width: 200, child: DropdownButtonFormField(
                      hint: Text("Size"),
                      itemHeight:50,
                      iconSize: 15,
                      style: TextStyle(fontSize: 15, color: Colors.black),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                      icon: Icon(CupertinoIcons.chevron_down),
                      value: selected,
                      onChanged: (String? newValue){
                        setState(() {
                          selected = newValue!;
                        });
                      },
                      items: [
                        DropdownMenuItem(
                          child: Text("38"), value: "38",
                        ),
                        DropdownMenuItem(
                            child: Text("39"), value: "39"
                        ),
                        DropdownMenuItem(
                            child: Text("40"), value: "40"
                        ),
                        DropdownMenuItem(
                            child: Text("41"), value: "41"
                        ),
                        DropdownMenuItem(
                            child: Text("42"), value: "42"
                        ),
                        DropdownMenuItem(
                            child: Text("43"), value: "43"
                        ),
                      ],

                    ),),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            fixedSize: Size(210, 30)
                        ),
                        onPressed: (){}, child:Text("Buy")
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 10),
                width: 120,
                height: 190,
                decoration: BoxDecoration(
                    color: Color(0xffededed),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Image.asset('assets/7.png', fit: BoxFit.fitWidth,),
              ),
              Container(
                padding: EdgeInsets.only(top: 3),
                width: 220,
                height: 190,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Nike", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                        IconButton(onPressed: (){
                          alert(context);
                        }, icon: Icon(Icons.close, size: 23,), alignment: Alignment.topCenter, padding: EdgeInsets.zero, splashRadius: 20,)
                      ],
                    ),
                    Text("Zoom Fly 5 Mint Foam", style: TextStyle(color: Color(0x9c9c9c9c), height: 0.1,  fontSize: 12),),
                    Text("Rp 1.800.000", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, height: 2, fontSize: 12),),
                    SizedBox(height: 10,),
                    SizedBox(height: 55, width: 200, child: DropdownButtonFormField(
                      hint: Text("Size"),
                      itemHeight:50,
                      iconSize: 15,
                      style: TextStyle(fontSize: 15, color: Colors.black),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                      icon: Icon(CupertinoIcons.chevron_down),
                      value: selected,
                      onChanged: (String? newValue){
                        setState(() {
                          selected = newValue!;
                        });
                      },
                      items: [
                        DropdownMenuItem(
                          child: Text("38"), value: "38",
                        ),
                        DropdownMenuItem(
                            child: Text("39"), value: "39"
                        ),
                        DropdownMenuItem(
                            child: Text("40"), value: "40"
                        ),
                        DropdownMenuItem(
                            child: Text("41"), value: "41"
                        ),
                        DropdownMenuItem(
                            child: Text("42"), value: "42"
                        ),
                        DropdownMenuItem(
                            child: Text("43"), value: "43"
                        ),
                      ],

                    ),),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            fixedSize: Size(210, 30)
                        ),
                        onPressed: (){}, child:Text("Buy")
                    )
                  ],
                ),
              )
            ],
          ),

        ],
      ),
    );
  }

}