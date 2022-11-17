import 'dart:io';

import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoes/address.dart';


class profile extends StatefulWidget{
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile>{

  File? image;
  var namaController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  String usernameDefault = "tanjung";
  String passwordDefault = "tanjung45";

  String? username;
  String? password;


  void nameAlert(BuildContext context){
    AlertDialog alert = AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: EdgeInsets.symmetric(horizontal: 15),
      title: Text("Name"),
      content: TextFormField(
        controller: namaController,
        textInputAction: TextInputAction.newline,
        maxLines: 1,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey),
          ),
          hintText: "Masukkan Nama",
          hintStyle: TextStyle(color: Colors.grey.shade300),
        ),
      ),
      actions: [
        ElevatedButton(
            onPressed: (){
              setState(() {
                name = namaController.text;
                Navigator.pop(context);
              });
            },
            child: Text("Simpan"),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            fixedSize: Size(MediaQuery.of(context).size.width, 20)
          ),
        )
      ],
    );

    showDialog(context: context, builder: (context) => alert);
    return;
  }

  void emailAlert(BuildContext context){
    AlertDialog alert = AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: EdgeInsets.symmetric(horizontal: 15),
      title: Text("Email"),
      content: TextFormField(
        controller: emailController,
        textInputAction: TextInputAction.newline,
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey),
          ),
          hintText: "Masukkan Email",
          hintStyle: TextStyle(color: Colors.grey.shade300),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: (){
            setState(() {
              email = emailController.text;
              Navigator.pop(context);
            });
          },
          child: Text("Simpan"),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              fixedSize: Size(MediaQuery.of(context).size.width, 20)
          ),
        )
      ],
    );

    showDialog(context: context, builder: (context) => alert);
    return;
  }

  void phoneAlert(BuildContext context){
    AlertDialog alert = AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: EdgeInsets.symmetric(horizontal: 15),
      title: Text("Phone"),
      content: TextFormField(
        controller: phoneController,
        textInputAction: TextInputAction.newline,
        maxLines: 1,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey),
          ),
          hintText: "Masukkan Phone",
          hintStyle: TextStyle(color: Colors.grey.shade300),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: (){
            setState(() {
              phone = phoneController.text;
              Navigator.pop(context);
            });
          },
          child: Text("Simpan"),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              fixedSize: Size(MediaQuery.of(context).size.width, 20)
          ),
        )
      ],
    );

    showDialog(context: context, builder: (context) => alert);
    return;
  }

  void genderAlert(BuildContext context){
    AlertDialog alert = AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: EdgeInsets.symmetric(horizontal: 15),
      title: Text("Gender"),
      content: DropdownButtonFormField(
        hint: Text("Gender"),
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
        value: gender,
        onChanged: (String? newValue){
          setState(() {
            gender = newValue!;
          });
        },
        items: [
          DropdownMenuItem(
            child: Text("Male"), value: "Male",
          ),
          DropdownMenuItem(
              child: Text("Female"), value: "Female"
          ),
        ],

      ),
      actions: [
        ElevatedButton(
          onPressed: (){
            setState(() {
              genders = gender;
              Navigator.pop(context);
            });
          },
          child: Text("Simpan"),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              fixedSize: Size(MediaQuery.of(context).size.width, 20)
          ),
        )
      ],
    );

    showDialog(context: context, builder: (context) => alert);
    return;
  }


  Future openCamera() async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
    image = File(pickedImage!.path);
  }

  Future openGaleri() async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    image = File(pickedImage!.path);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);

  }

  String? name;
  String gender = "Gender";
  String? genders;
  String? email;
  String? phone;



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
      body: ListView(
        children: [
          Center(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                image != null
                    ? ClipOval(
                    child: Image.file(
                      image!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    )
                )
                    : SizedBox(
                  width: 100,
                  height: 100,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/8.png'),
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
                  child: IconButton(
                      onPressed: (){
                        showModalBottomSheet(
                            context: context,
                            builder: ((builder) => Container(
                              height: 150,
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Color(0xedededed),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Foto Profil", style: TextStyle(fontSize: 20),),
                                  SizedBox(height: 20,),
                                  Row(
                                    children: [
                                      ElevatedButton(
                                          onPressed: (){
                                            openCamera();
                                            Navigator.pop(context);
                                          },
                                          child: Icon(Iconsax.camera, color: Colors.black,),
                                        style: ElevatedButton.styleFrom(
                                          shape: CircleBorder(side: BorderSide(color: Colors.black)),
                                          fixedSize: Size(60, 60),
                                          primary: Colors.transparent,
                                          elevation: 0
                                        )
                                      ),
                                      SizedBox(width: 20,),
                                      ElevatedButton(
                                          onPressed: (){
                                            openGaleri();
                                            Navigator.pop(context);
                                          },
                                          child: Icon(Iconsax.gallery, color: Colors.black,),
                                          style: ElevatedButton.styleFrom(
                                              shape: CircleBorder(side: BorderSide(color: Colors.black)),
                                              fixedSize: Size(60, 60),
                                              primary: Colors.transparent,
                                              elevation: 0
                                          )
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                            )
                        );
                      },
                      icon: Icon(Iconsax.edit, size: 13, color: Colors.white)
                  ),
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
                          Text(name ?? "Your Name",  style: TextStyle(fontSize: 15),),
                          IconButton(
                              onPressed: (){
                                nameAlert(context);
                              },
                              icon: Icon(CupertinoIcons.right_chevron, size: 15,))
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
                          Text(genders ?? "Your Gender",  style: TextStyle(fontSize: 15),),
                          IconButton(onPressed: (){
                            genderAlert(context);
                          },
                              icon: Icon(CupertinoIcons.right_chevron, size: 15,)
                          )
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
                          Text(email ?? "Your Email",  style: TextStyle(fontSize: 15, decoration: TextDecoration.underline),),
                          IconButton(
                              onPressed: (){
                                emailAlert(context);
                              },
                              icon: Icon(CupertinoIcons.right_chevron, size: 15,)
                          )
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
                          Text(phone ?? "Your Phone",  style: TextStyle(fontSize: 15),),
                          IconButton(onPressed: (){
                            phoneAlert(context);
                          },
                              icon: Icon(CupertinoIcons.right_chevron, size: 15,)
                          )
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
                          IconButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (builder) => address()));
                              },
                              icon: Icon(CupertinoIcons.right_chevron, size: 15,)
                          )
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