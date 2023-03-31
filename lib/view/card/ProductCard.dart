import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../model/api/Product.dart';
import '../../setting/format_rupiah.dart';
import '../page/product_detail.dart';

class ProductCard extends StatefulWidget {
  final image;
  final nama_product;
  final kategori;
  final brand;
  final harga;
  final keys;

  const ProductCard({Key? key, required this.image, required this.nama_product, required this.kategori, required this.brand, required this.harga, required this.keys, }) : super(key: key);
  State<ProductCard> createState() => _productCardState(image, nama_product, kategori, brand, harga, keys);
}

class _productCardState extends State<ProductCard> {
  final image;
  final nama_product;
  final kategori;
  final brand;
  final harga;
  final keys;



  bool like = false;
  final userId = FirebaseAuth.instance.currentUser!.uid;

  _productCardState(this.image, this.nama_product, this.kategori, this.brand, this.harga, this.keys);

  Future<void> saveData() async {
    await FirebaseDatabase.instance.ref().child('user').child(userId).child('wishlist').child(keys).set({
      'nama_product': nama_product,
      'harga': harga,
      'jumlah': 1,
      'images': image,
      'brand' : brand,
      'kategori': kategori
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      borderRadius: const BorderRadius.all(
        Radius.circular(10.0),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetail(
                      keys: keys,

                    )));
      },
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 135,
            decoration: BoxDecoration(
              color: Color(0xffededed),
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: Image.network(image!),
          ),
          Container(
            height: 87,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        brand!,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            height: 2),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.zero,
                        child: IconButton(
                            padding: EdgeInsets.all(0.0),
                            onPressed: () {
                              setState(() {
                                if(like){
                                  FirebaseDatabase.instance.ref().child('user').child(userId).child('wishlist').child(keys).remove();
                                  like = false;
                                }  else {
                                  saveData();
                                  like = true;
                                }
                              });
                            },
                            icon: like
                                ? Icon(
                              Iconsax.heart5,
                              size: 18.0,
                              color: Colors.red,
                            )
                            : Icon(
                              Iconsax.heart,
                              size: 18.0,
                            )),
                      )
                    ],
                  ),
                ),
                Text(
                  nama_product!,
                  style: TextStyle(
                      color: Color(0xff9c9c9c9c), fontSize: 14, height: 1.3),
                ),
                Text(
                  kategori!,
                  style: TextStyle(
                      color: Color(0xff9c9c9c9c), fontSize: 14, height: 1.3),
                ),
                Text(
                  CurrencyFormat.convertToIdr(harga!, 2),
                  style: TextStyle(
                      color: Colors.red,
                      height: 1.5,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
