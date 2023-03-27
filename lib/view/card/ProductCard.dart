import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../model/api/Product.dart';
import '../../setting/format_rupiah.dart';
import '../page/product_detail.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  const ProductCard({Key? key, required this.product}) : super(key: key);
  State<ProductCard> createState() => _productCardState(product);
}

class _productCardState extends State<ProductCard> {
  final Product product;
  _productCardState(this.product);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      borderRadius: const BorderRadius.all(
        Radius.circular(10.0),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetail(
                      product: product,
                    )));
      },
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 135,
            decoration: BoxDecoration(
              color: Color(0xffededed),
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: Image.network(product.image!),
          ),
          Container(
            height: 87,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        product.brand!,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            height: 2),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.zero,
                        child: IconButton(
                            padding: EdgeInsets.all(0.0),
                            onPressed: () {
                              setState(() {});
                            },
                            icon: Icon(
                              Iconsax.heart,
                              size: 18.0,
                            )),
                      )
                    ],
                  ),
                ),
                Text(
                  product.nama_produk!,
                  style: TextStyle(
                      color: Color(0xff9c9c9c9c), fontSize: 14, height: 1.3),
                ),
                Text(
                  product.kategori!,
                  style: TextStyle(
                      color: Color(0xff9c9c9c9c), fontSize: 14, height: 1.3),
                ),
                Text(
                  CurrencyFormat.convertToIdr(product.harga!, 2),
                  style: TextStyle(
                      color: Colors.red,
                      height: 1.5,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
