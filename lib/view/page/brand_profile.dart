import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:shoes/model/api/Brand.dart';
import 'package:shoes/service/ProductService.dart';
import 'package:shoes/view/card/BrandProductCard.dart';
import 'package:shoes/view/card/ProductCard.dart';
import 'package:shoes/view/page/brand_profile.dart';
import 'package:shoes/view/page/category.dart';
import 'package:shoes/service/BrandService.dart';
import 'package:shoes/view/page/product_detail.dart';
import 'package:shoes/service/ProductService.dart';

import '../../model/api/Product.dart';
import '../../setting/format_rupiah.dart';
import 'notif.dart';

class brandprofile extends StatefulWidget {
  final keys;
  const brandprofile({Key? key, required this.keys}) : super(key: key);
  State<brandprofile> createState() => _brandState(keys);
}

class _brandState extends State<brandprofile> with TickerProviderStateMixin {
  late BrandService brandService;
  _brandState(this.keys);
  final keys;

  final ProductDatabase = FirebaseDatabase.instance.ref().child('public').child('product');
  List<dynamic> productList = [];
  List<dynamic> keysProduct = [];
  List<dynamic> searchProduct = [];
  List<dynamic> keysSearchProduct = [];

  Future refresh() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      brandService = BrandService();
    });

  }

  String? nama_brand;
  String? logo;
  String? banner;
  String? brand;

  bool isLoading = false;

  Future<void> getData() async {

    setState(() {
      isLoading = true;
    });

    var nama_brandSnapshot = await FirebaseDatabase.instance.ref().child('public').child('brand').child(keys).child('nama_brand').once();
    var logoSnapshot = await FirebaseDatabase.instance.ref().child('public').child('brand').child(keys).child('logo').once();
    var bannerSnapshot = await FirebaseDatabase.instance.ref().child('public').child('brand').child(keys).child('banner').once();
    var brandSnapshot = await FirebaseDatabase.instance.ref().child('public').child('brand').child(keys).child('brand').once();

    setState(() {
      nama_brand = nama_brandSnapshot.snapshot.value.toString();
      logo = logoSnapshot.snapshot.value.toString();
      banner = bannerSnapshot.snapshot.value.toString();
      brand = brandSnapshot.snapshot.value.toString();
    });

    setState(() {
      isLoading = false;
    });
  }

  String searchQuery = "";

  @override
  void initState() {
    // TODO: implement initState
    brandService = BrandService();
    super.initState();
    getData();
    ProductDatabase.orderByChild('id_brand').equalTo(int.parse(keys) + 1).onValue.listen((event) {
      setState(() {
        productList.clear();
        keysProduct.clear();
        var snapshotData = event.snapshot.value;
        if (snapshotData is List) {
          snapshotData.asMap().forEach((index, value) {
            keysProduct.add(index.toString());
            productList.add(value);
          });
        } else if (snapshotData is Map) {
          snapshotData.forEach((key, value) {
            keysProduct.add(key.toString());
            productList.add(value);
          });
        }
      });
      searchProduct = List.from(productList);
      keysSearchProduct = List.from(keysProduct);
    });
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabcontroller = TabController(length: 2, vsync: this);
    if(isLoading){
      return Center(
        child: CircularProgressIndicator(),
      );
    } else{
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
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Iconsax.arrow_left,
                  color: Colors.black,
                ),
              ),
            ),
            title: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3.5),
              width: 310,
              height: 40,
              decoration: BoxDecoration(
                  color: Color(0xEDEDEDED),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                onChanged: (value){
                  setState(() {
                    searchQuery = value;
                  });

                  setState(() {
                    searchProduct.clear();
                    keysSearchProduct.clear();
                    for (int i = 0; i < productList.length; i++) {
                      if (productList[i]['nama_product']
                          .toLowerCase()
                          .contains(searchQuery.toLowerCase())) {
                        searchProduct.add(productList[i]);
                        int indexInProductList = i;
                        int indexInSearchList = searchProduct.length - 1;
                        keysSearchProduct.insert(indexInSearchList, keysProduct[indexInProductList]);
                      }
                    }
                  });
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search",
                  hintStyle: TextStyle(color: Color(0xBBBBBBBB), fontSize: 15),
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
          ),
          body: searchQuery != ""
            ? Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                mainAxisExtent: 250,
              ),
              itemCount: searchProduct.length,
              itemBuilder: (BuildContext context, int index) {
                return ProductCard(
                  image: searchProduct[index]['image'],
                  nama_product: searchProduct[index]['nama_product'],
                  kategori: searchProduct[index]['kategori'],
                  brand: searchProduct[index]['brand'],
                  harga: searchProduct[index]['harga'],
                  keys: keysSearchProduct[index].toString(),
                );
              },
            ),
          )
            : RefreshIndicator(
            onRefresh: refresh,
            child: ListView(
              children: [
                Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Container(
                      height: 160,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Image.network(
                        banner!,
                        width: double.infinity,
                        alignment: Alignment.topCenter,
                        height: 125,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      height: 75,
                      width: 75,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(logo ?? ""))),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                      width: 20,
                    ),
                    Text(
                      nama_brand!.toUpperCase(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Container(
                      width: double.maxFinite,
                      height: 2,
                      margin: EdgeInsets.only(top: 51),
                      color: Color.fromARGB(237, 237, 237, 237),
                    ),
                    Container(
                      child: TabBar(
                          controller: _tabcontroller,
                          isScrollable: true,
                          labelColor: Colors.black,
                          unselectedLabelColor:
                          Color.fromARGB(187, 187, 187, 187),
                          indicatorColor: Colors.black,
                          labelPadding:
                          EdgeInsets.only(left: 20, right: 20, top: 5),
                          //indicatorPadding: EdgeInsets.only(right: 10),
                          tabs: [
                            Tab(
                              text: "Home",
                            ),
                            Tab(
                              text: "Product",
                            )
                          ]),
                    ),
                    Container(
                      width: double.maxFinite,
                      height: 520,
                      margin: EdgeInsets.only(top: 53),
                      child: TabBarView(controller: _tabcontroller, children: [
                        Container(
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    top: 20, right: 20, left: 20, bottom: 10),
                                child: (Image.asset(
                                  "assets/banner_nike.png",
                                  width: 335,
                                  height: 190,
                                  alignment: Alignment.topCenter,
                                )),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  "Best Seller",
                                  style: TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.w500),
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: 20),
                                  height: 244,
                                  child: GridView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    padding: EdgeInsets.all(20),
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 5,
                                      mainAxisSpacing: 5,
                                      mainAxisExtent: 250,
                                    ),
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
                                  )
                              )
                            ],
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 20),
                            height: 244,
                            child: GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              padding: EdgeInsets.all(20),
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                                mainAxisExtent: 250,
                              ),
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
                            )
                        )
                      ]),
                    )
                  ],
                ),
              ],
            ),
          )
      );
    }
  }

  // Widget _productList(List<Brand> productBrands) {
  //   return GridView.builder(
  //     scrollDirection: Axis.horizontal,
  //     padding: EdgeInsets.symmetric(horizontal: 20),
  //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //       crossAxisCount: 1,
  //       mainAxisSpacing: 10,
  //       mainAxisExtent: 165,
  //     ),
  //     itemCount: productBrands.length,
  //     itemBuilder: (BuildContext context, int index) {
  //       Brand productBrand = productBrands![index];
  //       return BrandProductCard(
  //         product: ProductBrand(
  //             id_product: productBrand.product![0].id_product,
  //             id_kategori: productBrand.product![0].id_kategori,
  //             id_brand: productBrand.product![0].id_brand,
  //             nama_produk: productBrand.product![0].nama_produk,
  //             brand: productBrand.product![0].brand,
  //             kategori: productBrand.product![0].kategori,
  //             harga: productBrand.product![0].harga,
  //             image: productBrand.product![0].image,
  //             description: productBrand.product![0].description,
  //             rate: productBrand.product![0].rate,
  //             sold: productBrand.product![0].sold,
  //             review: productBrand.product![0].review),
  //         brand: brand,
  //       );
  //     },
  //   );
  // }

  // Widget _productList2(brands) {
  //   return GridView.builder(
  //     physics: NeverScrollableScrollPhysics(),
  //     scrollDirection: Axis.vertical,
  //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //         crossAxisCount: 2,
  //         crossAxisSpacing: 5,
  //         mainAxisSpacing: 30,
  //         mainAxisExtent: 210),
  //     itemCount: brands,
  //     itemBuilder: (BuildContext context, int index) {
  //       Product product = products[index];
  //       return ProductCard(
  //           product: Product(
  //               id_product: product.id_product,
  //               id_brand: product.id_brand,
  //               id_kategori: product.id_kategori,
  //               nama_produk: product.nama_produk,
  //               harga: product.harga,
  //               brand: product.brand,
  //               kategori: product.kategori,
  //               description: product.description,
  //               sold: product.sold,
  //               rate: product.rate,
  //               review: product.review,
  //               image: product.image,
  //               brands: product.brands,
  //               foto: product.foto));
  //     },
  //   );
  // }
}
