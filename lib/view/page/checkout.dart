import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes/service/CartItem.dart';
import 'package:shoes/view/page/success_payment.dart';

import '../../setting/format_rupiah.dart';
import '../pin/pin_authentication.dart';
import '../pin/theme.dart';
import 'address.dart';

class Checkout extends StatefulWidget {
  final subtotal;
  final total;
  final keys;
  final jumlah;

  const Checkout({Key? key, required this.subtotal, required this.total, required this.keys, required this.jumlah}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState(subtotal, total, keys, jumlah);
}

class _CheckoutState extends State<Checkout> {
  final subtotal;
  final total;
  final jumlah;
  final keys;
  final userId = FirebaseAuth.instance.currentUser!.uid;

  _CheckoutState(this.subtotal, this.total, this.jumlah, this.keys);

  int indexPayment = 0;

  Future<void> updateJumlah(List<String> keys, List<CartItem> jumlah) async {

    int sold;

    if (keys.length != jumlah.length) {
      throw ArgumentError('Length of keys and jumlah must be the same');
    }


    for (int i = 0; i < keys.length; i++) {
      var soldSnapshot = await FirebaseDatabase.instance.ref()
          .child('public')
          .child('product')
          .child(keys[i])
          .child('sold').once();

      sold = int.parse(soldSnapshot.snapshot.value.toString());

      await FirebaseDatabase.instance
          .ref()
          .child('public')
          .child('product')
          .child(keys[i])
          .child('sold')
          .set(sold + jumlah[i].jumlah!);
    }

    print('Update jumlah successful');
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
          title: Text("Checkout", style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold)),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          children: [
            Text(
              "Order Details",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              ),
            ),
            Container(
              height: 130,
              child: FirebaseAnimatedList(
                query: FirebaseDatabase.instance.ref().child('user').child(userId).child('cart'),
                itemBuilder: (context, snapshot, animation, index){

                  Map cart = snapshot.value as Map;
                  cart['key'] = snapshot.key;

                  var namaProduct = cart['nama_product'];
                  var brand = cart['brand'];
                  var ukuran = cart['ukuran'];
                  var jumlah = cart['jumlah'];
                  var image = cart['image'];
                  var harga = cart['harga'];
                  var size = cart['ukuran'];
                  var kategori = cart['kategori'];
                  int totalHarga = harga * jumlah;

                  return Row(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            color: Color(0xffededed),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Image.network(image, fit: BoxFit.fitWidth,),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 13),
                          padding: EdgeInsets.symmetric(vertical: 10),
                          width: 200,
                          height: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(namaProduct, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                              Text('${size}, ${kategori}' ,style: TextStyle(fontSize: 13, color: Color(0x9c9c9c9c), height: 1.6),),
                              SizedBox(height: 9,),
                              Container(
                                width: 90,
                                height: 30,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 20,
                                      height: 30 , child:
                                    Icon(Iconsax.minus_square, color: Color(0x9c9c9c9c), size: 20,), ),
                                    SizedBox(width: 13,),
                                    Text(jumlah.toString(), style: TextStyle(fontWeight: FontWeight.bold),),
                                    SizedBox(width: 13,),
                                    SizedBox(
                                      width: 20,
                                      height: 30,
                                      child:
                                      Icon(Iconsax.add_square, color: Color(0x9c9c9c9c), size: 20,), ),
                                  ],
                                ),
                              ),
                            ],
                          )
                      ),
                    ],
                  );
                },
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Unit Cost", style: TextStyle(height: 2, fontSize: 13),),
                Text(CurrencyFormat.convertToIdr(2000000, 2), style: TextStyle(height: 2, fontSize: 13, fontWeight: FontWeight.bold),)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Qty", style: TextStyle(height: 2, fontSize: 13),),
                Text(1.toString(), style: TextStyle(height: 2, fontSize: 13, fontWeight: FontWeight.bold),)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Subtotal", style: TextStyle(height: 2, fontSize: 13),),
                Text(CurrencyFormat.convertToIdr(subtotal, 2), style: TextStyle(height: 2, fontSize: 13, fontWeight: FontWeight.bold),)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Shipping Cost", style: TextStyle(height: 2, fontSize: 13),),
                Text("+Rp 20.000", style: TextStyle(height: 2, color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),)
              ],
            ),
            SizedBox(height: 10,),
            Text("-----------------------------", style: TextStyle(fontSize: 21, letterSpacing: 5, color: Color(0xff9C9C9C)),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total", style: TextStyle(height: 2, fontSize: 13, fontWeight: FontWeight.bold),),
                Text(CurrencyFormat.convertToIdr(total, 2), style: TextStyle(height: 2, color: Colors.red, fontSize: 14, fontWeight: FontWeight.bold),)
              ],
            ),
            SizedBox(height: 20,),
            Text(
              "Shipping Address",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              ),
            ),
            SizedBox(height: 30,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (builder) => address()));
              },
              child: Container(
                padding: EdgeInsets.all(18),
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff9c9c9c), width: 1),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("Kevin ", style: TextStyle(fontWeight: FontWeight.bold),),
                            Text("- 08123138383")
                          ],
                        ),
                        Text("New Sapphire Regency, Jalan K.S....")
                      ],
                    ),
                    Icon(Iconsax.arrow_right_3)
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Text(
              "Payment Method",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              ),
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){
                setState(() {
                  indexPayment = 0;
                });
              },
              child: Container(
                padding: EdgeInsets.all(18),
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                    border: indexPayment == 0 ? Border.all(width: 1) : Border.all(color: Color(0xff9c9c9c), width: 1),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Bank Central Asia Mobile", style: TextStyle(fontWeight: FontWeight.bold),),
                        Text("xxxx xxxx xxxx 3245")
                      ],
                    ),
                    Image.network("https://firebasestorage.googleapis.com/v0/b/foot-fetish-9a250.appspot.com/o/defaults%2Fbca.png?alt=media&token=6ef90660-dff5-4701-b289-e76aca248b4d")
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){
                setState(() {
                  indexPayment = 1;
                });
              },
              child: Container(
                padding: EdgeInsets.all(18),
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                    border: indexPayment == 1 ? Border.all(width: 1) : Border.all(color: Color(0xff9c9c9c), width: 1),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Credit Card", style: TextStyle(fontWeight: FontWeight.bold),),
                        Text("xxxx xxxx xxxx 3245")
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.network("https://firebasestorage.googleapis.com/v0/b/foot-fetish-9a250.appspot.com/o/defaults%2Fmasterrcard.png?alt=media&token=485d779c-e8cb-40a7-9a6c-7023a8a1e31c"),
                        Text("09/26")
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 40,),
            ElevatedButton(
              onPressed: (){
                showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) => Container(
                      height: MediaQuery.of(context).size.height * 0.75,
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(25.0),
                          topRight: const Radius.circular(25.0),
                        ),
                      ),
                      child: PinAuthentication(
                          onChanged: (v) {
                            if (kDebugMode) {
                              print(v);
                            }
                          },
                          pinTheme: PinTheme.defaults(
                              activeColor: Colors.grey,
                              activeFillColor: Colors.black,
                              inactiveFillColor: Colors.grey,
                              inactiveColor: Colors.grey,
                              shape: PinCodeFieldShape.underline,
                              selectedColor: Colors.black,
                              selectedFillColor: Colors.grey),
                          onSpecialKeyTap: () {
                            if (kDebugMode) {
                              print('fingerprint');
                            }
                          },
                          specialKey: const SizedBox(),
                          useFingerprint: true,
                          onbuttonClick: () async {
                            await FirebaseDatabase.instance.ref().child('user').child(userId).child('cart').remove();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => Success(
                                      payment: indexPayment,
                                      total: total,
                                    )));
                          },
                          onCompleted: (v) {
                            if (kDebugMode) {
                              print('completed: $v');
                            }
                          },
                          submitLabel: const InkWell(
                            child: Text("Checkout"),
                          )),
                    ));
              },
              child: Text("Confirm Payment"),
              style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  fixedSize: Size(MediaQuery.of(context).size.width, 45)
              ),
            )
          ],
        )
    );
  }
}
