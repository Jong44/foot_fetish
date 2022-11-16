import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


class cart extends StatefulWidget{
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart>{

  int cart0 = 1;
  int cart1 = 1;
  int cart2 = 1;
  int cart3 = 1;

  int subtotal = 0;
  int total = 0;

  int count = 4;

  List <int> cart = <int>[
    1,
    1,
    1,
    1
  ];


  List <int> harga = <int>[
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
    updateHarga();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateHarga();
  }


  void alert(BuildContext context){
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
            setState(() {
              count--;
            });
            Navigator.of(context).pop();
          },
        ),
      ],
    );

    showDialog(context: context, builder: (context) => alert);
    return;
  }

  int jumlah = 0;

  void updateHarga(){
    total = subtotal + 20000;
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
        title: Text("Shopping Cart", style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              height: 410,
              child: ListView.builder(
                itemCount: count,
                itemBuilder: (BuildContext context, int index)
                {
                  jumlah = harga[index] * cart[index];
                  return               Container(
                    height: 130,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 20 ),
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.black
                          ),
                          child: IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.check_outlined, size: 12, color: Colors.white,),alignment: Alignment.center, padding: EdgeInsets.only(right:0),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Color(0xffededed),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Image.asset('assets/7.png', fit: BoxFit.fitWidth,),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 13),
                          width: 140,
                          height: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Adidas", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                              Text("Retropy F2 Shoes", style: TextStyle(fontSize: 13, color: Color(0x9c9c9c9c), height: 1.6),),
                              Text("Rp " + jumlah.toString(), style: TextStyle(fontSize: 13, color: Colors.red, height: 1.5, fontWeight: FontWeight.bold),),
                              SizedBox(height: 9,),
                              Container(
                                width: 90,
                                height: 30,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 40,
                                      height: 40 , child:
                                    IconButton(
                                      onPressed: (){
                                        setState(() {

                                          if (cart[index] == 0 ){
                                            cart[index] == 0;
                                          }
                                          else {
                                            cart[index]--;
                                          }
                                        });
                                      },
                                      icon: Icon(Iconsax.minus_square, color: Color(0x9c9c9c9c), size: 20,), alignment: AlignmentDirectional.centerStart, padding: EdgeInsets.only(right: 5),),),
                                    Text(cart[index].toString(), style: TextStyle(),),
                                    SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: IconButton(
                                          onPressed: (){
                                            setState(() {
                                              cart[index]++;
                                            });
                                          }, icon: Icon(Iconsax.add_square, color: Color(0x9c9c9c9c), size: 20,), alignment: AlignmentDirectional.centerEnd, padding: EdgeInsets.only(left: 5)),)
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
                                borderRadius: BorderRadius.circular(5)
                            ),
                            width: 20,
                            height: 20,
                            child: IconButton(
                              onPressed: (){
                                alert(context);
                              },
                              icon: Icon(Iconsax.trash, size: 13, color: Color(0xffBBBBBB),),
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
            Text("-----------------------------", style: TextStyle(fontSize: 25, letterSpacing: 5, color: Color(0xedededed)),),
            Text("Order Info", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Subtotal", style: TextStyle(height: 2, color: Color(0x9c9c9c9c), fontSize: 13),),
                Text("Rp " + subtotal.toString(), style: TextStyle(height: 2, color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Shipping Cost", style: TextStyle(height: 2, color: Color(0x9c9c9c9c), fontSize: 13),),
                Text("+Rp 20.000", style: TextStyle(height: 2, color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total", style: TextStyle(height: 3, color: Color(0x9c9c9c9c), fontSize: 13, fontWeight: FontWeight.bold),),
                Text("Rp " + total.toString(), style: TextStyle(height: 3, color: Colors.red, fontSize: 14, fontWeight: FontWeight.bold),)
              ],
            ),
            SizedBox(height: 10,),
            ElevatedButton(
                onPressed: (){},
                child: Text("Checkout"),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                fixedSize: Size(MediaQuery.of(context).size.width, 45)
              ),
            )
          ],
        ),
      )
    );
  }

}