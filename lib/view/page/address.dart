import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:collection/collection.dart';

class address extends StatefulWidget{
  State<address> createState() => _addresState();
}

class _addresState extends State<address>{

  final userId = FirebaseAuth.instance.currentUser!.uid;

  final fDatabase = FirebaseDatabase.instance;
  var namaController = TextEditingController();
  var alamatController = TextEditingController();
  var phoneController = TextEditingController();
  String searchQuery = "";

  int? length;

  String? namas;
  String? alamats;
  String? phones;
  String? actives;
  bool isLoading = false;
  List<Map<dynamic, dynamic>> lists = [];

  Future<void> getAddressCount() async {

    setState(() {
      isLoading = true;
    });

    final snapshot = await FirebaseDatabase.instance
        .reference()
        .child('user')
        .child(userId)
        .child('profile')
        .child('address')
        .once();
    final addressMap = snapshot.snapshot.value as Map?;
    setState(() {
      if(addressMap!.isNotEmpty){
        length = addressMap?.length;
      } else {
        length = 0;
      }
    });

    setState(() {
      isLoading = false;
    });
  }

  void AlamatAlert(context, {required address}){
    AlertDialog alert = AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: EdgeInsets.symmetric(horizontal: 15),
      title: Text("Alamat"),
      content: SizedBox(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nama :"),
            TextFormField(
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
                hintText: "Masukkan Phone",
                hintStyle: TextStyle(color: Colors.grey.shade300),
              ),
            ),
            Text("Alamat :"),
            TextFormField(
              controller: alamatController,
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
            Text("Phone :"),
            TextFormField(
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
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: (){
            fDatabase.ref().child('user').child(userId).child('profile').child('address').child(address['key']).set({
              'nama': namaController.text,
              'alamat': alamatController.text,
              'phone': phoneController.text
            }).asStream();

            setState(() {
              namas = namaController.text;
              alamats = alamatController.text;
              phones = phoneController.text;
            });

            Navigator.pop(context);
          },
          child: Text("Simpan"),
          style: ElevatedButton.styleFrom(
              primary: Colors.black,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              fixedSize: Size(MediaQuery.of(context).size.width, 20)
          ),
        )
      ],
    );

    showDialog(context: context, builder: (context) => alert);
    return;
  }

  void CreateAlamatAlert(context,){
    AlertDialog alert = AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: EdgeInsets.symmetric(horizontal: 15),
      title: Text("Alamat"),
      content: SizedBox(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nama :"),
            TextFormField(
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
                hintText: "Masukkan Phone",
                hintStyle: TextStyle(color: Colors.grey.shade300),
              ),
            ),
            Text("Alamat :"),
            TextFormField(
              controller: alamatController,
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
            Text("Phone :"),
            TextFormField(
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
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: (){
            fDatabase.ref().child('user').child(userId).child('profile').child('address').push().set({
              'nama': namaController.text,
              'alamat': alamatController.text,
              'phone': phoneController.text
            });

            setState(() {
              namas = namaController.text;
              alamats = alamatController.text;
              phones = phoneController.text;
            });

            Navigator.pop(context);
          },
          child: Text("Simpan"),
          style: ElevatedButton.styleFrom(
              primary: Colors.black,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              fixedSize: Size(MediaQuery.of(context).size.width, 20)
          ),
        )
      ],
    );

    showDialog(context: context, builder: (context) => alert);
    return;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAddressCount();
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
        title: Text("Address", style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold)),
      ),
      body: isLoading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
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
                    onChanged: (value){
                      setState(() {
                        searchQuery = value;
                      });
                    },
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 15),
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: "Search",
                        prefixIcon: Icon(Iconsax.search_normal, color: Color(0x9C9C9C9C),)
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: (185 * length! + 20).toDouble(),
                  child: FirebaseAnimatedList(
                    defaultChild: Center(child: CircularProgressIndicator(),),
                    query: fDatabase.ref().child('user').child(userId).child('profile').child('address'),
                    itemBuilder: (context, snapshot, animation, index){
                      Map address = snapshot.value as Map;
                      address['key'] = snapshot.key;

                      var nama = address['nama'];
                      var alamat = address['alamat'];
                      var phone = address['phone'];
                      var active = address['active'];

                      if (searchQuery.isNotEmpty) {
                        if (!nama.toLowerCase().contains(searchQuery.toLowerCase())) {
                          return SizedBox();
                        }
                      }

                      return Column(
                        children: [
                          InkWell(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                                width: MediaQuery.of(context).size.width,
                                height: 185,
                                decoration: BoxDecoration(
                                    color: active == "true" ? Colors.black : Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: active == "false" ? Border.all(width: 1, color: Colors.black) : Border.all(width: 0)
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(nama, style: TextStyle(color: active == "true" ? Colors.white : Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                                    Text(phone.toString(), style: TextStyle(color: active == "true" ? Colors.white : Colors.black, fontSize: 16, height: 2),),
                                    SizedBox(height: 5,),
                                    SizedBox(height: 45, child: AutoSizeText(alamat, style: TextStyle(color: active == "true" ? Colors.white : Colors.black), maxLines: 2,),),
                                    Row(
                                      children: [
                                        ElevatedButton(
                                          onPressed: (){
                                            AlamatAlert(context, address: address);
                                          },
                                          child: Text("Edit Address", style: TextStyle(color: active == "true" ? Colors.white : Colors.black),),
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.transparent,
                                              shape: RoundedRectangleBorder(side: BorderSide(color: active == "true" ? Colors.white : Colors.black), borderRadius: BorderRadius.circular(10)),
                                              elevation: 0
                                          ),
                                        ),
                                        SizedBox(width: 10,),
                                        ElevatedButton(
                                          onPressed: (){
                                            if(address.containsValue('false')){
                                              if(active == "false"){
                                                fDatabase.ref().child('user').child(userId).child('profile').child('address').child(address['key']).child('active').set("true");
                                              } else {
                                                fDatabase.ref().child('user').child(userId).child('profile').child('address').child(address['key']).child('active').set("false");
                                              }
                                            }
                                          },
                                          child: Text("Select Address", style: TextStyle(color: active == "true" ? Colors.white : Colors.black),),
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.transparent,
                                              shape: RoundedRectangleBorder(side: BorderSide(color: active == "true" ? Colors.white : Colors.black), borderRadius: BorderRadius.circular(10)),
                                              elevation: 0,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                          ),
                          SizedBox(height: 20,),
                        ],
                      );
                    },
                  )
                ),
                SizedBox(height: 20,),
                InkWell(
                  onTap: (){
                    setState(() {
                      namaController.text == "";
                      alamatController.text == "";
                      phoneController.text == "";
                    });
                   CreateAlamatAlert(context);
                  },
                  child: DottedBorder(
                    radius: Radius.circular(10),
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 50,
                      child: Text("Add Address"),
                    ),
                  )
                )
              ],
            ),
          ),
    );
  }


}