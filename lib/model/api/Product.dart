import 'dart:convert';

import 'package:shoes/model/api/Brand.dart';

class Product{
  int? id_product;
  int? id_brand;
  int? id_kategori;
  String? nama_produk;
  String? brand;
  String? kategori;
  int? harga;
  String? description;
  int? rate;
  int? sold;
  int? review;
  String? image;
  List<BrandProduct>? brands;
  List<FotoProduk>? foto;
  List? brands_data = [];
  List? foto_data = [];

  Product({
    this.id_product,
    this.id_kategori,
    this.id_brand,
    this.nama_produk,
    this.brand,
    this.kategori,
    this.harga,
    this.image,
    this.description,
    this.rate,
    this.sold,
    this.review,
    this.brands,
    this.foto,
    this.foto_data,
    this.brands_data
  });

  factory Product.fromJson(Map<String, dynamic> map){
    final id_product = map['id'] as int;
    final id_brand = map['id_brand'] as int;
    final id_kategori = map['id_kategori'] as int;
    final nama_produk = map['nama_product'] as String;
    final brand = map['brand'] as String;
    final kategori = map['kategori'] as String;
    final harga = map['harga'] as int;
    final image = map['image'] as String;
    final description = map['description'] as String;
    final rate = map['rate'] as int;
    final sold = map['sold'] as int;
    final review = map['review'] as int;
    final brands_data = map['brands'] as List<dynamic>?;
    final foto_data = map['foto'] as List<dynamic>?;
    final brands = brands_data?.map((brands_data) => BrandProduct.fromJson(brands_data)).toList();
    final foto = foto_data?.map((foto_data) => FotoProduk.fromJson(foto_data)).toList();

    return Product(
        id_product: id_product,
        id_kategori: id_kategori,
        id_brand: id_brand,
        nama_produk: nama_produk,
        brand: brand,
        kategori: kategori,
        harga: harga,
        image: image,
        description: description,
        rate: rate,
        sold: sold,
        review: review,
        brands: brands,
        foto: foto
    );

  }

  Map<String, dynamic> toJson(){
    return {
      'id_product':id_product,
      'id_brand':id_brand,
      'id_kategori':id_kategori,
      'nama_produk':nama_produk,
      'brand':brand,
      'kategori':kategori,
      'harga':harga,
      'image':image,
      'description':description,
      'rate': rate,
      'sold': sold,
      'review': review,
      'brands': brands,
      'foto': foto
    };
  }

  @override
  String toString(){
    return 'Product{id: $id_product, id_brand: $id_brand, id_kategori: $id_kategori, nama_product: $nama_produk, brand: $brand, kategori: $kategori, harga: $harga, image: $image, description: $description, rate: $rate, sold: $sold, review: $review, brands: $brands, foto: $foto}';
  }
}

class BrandProduct{
  int? id_brand;
  String? brand;
  String? nama_brand;
  String? banner;
  String? logo;

  BrandProduct({
    this.id_brand,
    this.brand,
    this.nama_brand,
    this.logo,
    this.banner
  });

  factory BrandProduct.fromJson(Map<String, dynamic> map){
    final id_brand = map['id_brand'];
    final brand = map['brand'];
    final nama_brand = map['nama_brand'];
    final logo = map['logo'];
    final banner = map['banner'];

    return BrandProduct(
      id_brand: id_brand,
      brand: brand,
      nama_brand: nama_brand,
      logo: logo,
      banner: banner
    );
  }

  Map<String, dynamic> toJson(){
    return{
      'id_brand': id_brand,
      'brand': brand,
      'nama_brand': nama_brand,
      'logo': logo,
      'banner': banner
    };
  }
}

class FotoProduk {
  String? foto1;
  String? foto2;
  String? foto3;
  String? foto4;

  FotoProduk({
    this.foto1,
    this.foto2,
    this.foto3,
    this.foto4,
  });

  factory FotoProduk.fromJson(Map<String, dynamic> map){
    final foto1 = map['foto1'];
    final foto2 = map['foto2'];
    final foto3 = map['foto3'];
    final foto4 = map['foto4'];

    return FotoProduk(
      foto1: foto1,
      foto2: foto2,
      foto3: foto3,
      foto4: foto4
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'foto1' : foto1,
      'foto2' : foto2,
      'foto3' : foto3,
      'foto4' : foto4
    };
  }
}


List<Product> productFromJson(String jsonData){
  final data = json.decode(jsonData);
  return List<Product>.from(data.map((item) => Product.fromJson(item)));
}

String productToJson(Product data){
  final jsonData = data.toJson();
  return json.encode(jsonData);
}