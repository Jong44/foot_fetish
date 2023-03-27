import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';


class category extends StatefulWidget{
  State<category> createState() => _categoryState();
}

class _categoryState extends State<category>{
  
  int list = 1 ;

  var items = <String>[];

  void filter(String quert){

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3.5),
          width: 310,
          height: 40,
          decoration: BoxDecoration(
            color: Color(0xEDEDEDED),
            borderRadius: BorderRadius.circular(10)
          ),
          child: 
          TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Search",
              hintStyle: TextStyle(
                color: Color(0xBBBBBBBB),
                fontSize: 15
              ),
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 23, vertical: 30),
              scrollDirection: Axis.horizontal,
              children: [
                ElevatedButton(
                    onPressed: (){
                      setState(() {
                        list = 1;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      fixedSize: Size(105, 60),
                        primary: list == 1 ? Colors.black : Color(0xEDEDEDED),
                      shadowColor: Colors.transparent
                    ),
                    child: Text("Women", style: TextStyle(color: list == 1 ? Colors.white : Color(0xBBBBBBBB)),),
                ),
                SizedBox(width: 15,),
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      list = 2;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      fixedSize: Size(105, 60),
                      primary: list == 2 ? Colors.black : Color(0xEDEDEDED),
                      shadowColor: Colors.transparent
                  ),
                  child: Text("Men", style: TextStyle(color: list == 2 ? Colors.white : Color(0xBBBBBBBB)),),
                ),
                SizedBox(width: 15,),
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      list = 3;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      fixedSize: Size(105, 60),
                      primary: list == 3 ? Colors.black : Color(0xEDEDEDED),
                      shadowColor: Colors.transparent
                  ),
                  child: Text("Kids", style: TextStyle(color: list == 3 ? Colors.white : Color(0xBBBBBBBB),),),
                ),
              ],
            ),
          ),
          if (list == 1) Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            height: 250,
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Running Shoes", style: TextStyle(fontSize: 15),),
                Divider(thickness: 0.9 , height: 35,),
                Text("Sneakers", style: TextStyle(fontSize: 15),),
                Divider(thickness: 1 , height: 35,),
                Text("Basketball Shoes", style: TextStyle(fontSize: 15),),
                Divider(thickness: 0.9 , height: 35,),

              ],
            ),
          )
          else if (list == 2) Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            height: 250,
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Running Shoes", style: TextStyle(fontSize: 15),),
                Divider(thickness: 0.9 , height: 35,),
                Text("Sneakers", style: TextStyle(fontSize: 15),),
                Divider(thickness: 1 , height: 35,),
                Text("Basketball Shoes", style: TextStyle(fontSize: 15),),
                Divider(thickness: 0.9 , height: 35,),

              ],
            ),
          )
          else Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              height: 250,
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Running Shoes", style: TextStyle(fontSize: 15),),
                  Divider(thickness: 0.9 , height: 35,),
                  Text("Sneakers", style: TextStyle(fontSize: 15),),
                  Divider(thickness: 1 , height: 35,),

                ],
              ),
            )
        ],
      ),
    );
  }

}