// import 'package:custom_pin_screen/custom_pin_screen.dart';
import 'dart:ui';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/foundation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shoes/view/page/success_payment.dart';
import 'package:shoes/view/pin/pin_authentication.dart';
import 'package:shoes/view/pin/pin_code_field.dart';
import 'package:shoes/view/pin/theme.dart';

import '../../setting/format_rupiah.dart';

class cart extends StatefulWidget {
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  final DatabaseCart = FirebaseDatabase.instance.ref().child('cart');

  int total = 0;

  int subtotal = 0;

  List<int> cart = <int>[0, 0, 0, 0];

  List<int> harga = <int>[
    1600000,
    2000000,
    2200000,
    2400000,
    2600000,
  ];

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateTotal();
  }

  updateTotal() {
    setState(() {
      total = subtotal + 20000;
    });
  }

  int? ids;
  String? nama_produks;
  String? brands;
  int? totals;
  String? images;
  int? jumlahs;

  void alert(BuildContext context, {required key}) {
    AlertDialog alert = AlertDialog(
      title: Text("Alert"),
      content: Container(
        child: Text("Apakah anda yakin akan menghapus?"),
      ),
      actions: [
        TextButton(
          child: Text("Tidak"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Iya'),
          onPressed: () {
            DatabaseCart.child(key).remove();
            Navigator.of(context).pop();
          },
        ),
      ],
    );

    showDialog(context: context, builder: (context) => alert);
    return;
  }

  List jumlah = [0, 0, 0, 0, 0];

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
          title: Text("Shopping Cart",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold)),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 410,
                child: FirebaseAnimatedList(
                  query: DatabaseCart,
                  defaultChild: Center(
                    child: CircularProgressIndicator(),
                  ),
                  itemBuilder: (context, snapshot, animation, index) {
                    Map cart = snapshot.value as Map;
                    cart['key'] = snapshot.key;

                    var namaProduct = cart['nama_product'];
                    var brand = cart['brand'];
                    var ukuran = cart['ukuran'];
                    var jumlah = cart['jumlah'];
                    var image = cart['image'];
                    var harga = cart['harga'];
                    var totalHarga = harga * jumlah;

                    return Container(
                      height: 130,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.black),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.check_outlined,
                                size: 12,
                                color: Colors.white,
                              ),
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(right: 0),
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                color: Color(0xffededed),
                                borderRadius: BorderRadius.circular(10)),
                            child: Image.network(
                              image,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 13),
                            width: 140,
                            height: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  brand,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text(
                                  namaProduct,
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Color(0x9c9c9c9c),
                                      height: 1.6),
                                ),
                                Text(
                                  CurrencyFormat.convertToIdr(totalHarga, 2),
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.red,
                                      height: 1.5,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 9,
                                ),
                                Container(
                                  width: 90,
                                  height: 30,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 30,
                                        height: 30,
                                        child: IconButton(
                                          onPressed: () {
                                            if (jumlah == 1) {
                                              alert(context, key: cart['key']);
                                            } else {
                                              DatabaseCart.child(cart['key'])
                                                  .child('jumlah')
                                                  .set(jumlah - 1);
                                            }
                                            setState(() {
                                              if (totalHarga != 0) {
                                                subtotal = totalHarga - harga;
                                              } else {
                                                subtotal = 0;
                                              }
                                            });
                                            updateTotal();
                                          },
                                          icon: Icon(
                                            Iconsax.minus_square,
                                            color: Color(0x9c9c9c9c),
                                            size: 20,
                                          ),
                                          alignment:
                                              AlignmentDirectional.centerStart,
                                          padding: EdgeInsets.only(right: 5),
                                        ),
                                      ),
                                      Text(jumlah.toString()),
                                      SizedBox(
                                        width: 30,
                                        height: 30,
                                        child: IconButton(
                                            onPressed: () {
                                              DatabaseCart.child(cart['key'])
                                                  .child('jumlah')
                                                  .set(jumlah + 1);
                                              setState(() {
                                                subtotal = totalHarga + harga;
                                              });
                                              updateTotal();
                                            },
                                            icon: Icon(
                                              Iconsax.add_square,
                                              color: Color(0x9c9c9c9c),
                                              size: 20,
                                            ),
                                            alignment:
                                                AlignmentDirectional.centerEnd,
                                            padding: EdgeInsets.only(left: 5)),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 50,
                            height: 90,
                            alignment: Alignment.bottomRight,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xffededed),
                                  borderRadius: BorderRadius.circular(5)),
                              width: 20,
                              height: 20,
                              child: IconButton(
                                onPressed: () {
                                  alert(context, key: cart['key']);
                                },
                                icon: Icon(
                                  Iconsax.trash,
                                  size: 13,
                                  color: Color(0xffBBBBBB),
                                ),
                                alignment: Alignment.center,
                                padding: EdgeInsets.zero,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              Text(
                "-----------------------------",
                style: TextStyle(
                    fontSize: 25, letterSpacing: 5, color: Color(0xedededed)),
              ),
              Text(
                "Order Info",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Subtotal",
                    style: TextStyle(
                        height: 2, color: Color(0x9c9c9c9c), fontSize: 13),
                  ),
                  Text(
                    CurrencyFormat.convertToIdr(subtotal, 2),
                    style: TextStyle(
                        height: 2,
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Shipping Cost",
                    style: TextStyle(
                        height: 2, color: Color(0x9c9c9c9c), fontSize: 13),
                  ),
                  Text(
                    "+Rp 20.000",
                    style: TextStyle(
                        height: 2,
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                        height: 3,
                        color: Color(0x9c9c9c9c),
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    CurrencyFormat.convertToIdr(total, 2),
                    style: TextStyle(
                        height: 3,
                        color: Colors.red,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
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
                                onbuttonClick: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) => Success()));
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
                child: Text("Checkout"),
                style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    fixedSize: Size(MediaQuery.of(context).size.width, 45)),
              )
            ],
          ),
        ));
  }
}
