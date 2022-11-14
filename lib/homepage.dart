import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';


class homepage extends StatefulWidget{
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage>{
  
  bool like = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(left: 25, right: 25, top: 15),
        children: [
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
            child: GridView(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 30,
                mainAxisExtent: 210
              ),
              children: [
                ClipRect(
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
                                         if (like == false){
                                           like = true;
                                         }
                                         else {
                                           like = false;
                                         }
                                       });
                                     },
                                     icon: like == true
                                         ? Icon(Iconsax.heart5, color: Colors.red, size: 20,)
                                         : Icon(Iconsax.heart, size: 20)
                                 )
                               ],
                             ),
                           ),
                            SizedBox(height: 5,),
                            Text("Ultraboost 22", style: TextStyle(color: Color(0xff9c9c9c9c), height: 1), ),
                            Text("Men's Running Shoes", style: TextStyle(color: Color(0xff9c9c9c9c),height: 1),),
                            Text("Rp 3.300.000", style: TextStyle(color: Colors.red,height: 1.5), )

                          ],
                        ),

                      )
                    ],
                  ),
                ),
                ClipRect(
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                          if (like == false){
                                            like = true;
                                          }
                                          else {
                                            like = false;
                                          }
                                        });
                                      },
                                      icon: like == true
                                          ? Icon(Iconsax.heart5, color: Colors.red, size: 20,)
                                          : Icon(Iconsax.heart, size: 20)
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text("Ultraboost 22", style: TextStyle(color: Color(0xff9c9c9c9c), height: 1), ),
                            Text("Men's Running Shoes", style: TextStyle(color: Color(0xff9c9c9c9c),height: 1),),
                            Text("Rp 3.300.000", style: TextStyle(color: Colors.red,height: 1.5), )

                          ],
                        ),

                      )
                    ],
                  ),
                ),
                ClipRect(
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
                                          if (like == false){
                                            like = true;
                                          }
                                          else {
                                            like = false;
                                          }
                                        });
                                      },
                                      icon: like == true
                                          ? Icon(Iconsax.heart5, color: Colors.red, size: 20,)
                                          : Icon(Iconsax.heart, size: 20)
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text("Ultraboost 22", style: TextStyle(color: Color(0xff9c9c9c9c), height: 1), ),
                            Text("Men's Running Shoes", style: TextStyle(color: Color(0xff9c9c9c9c),height: 1),),
                            Text("Rp 3.300.000", style: TextStyle(color: Colors.red,height: 1.5), )

                          ],
                        ),

                      )
                    ],
                  ),
                ),

              ],
            ),

          )
        ],
      ),
    );
  }
}
