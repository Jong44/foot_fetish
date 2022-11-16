
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:shoes/category.dart';


class homepage extends StatefulWidget{
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage>{
  
  List like = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  List <int> harga = <int>[
    1600000,
    2000000,
    2200000,
    2400000,
    2600000,
    2600000,
    2600000,
    2600000,
  ];
  
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
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),
              ),
              elevation: 0
            ),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => category()));
              setState(() {
                int pageIndex = 1;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Search",style: TextStyle(color: Color(0xff171717)),),
                Icon(Iconsax.search_normal_1, color: Color(0xff171717), size: 18,)
              ],
            ),
          ),
        ),
        actions: [
          Padding(padding: EdgeInsets.only(right: 20), child: IconButton(onPressed: (){}, icon: Icon(Iconsax.notification,color: Colors.black,)),)
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
                          opacity: 100
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "SUPER BRAND WEEK",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 4,),
                        Text(
                          "DISCOUNT UP TO 20% OFF",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          width: 215,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: AssetImage('assets/6.png'),
                                  fit: BoxFit.fill
                              )
                          ),
                        )
                      ],
                    )
                ),
              ],
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,



              )
          ),
          Text(
              "Feutured Brand",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 15),
            width: MediaQuery.of(context).size.width,
            height: 130,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 18),
                  width: 72,
                  height: 110,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                          color: Color(0xffededed),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Image.asset('assets/1.png', width: 60,),
                      ),
                      Text("Nike", textAlign: TextAlign.center,)
                    ],
                  )
                ),
                Container(
                  margin: EdgeInsets.only(right: 18),
                  width: 72,
                  height: 110,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 72,
                          height: 72,
                          decoration: BoxDecoration(
                              color: Color(0xffededed),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Image.asset('assets/2.png', width: 40,),
                        ),
                        Text("Adidas", textAlign: TextAlign.center,)
                      ],
                    )
                ),
                Container(
                  margin: EdgeInsets.only(right: 18),
                  width: 72,
                  height: 110,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 72,
                          height: 72,
                          decoration: BoxDecoration(
                              color: Color(0xffededed),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Image.asset('assets/4.png', width: 50,),
                        ),
                        Text("Puma", textAlign: TextAlign.center,)
                      ],
                    )
                ),
                Container(
                  width: 72,
                  height: 110,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 72,
                          height: 72,
                          decoration: BoxDecoration(
                              color: Color(0xffededed),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Image.asset('assets/3.png', width: 50,),
                        ),
                        Text("New Bal..",textAlign: TextAlign.center,)
                      ],
                    )
                ),
              ],
            ),
          ),
          Text(
            "Popular Product",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16
            ),
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
                mainAxisSpacing: 30,
                mainAxisExtent: 210
              ),
              itemCount: 6,
              itemBuilder: (BuildContext context, int index)
              {
                return ClipRect(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Color(0xffededed)
                        ),
                        child: Image.asset('assets/7.png', fit: BoxFit.fitWidth,),
                      ),
                      Container(
                        height:110,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(height: 5,),
                            SizedBox(
                              height: 30,
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Nike",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        height: 2
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: (){
                                        setState(() {
                                          if (like[index] == false){
                                            like[index] = true;
                                          }
                                          else {
                                            like[index] = false;
                                          }
                                        });
                                      },
                                      icon: like[index] == true
                                          ? Icon(Iconsax.heart5, color: Colors.red, size: 20,)
                                          : Icon(Iconsax.heart, size: 20)
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text("Ultraboost 22", style: TextStyle(color: Color(0xff9c9c9c9c), height: 1), ),
                            Text("Men's Running Shoes", style: TextStyle(color: Color(0xff9c9c9c9c),height: 1),),
                            Text("Rp " + harga[index].toString(), style: TextStyle(color: Colors.red,height: 1.5), )

                          ],
                        ),

                      )
                    ],
                  ),
                );
            },

            ),

          )
        ],
      ),
    );
  }
}
