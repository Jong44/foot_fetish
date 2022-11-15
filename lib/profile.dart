import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class profile extends StatefulWidget{
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile>{
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
        title: Text("Profile", style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Center(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff4f7485),
                      image: DecorationImage(
                          image: AssetImage('assets/8.png'),
                          fit: BoxFit.contain
                      )
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(bottom: 10),
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle
                  ),
                  child: IconButton(onPressed: (){}, icon: Icon(Iconsax.edit, size: 13, color: Colors.white)),
                )
              ],
            )
          ),
          SizedBox(height: 50,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 300,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Name", style: TextStyle(fontSize: 15),),
                    SizedBox(
                      child: Row(
                        children: [
                          Text("Mellafesa R",  style: TextStyle(fontSize: 15),),
                          IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.right_chevron, size: 15,))
                        ],
                      ),
                    )
                  ],
                ),
                Divider(height: 1,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Gender", style: TextStyle(fontSize: 15),),
                    SizedBox(
                      child: Row(
                        children: [
                          Text("Female",  style: TextStyle(fontSize: 15),),
                          IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.right_chevron, size: 15,))
                        ],
                      ),
                    )
                  ],
                ),
                Divider(height: 1,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Email", style: TextStyle(fontSize: 15),),
                    SizedBox(
                      child: Row(
                        children: [
                          Text("mellafesarfd@gmail.com",  style: TextStyle(fontSize: 15, decoration: TextDecoration.underline),),
                          IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.right_chevron, size: 15,))
                        ],
                      ),
                    )
                  ],
                ),
                Divider(height: 1, thickness: 0.8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Phone", style: TextStyle(fontSize: 15),),
                    SizedBox(
                      child: Row(
                        children: [
                          Text("081234567890",  style: TextStyle(fontSize: 15),),
                          IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.right_chevron, size: 15,))
                        ],
                      ),
                    )
                  ],
                ),
                Divider(height: 1,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Address", style: TextStyle(fontSize: 15),),
                    SizedBox(
                      child: Row(
                        children: [
                          IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.right_chevron, size: 15,))
                        ],
                      ),
                    )
                  ],
                ),
                Divider(height: 1,),
              ],
            ),
          )
        ],
      ),
    );
  }

}