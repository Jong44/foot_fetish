import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:shoes/view/card/ProductCard.dart';
import 'package:shoes/view/page/brand_profile.dart';
import 'package:shoes/view/page/category.dart';
import 'package:shoes/view/page/product_detail.dart';

import '../../setting/format_rupiah.dart';
import 'notif.dart';

class homepage extends StatefulWidget {
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  final ProductDatabase = FirebaseDatabase.instance.ref().child('public').child('product');
  final BrandDatabase = FirebaseDatabase.instance.ref().child('public').child('brand');

  List<dynamic> productList = [];
  List<dynamic> keysProduct = [];

  List<dynamic> brandList = [];
  List<dynamic> keysBrand = [];





  void wishlist() {}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  //  Product
    ProductDatabase.onValue.listen((event) {
      setState(() {
        productList.clear();
        keysProduct.clear();
        List<dynamic>? _productList = event.snapshot.value as List?;
        if (_productList != null) {
          _productList.asMap().forEach((index, value) {
            if(value != null){
              keysProduct.add(index.toString());
              productList.add(value);
            }
          });
        }
        print(productList);
      });
    });

  //  Brand
    BrandDatabase.onValue.listen((event) {
      setState(() {
        brandList.clear();
        keysBrand.clear();
        List<dynamic>? _brandList = event.snapshot.value as List?;
        if (_brandList != null) {
          _brandList.asMap().forEach((index, value) {
            keysBrand.add(index.toString());
            brandList.add(value);
          });
        }
      });
    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Padding(
            padding: EdgeInsets.only(left: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width, 40),
                  primary: Color(0xEDEDEDED),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => category()));
                setState(() {
                  int pageIndex = 1;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Search",
                    style: TextStyle(color: Color(0xff171717)),
                  ),
                  Icon(
                    Iconsax.search_normal_1,
                    color: Color(0xff171717),
                    size: 18,
                  )
                ],
              ),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Notif()));
                    });
                  },
                  icon: Icon(
                    Iconsax.notification,
                    color: Colors.black,
                  )),
            )
          ],
        ),
        body: ListView(
          padding: EdgeInsets.only(left: 25, right: 25, top: 15),
          children: [
            CarouselSlider(
                items: [
                  Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(bottom: 20),
                      width: MediaQuery.of(context).size.width,
                      height: 186,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage('assets/5.png'),
                            fit: BoxFit.fill,
                            opacity: 100),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "SUPER BRAND WEEK",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "DISCOUNT UP TO 20% OFF",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 215,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage('assets/6.png'),
                                    fit: BoxFit.fill)),
                          )
                        ],
                      )),
                ],
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                )),
            Text(
              "Feutured Brand",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Container(
                margin: EdgeInsets.only(bottom: 15),
                width: MediaQuery.of(context).size.width,
                height: 130,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 0,
                        mainAxisExtent: 85),
                    scrollDirection: Axis.horizontal,
                    itemCount: brandList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => brandprofile(
                                  keys: keysBrand[index],
                                ))),
                        child: Container(
                            alignment: Alignment.center,
                            width: 72,
                            height: 150,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 15),
                                  alignment: Alignment.center,
                                  width: 72,
                                  height: 72,
                                  decoration: BoxDecoration(
                                      color: Color(0xffededed),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Image.network(
                                    brandList[index]['logo'],
                                    fit: BoxFit.contain,
                                    width: 40,
                                    height: 40,
                                    alignment: Alignment.center,
                                  ),
                                ),
                                Text(
                                  brandList[index]['brand'],
                                  textAlign: TextAlign.center,
                                )
                              ],
                            )),
                      );
                    })),
            Text(
              "Popular Product",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              height: MediaQuery.of(context).size.height,
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 235),
                itemCount: productList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProductCard(
                    image: productList[index]['image'],
                    nama_product: productList[index]['nama_product'],
                    kategori: productList[index]['kategori'],
                    brand: productList[index]['brand'],
                    harga: productList[index]['harga'],
                    keys: keysProduct[index].toString(),
                  );
                },
              ),
            )
          ],
        ),);
  }
}
