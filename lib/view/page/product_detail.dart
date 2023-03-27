import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes/model/api/Product.dart';
import 'package:shoes/setting/format_rupiah.dart';
import 'package:shoes/view/page/cart.dart';

class ProductDetail extends StatefulWidget{
  final Product product;
  const ProductDetail({Key? key, required this.product}) : super(key: key);
  State<ProductDetail> createState() => _detailState(product);
}

class _detailState extends State<ProductDetail>{

  final fDatabase = FirebaseDatabase.instance;
  final Product product;


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
  var valSize;

  int indexSize = 0;

  _detailState(this.product);

  Future<void> saveCart(size) async{
    await fDatabase.ref().child('cart').push().set({
      'id': product.id_product,
      'nama_product': product.nama_produk,
      'ukuran' : size,
      'harga': product.harga,
      'jumlah': 1,
      'image': product.image,
      'brand' : product.brand,
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
            child: Image.network(product.foto![0].foto1.toString(), fit: BoxFit.contain,),
          ),
          if(indexImage == 1)Container(
            alignment: Alignment.center,
            height: 190,
            child: Image.network(product.foto![0].foto2.toString(), fit: BoxFit.contain,),
          ),
          if(indexImage == 2)Container(
            alignment: Alignment.center,
            height: 190,
            child: Image.network(product.foto![0].foto3.toString(), fit: BoxFit.contain,),
          ),
          if(indexImage == 3)Container(
            alignment: Alignment.center,
            height: 190,
            child: Image.network(product.foto![0].foto4.toString(), fit: BoxFit.contain,),
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
                      child: Image.network(product.foto![0].foto1.toString(), scale: 5.5,),
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
                    child: Image.network(product.foto![0].foto2.toString(), scale: 5.5,),
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
                    child: Image.network(product.foto![0].foto3.toString(), scale: 5.5,),
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
                    child: Image.network(product.foto![0].foto4.toString(), scale: 5.5,),
                  ),
                )
              ],
            )
          ),
          SizedBox(height: 10,),
          Text(product.brand.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
          SizedBox(height: 7,),
          Text(product.nama_produk.toString()),
          SizedBox(height: 7,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.star, color: Colors.yellow.shade700, size: 18,),
              SizedBox(width: 5,),
              Text("${product.rate} (${product.review} review) | ${product.sold} sold", style: TextStyle(color: Color(0x9C9C9C9C), fontSize: 13),)
            ],
          ),
          SizedBox(height: 7,),
          Text(CurrencyFormat.convertToIdr(product.harga, 2), style: TextStyle(color: Colors.red.shade700, fontSize: 17, fontWeight: FontWeight.bold),),
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
                      valSize = size[index];
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
          Text(product.description!, style: TextStyle(color: Color(0x9c9c9c9c)),textAlign: TextAlign.justify),
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
                  child: Image.network(product.brands![0].logo.toString(), fit: BoxFit.cover, scale: 1.6,),
                ),
                SizedBox(width: 10,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.brands![0].nama_brand.toString(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),),
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
                  saveCart(valSize);
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
                onPressed: (){},
                child: Text("Buy Now", style: TextStyle(color: Colors.white),)
              )
          ],
        ),
      ),
    );
  }

}