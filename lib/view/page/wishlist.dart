

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../setting/format_rupiah.dart';

class wishlist extends StatefulWidget{
  State<wishlist> createState() => _wishlistState();
}

class _wishlistState extends State<wishlist>{

  String selected = "38";
  final fDatabase = FirebaseDatabase.instance;
  final userId = FirebaseAuth.instance.currentUser!.uid;

  void alert(BuildContext context, {key}){
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
          onPressed: () {
            fDatabase.ref().child('user').child(userId).child('wishlist').child(key).remove();
            Navigator.of(context).pop();
          },
        ),
      ],
    );

    showDialog(context: context, builder: (context) => alert);
    return;
  }

  Future<void> saveCart(size, nama_product, harga, image, brand, kategori, keys) async{
    await fDatabase.ref().child('user').child(userId).child('cart').child(keys).set({
      'nama_product': nama_product,
      'ukuran' : size,
      'harga': harga,
      'jumlah': 1,
      'image': image,
      'brand' : brand,
      'kategori': kategori
    });

    successAlert(context);
  }

  void successAlert(BuildContext context){
    AlertDialog alert = AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: EdgeInsets.symmetric(horizontal: 15),
      title: Center(child: Icon(Iconsax.chart_success, size: 50,),),
      content: Container(child: Text("Success add to cart", textAlign: TextAlign.center,),),
      actions: [
        ElevatedButton(
          onPressed: (){
            setState(() {
              Navigator.pop(context);
            });
          },
          child: Text("OKE", style: TextStyle(fontSize: 12),),
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        leadingWidth: 40,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Wishlist", style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            child: FirebaseAnimatedList(
                query: fDatabase.ref().child('user').child(userId).child('wishlist'),
                defaultChild: Center(child: CircularProgressIndicator(),),
                itemBuilder: (context, snapshot, animation, index){
                  Map wishlist = snapshot.value as Map;
                  wishlist['key'] = snapshot.key;

                  var namaProduct = wishlist['nama_product'];
                  var brand = wishlist['brand'];
                  var image = wishlist['images'];
                  var harga = wishlist['harga'];
                  var kategori = wishlist['kategori'];

                  return Column(
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
                            child: Image.network(image),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 3),
                            width: 190,
                            height: 190,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(brand.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                                    IconButton(onPressed: (){
                                      alert(context, key: wishlist['key'] = snapshot.key);
                                    }, icon: Icon(Icons.close, size: 23,), alignment: Alignment.topCenter, padding: EdgeInsets.zero, splashRadius: 20,)
                                  ],
                                ),
                                Text(namaProduct, style: TextStyle(color: Color(0x9c9c9c9c), height: 0.1,  fontSize: 12),),
                                Text(CurrencyFormat.convertToIdr(harga, 2), style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, height: 2, fontSize: 12),),
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
                                    onPressed: (){
                                      saveCart(
                                          selected,
                                          namaProduct,
                                          harga,
                                          image,
                                          brand,
                                          kategori,
                                          wishlist['key']
                                      );
                                    }, child:Text("Buy")
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20,)
                    ],
                  );
                }
            ),
          )
        ],
      ),
    );
  }

}