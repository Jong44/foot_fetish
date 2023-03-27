import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoes/view/page/address.dart';

import '../../model/auth/login.dart';

class profile extends StatefulWidget {
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  File? image;
  var namaController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  List listGender = [
    "Laki - Laki",
    "Perempuan",
  ];
  var gender;

  final fDatabase = FirebaseDatabase.instance;
  final fAuth = FirebaseAuth.instance;
  final fStorage = FirebaseStorage.instance;

  String usernameDefault = "tanjung";
  String passwordDefault = "tanjung45";

  String? username;
  String? password;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void nameAlert(BuildContext context) {
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
          onPressed: () {
            fDatabase
                .reference()
                .child('profile')
                .child('name')
                .set(namaController.text);
            setState(() {
              nama = namaController.text;
            });
            Navigator.pop(context);
          },
          child: Text("Simpan"),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              fixedSize: Size(MediaQuery.of(context).size.width, 20)),
        )
      ],
    );

    showDialog(context: context, builder: (context) => alert);
    return;
  }

  void emailAlert(BuildContext context) {
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
          onPressed: () {
            fDatabase
                .reference()
                .child('profile')
                .child('email')
                .set(emailController.text);
            setState(() {
              emails = emailController.text;
            });
            Navigator.pop(context);
          },
          child: Text("Simpan"),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              fixedSize: Size(MediaQuery.of(context).size.width, 20)),
        )
      ],
    );

    showDialog(context: context, builder: (context) => alert);
    return;
  }

  void phoneAlert(BuildContext context) {
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
          onPressed: () {
            fDatabase
                .reference()
                .child('profile')
                .child('phone')
                .set(phoneController.text);
            setState(() {
              phones = phoneController.text;
            });
            Navigator.pop(context);
          },
          child: Text("Simpan"),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              fixedSize: Size(MediaQuery.of(context).size.width, 20)),
        )
      ],
    );

    showDialog(context: context, builder: (context) => alert);
    return;
  }

  Future openCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    image = File(pickedImage!.path);
  }

  Future openGaleri() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    image = File(pickedImage!.path);
  }

  var currentUser = FirebaseAuth.instance.currentUser;

  // Future resetEmail(String newEmail) async {
  //   var message;
  //   User firebaseUser = await fAuth.currentUser();
  //   firebaseUser
  //       .updateEmail(newEmail)
  //       .then(
  //         (value) => message = 'Success',
  //       )
  //       .catchError((onError) => message = 'error');
  //   return message;
  // }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  String? genders;
  String? nama;
  String? phones;
  String? emails;

  bool isLoading = false;

  Future<void> getData() async {
    setState(() {
      isLoading = true;
    });

    var name = await fDatabase.ref().child('profile').child('name').get();
    var gender = await fDatabase.ref().child('profile').child('gender').get();
    var email = await fDatabase.ref().child('profile').child('email').get();
    var phone = await fDatabase.ref().child('profile').child('phone').get();
    var image_profile =
        await fDatabase.ref().child('profile').child('image_profile').get();

    setState(() {
      nama = name.value.toString();
      emails = email.value.toString();
      phones = phone.value.toString();
    });

    setState(() {
      isLoading = false;
    });
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
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Iconsax.arrow_left,
              color: Colors.black,
            ),
          ),
        ),
        centerTitle: true,
        title: Text("Profile",
            style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
              onPressed: () => FirebaseAuth.instance.signOut(),
              icon: Icon(
                Iconsax.logout5,
                color: Colors.black,
              ))
        ],
      ),
      body: isLoading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
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
                          ))
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
                          color: Colors.black, shape: BoxShape.circle),
                      child: IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: ((builder) => Container(
                                      height: 150,
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        color: Color(0xedededed),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Foto Profil",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            children: [
                                              ElevatedButton(
                                                  onPressed: () {
                                                    openCamera();
                                                    Navigator.pop(context);
                                                  },
                                                  child: Icon(
                                                    Iconsax.camera,
                                                    color: Colors.black,
                                                  ),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          shape: CircleBorder(
                                                              side: BorderSide(
                                                                  color: Colors
                                                                      .black)),
                                                          fixedSize:
                                                              Size(60, 60),
                                                          primary: Colors
                                                              .transparent,
                                                          elevation: 0)),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              ElevatedButton(
                                                  onPressed: () {
                                                    openGaleri();
                                                    Navigator.pop(context);
                                                  },
                                                  child: Icon(
                                                    Iconsax.gallery,
                                                    color: Colors.black,
                                                  ),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          shape: CircleBorder(
                                                              side: BorderSide(
                                                                  color: Colors
                                                                      .black)),
                                                          fixedSize:
                                                              Size(60, 60),
                                                          primary: Colors
                                                              .transparent,
                                                          elevation: 0))
                                            ],
                                          )
                                        ],
                                      ),
                                    )));
                          },
                          icon: Icon(Iconsax.edit,
                              size: 13, color: Colors.white)),
                    )
                  ],
                )),
                SizedBox(
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 350,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Name",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            child: Row(
                              children: [
                                Text(
                                  nama ?? "Your Name",
                                  style: TextStyle(fontSize: 15),
                                ),
                                IconButton(
                                    onPressed: () {
                                      nameAlert(context);
                                    },
                                    icon: Icon(
                                      CupertinoIcons.right_chevron,
                                      size: 15,
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                      Divider(
                        height: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Gender",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            child: Row(
                              children: [
                                Text(
                                  genders ?? "Your Gender",
                                  style: TextStyle(fontSize: 15),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      CupertinoIcons.right_chevron,
                                      size: 15,
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                      Divider(
                        height: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Email",
                            style: TextStyle(fontSize: 15),
                          ),
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.only(left: 100),
                              child: (Text(
                                '${FirebaseAuth.instance.currentUser?.email}',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 15,
                                    decoration: TextDecoration.underline),
                              )),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                emailAlert(context);
                              },
                              icon: Icon(
                                CupertinoIcons.right_chevron,
                                size: 15,
                              ))
                        ],
                      ),
                      Divider(
                        height: 1,
                        thickness: 0.8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Phone",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            child: Row(
                              children: [
                                Text(
                                  phones ?? "Your Phone",
                                  style: TextStyle(fontSize: 15),
                                ),
                                IconButton(
                                    onPressed: () {
                                      phoneAlert(context);
                                    },
                                    icon: Icon(
                                      CupertinoIcons.right_chevron,
                                      size: 15,
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                      Divider(
                        height: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Address",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (builder) => address()));
                                    },
                                    icon: Icon(
                                      CupertinoIcons.right_chevron,
                                      size: 15,
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                      Divider(
                        height: 1,
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
