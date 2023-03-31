import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes/model/api/Product.dart';
import 'package:shoes/setting/format_rupiah.dart';
import 'package:shoes/view/page/cart.dart';
import 'package:shoes/view/page/checkout.dart';

class ProductDetail extends StatefulWidget{
  final String keys;
  const ProductDetail({Key? key, required this.keys}) : super(key: key);
  State<ProductDetail> createState() => _detailState(keys);
}

class _detailState extends State<ProductDetail>{

  final fDatabase = FirebaseDatabase.instance;
  final String keys;


  int indexImage = 0;

  final listImage = [
    'foto1',
    'foto2',
    'foto3',
    'foto4',
  ];

  final size = <int>[
    38,
    39,
    40,
    41,
    42
  ];
  String valSiz = "38";

  int indexSize = 0;

  _detailState(this.keys);

  String? nama_product;
  String? harga;
  String? image;
  String? brand;
  String? rate;
  String? review;
  String? sold;
  String? deskripsi;
  String? kategori;

  String? logo_brand;
  String? nama_brand;
  String? id_brand;

  var image_item;

  bool loading = false;

  Future<void> getData() async {
    
    setState(() {
      loading = true;
    });
    
    var nama_productSnapshot = await FirebaseDatabase.instance.ref().child('public').child('product').child(keys).child('nama_product').once();
    var hargaSnapshot = await FirebaseDatabase.instance.ref().child('public').child('product').child(keys).child('harga').once();
    var imageSnapshot = await FirebaseDatabase.instance.ref().child('public').child('product').child(keys).child('image').once();
    var brandSnapshot = await FirebaseDatabase.instance.ref().child('public').child('product').child(keys).child('brand').once();
    var rateSnapshot = await FirebaseDatabase.instance.ref().child('public').child('product').child(keys).child('rate').once();
    var reviewSnapshot = await FirebaseDatabase.instance.ref().child('public').child('product').child(keys).child('review').once();
    var soldSnapshot = await FirebaseDatabase.instance.ref().child('public').child('product').child(keys).child('sold').once();
    var deskripsiSnapshot = await FirebaseDatabase.instance.ref().child('public').child('product').child(keys).child('description').once();
    var image_itemSnapshot = await FirebaseDatabase.instance.ref().child('public').child('product').child(keys).child('foto').once();
    var kategoriSnapshot = await FirebaseDatabase.instance.ref().child('public').child('product').child(keys).child('kategori').once();
    var id_brandSnapshot = await FirebaseDatabase.instance.ref().child('public').child('product').child(keys).child('id_brand').once();

    setState(() {
      nama_product = nama_productSnapshot.snapshot.value.toString();
      harga = hargaSnapshot.snapshot.value.toString();
      image = imageSnapshot.snapshot.value.toString();
      brand = brandSnapshot.snapshot.value.toString();
      rate = rateSnapshot.snapshot.value.toString();
      review = reviewSnapshot.snapshot.value.toString();
      sold = soldSnapshot.snapshot.value.toString();
      deskripsi = deskripsiSnapshot.snapshot.value.toString();
      id_brand = id_brandSnapshot.snapshot.value.toString();
      image_item = image_itemSnapshot.snapshot.value;
      kategori = kategoriSnapshot.snapshot.value.toString();
    });
    

    var logo_brandSnasphot = await FirebaseDatabase.instance.ref().child('public').child('brand').child(id_brand!).child('logo').once();
    var nama_brandSnasphot = await FirebaseDatabase.instance.ref().child('public').child('brand').child(id_brand!).child('nama_brand').once();

    setState(() {
      logo_brand = logo_brandSnasphot.snapshot.value.toString();
      nama_brand = nama_brandSnasphot.snapshot.value.toString();
    });

    setState(() {
      loading = false;
    });
  }

  final userId = FirebaseAuth.instance.currentUser!.uid;

  Future<void> saveCart(size) async{
    await fDatabase.ref().child('user').child(userId).child('cart').child(keys).set({
      'nama_product': nama_product,
      'ukuran' : size,
      'harga': int.parse(harga!),
      'jumlah': 1,
      'image': image,
      'brand' : brand,
      'kategori': kategori
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
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
    if(loading){
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
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Iconsax.arrow_left, color: Colors.black,),
            ),
          ),
          centerTitle: true,
          title: Text("Product Details", style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold)),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric( horizontal: 5),
              child: IconButton(
                  onPressed: (){},
                  icon: Icon(Iconsax.heart5, color: Colors.red,)
              ),
            )
          ],
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: [
            if(indexImage == 0)Container(
              alignment: Alignment.center,
              height: 190,
              child: Image.network(image_item['foto1'].toString() ?? "", fit: BoxFit.contain,),
            ),
            if(indexImage == 1)Container(
              alignment: Alignment.center,
              height: 190,
              child: Image.network(image_item['foto2'].toString() ?? "", fit: BoxFit.contain,),
            ),
            if(indexImage == 2)Container(
              alignment: Alignment.center,
              height: 190,
              child: Image.network(image_item['foto3'].toString() ?? "", fit: BoxFit.contain,),
            ),
            if(indexImage == 3)Container(
              alignment: Alignment.center,
              height: 190,
              child: Image.network(image_item['foto3'].toString() ?? "", fit: BoxFit.contain,),
            ),

            Container(
                alignment: Alignment.center,
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: (){
                        setState(() {
                          indexImage = 0;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          border: indexImage != 0
                              ? Border.all( color: Color(0xEDEDEDED), width: 1)
                              : Border.all( color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.network(image_item['foto1'].toString() ?? "", scale: 5.5,),
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: (){
                        setState(() {
                          indexImage = 1;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          border: indexImage != 1
                              ? Border.all( color: Color(0xEDEDEDED), width: 1)
                              : Border.all( color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.network(image_item['foto2'].toString() ?? '', scale: 5.5,),
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: (){
                        setState(() {
                          indexImage = 2;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          border: indexImage != 2
                              ? Border.all( color: Color(0xEDEDEDED), width: 1)
                              : Border.all( color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.network(image_item['foto3'].toString() ?? "", scale: 5.5,),
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: (){
                        setState(() {
                          indexImage = 3;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          border: indexImage != 3
                              ? Border.all( color: Color(0xEDEDEDED), width: 1)
                              : Border.all( color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.network(image_item['foto4'].toString() ?? "", scale: 5.5,),
                      ),
                    )
                  ],
                )
            ),
            SizedBox(height: 10,),
            Text(brand!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
            SizedBox(height: 7,),
            Text(nama_product!),
            SizedBox(height: 7,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.star, color: Colors.yellow.shade700, size: 18,),
                SizedBox(width: 5,),
                Text("${rate} (${review} review) | ${sold} sold", style: TextStyle(color: Color(0x9C9C9C9C), fontSize: 13),)
              ],
            ),
            SizedBox(height: 7,),
            Text(CurrencyFormat.convertToIdr(int.parse(harga!), 2), style: TextStyle(color: Colors.red.shade700, fontSize: 17, fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            Text("Available Size", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
            SizedBox(height: 7,),
            Container(
              width: 75,
              height: 50,
              child: GridView.builder(
                padding: EdgeInsets.symmetric(vertical: 4),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 60
                ),
                itemBuilder: (BuildContext context, int index){
                  return InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: (){
                      setState(() {
                        indexSize = index;
                        valSiz = size[index].toString();
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: indexSize != index
                          ? BoxDecoration( border: Border.all(color: Color(0xedededed), width: 1), borderRadius: BorderRadius.circular(10))
                          : BoxDecoration( color: Colors.black, borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        size[index].toString(),
                        style: indexSize != index
                            ? TextStyle(color: Color(0x9c9c9c9c), fontSize: 15)
                            : TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 15,),
            Text("Description", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
            SizedBox(height: 10,),
            Text(deskripsi!, style: TextStyle(color: Color(0x9c9c9c9c)),textAlign: TextAlign.justify),
            SizedBox(height: 25,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white
                    ),
                    child: Image.network(logo_brand!, fit: BoxFit.cover, scale: 1.6,),
                  ),
                  SizedBox(width: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(nama_brand!, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 5),
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.green.shade400,
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          Text("Active 2 hours ago", style: TextStyle(color: Colors.grey, fontSize: 12),)
                        ],
                      )
                    ],
                  ),
                  SizedBox(width: 20,),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                  width: 1,
                                  color: Colors.white
                              )
                          )
                      ),
                      onPressed: (){},
                      child: Container(
                        alignment: Alignment.center,
                        height: 25,
                        width: 70,
                        child: Text(
                          "Visit Store",
                          style: TextStyle(fontSize: 12),
                        ),
                      )
                  )
                ],
              ),
            ),
            SizedBox(height: 25,),
            Text("Product  Reviews (105)", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
            SizedBox(height: 25,),
          ],
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          height: 70,
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(
                      width: 2,
                      color: Colors.grey.withOpacity(0.07)
                  )
              )
          ),
          child: Row(
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(165, 50),
                      primary: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            width: 1,
                            color: Colors.black,
                          )
                      )
                  ),
                  onPressed: (){
                    saveCart(valSiz);
                    successAlert(context);
                  },
                  child: Text("Add to Cart", style: TextStyle(color: Colors.black),)
              ),
              SizedBox(width: 20,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(165, 50),
                      primary: Colors.black,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            width: 1,
                            color: Colors.black,
                          )
                      )
                  ),
                  onPressed: (){
                    saveCart(valSiz);
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>
                        Checkout(
                          subtotal: int.parse(harga!),
                          total: int.parse(harga!),
                        )));
                  },
                  child: Text("Buy Now", style: TextStyle(color: Colors.white),)
              )
            ],
          ),
        ),
      );
    }
  }

}