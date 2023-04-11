import 'dart:convert';

class CartItem {
  String? brand;
  int? harga;
  String? image;
  int? jumlah;
  String? kategori;
  String? nama_product;
  int? ukuran;


  CartItem({this.nama_product, this.image, this.jumlah, this.harga, this.kategori, this.brand, this.ukuran});

  factory CartItem.fromJson(Map<dynamic, dynamic> json) {
    return CartItem(
      nama_product: json['nama_product'] as String?,
      image: json['image'] as String?,
      jumlah: json['jumlah'] as int?,
      harga: json['harga'] as int?,
      brand: json['brand'] as String?,
      ukuran: json['ukuran'] as int?,
      kategori: json['kategori'] as String?,
    );
  }

}