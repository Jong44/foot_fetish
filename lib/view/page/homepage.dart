import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:shoes/model/api/Brand.dart';
import 'package:shoes/service/ProductService.dart';
import 'package:shoes/view/card/ProductCard.dart';
import 'package:shoes/view/page/brand_profile.dart';
import 'package:shoes/view/page/category.dart';
import 'package:shoes/service/BrandService.dart';
import 'package:shoes/view/page/product_detail.dart';
import 'package:shoes/service/ProductService.dart';

import '../../model/api/Product.dart';
import '../../setting/format_rupiah.dart';
import 'notif.dart';

class homepage extends StatefulWidget {
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  late ProductService productService;
  late BrandService brandService;
  late List<Product> products;

  Future refresh() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      productService = ProductService();
      brandService = BrandService();
    });
  }

  void wishlist() {}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productService = ProductService();
    brandService = BrandService();
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
        body: RefreshIndicator(
          onRefresh: refresh,
          child: ListView(
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
                  child: FutureBuilder(
                    future: brandService.getBrand(),
                    builder: (BuildContext context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                              "Something wrong with message:${snapshot.error.toString()}"),
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        List<Brand>? brands = snapshot.data as List<Brand>;
                        return _brandLisst(brands!);
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  )),
              Text(
                "Popular Product",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Container(
                  margin: EdgeInsets.only(top: 15),
                  height: MediaQuery.of(context).size.height,
                  child: FutureBuilder(
                    future: productService.getProduct(),
                    builder: (BuildContext context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                              "Something wrong with message:${snapshot.error.toString()}"),
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        List<Product>? products =
                            snapshot.data as List<Product>;

                        return _productList(products!);
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ))
            ],
          ),
        ));
  }

  Widget _productList(List<Product> products) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 10,
          mainAxisExtent: 235),
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        Product product = products![index];
        return ProductCard(
            product: Product(
                id_product: product.id_product,
                id_brand: product.id_brand,
                id_kategori: product.id_kategori,
                nama_produk: product.nama_produk,
                harga: product.harga,
                brand: product.brand,
                kategori: product.kategori,
                description: product.description,
                sold: product.sold,
                rate: product.rate,
                review: product.review,
                image: product.image,
                brands: product.brands,
                foto: product.foto));
      },
    );
  }

  Widget _brandLisst(List<Brand> brands) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 5,
            mainAxisSpacing: 0,
            mainAxisExtent: 85),
        scrollDirection: Axis.horizontal,
        itemCount: brands.length,
        itemBuilder: (context, index) {
          Brand brand = brands[index];
          return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => brandprofile(brand: brand))),
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
                        brand.logo!,
                        fit: BoxFit.contain,
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                      ),
                    ),
                    Text(
                      brand.brand!,
                      textAlign: TextAlign.center,
                    )
                  ],
                )),
          );
        });
  }
}
