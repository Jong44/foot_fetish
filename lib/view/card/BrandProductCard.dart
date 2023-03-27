import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes/core.dart';

import '../../model/api/Product.dart';
import '../../setting/format_rupiah.dart';
import '../page/product_detail.dart';

class BrandProductCard extends StatefulWidget {
  final ProductBrand product;
  final Brand brand;
  const BrandProductCard({Key? key, required this.product, required this.brand})
      : super(key: key);
  State<BrandProductCard> createState() =>
      _BrandProductCardState(product, brand);
}

class _BrandProductCardState extends State<BrandProductCard> {
  final ProductBrand product;
  final Brand brand;
  _BrandProductCardState(this.product, this.brand);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      borderRadius: const BorderRadius.all(
        Radius.circular(10.0),
      ),
      onTap: () {},
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
              // image: DecorationImage(image: NetworkImage(product.image ?? ""))),
            ),
          ),
          Container(
            height: 109,
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
                        brand.product![0].brand!,
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
                  brand.product![0].nama_produk!,
                  style: TextStyle(
                      color: Color(0xff9c9c9c9c), fontSize: 14, height: 1.3),
                ),
                Text(
                  brand.product![0].kategori!,
                  style: TextStyle(
                      color: Color(0xff9c9c9c9c), fontSize: 14, height: 1.3),
                ),
                Text(
                  CurrencyFormat.convertToIdr(brand.product![0].harga!, 2),
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
