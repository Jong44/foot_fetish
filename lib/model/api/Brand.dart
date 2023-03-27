import 'dart:convert';

class Brand {
  int id;
  String? brand;
  String? nama_brand;
  String? banner;
  String? logo;
  List<ProductBrand>? product;
  List? product_data = [];

  Brand({
    this.id = 0,
    this.nama_brand,
    this.banner,
    this.logo,
    this.brand,
    this.product,
    this.product_data
  });

  factory Brand.fromJson(Map<String, dynamic> map){
    final product_data = map['product'] as List<dynamic>?;
    final product = product_data?.map((product_data) => ProductBrand.fromJson(product_data)).toList();
    return Brand(
      id: map['id'],
      brand: map['brand'],
      nama_brand: map['nama_brand'],
      banner: map['banner'],
      logo: map['logo'],
      product: product
    );
  }

  Map<String, dynamic> toJson(){
    return {
      "id": id,
      "brand": brand,
      "nama_brand":nama_brand,
      "banner":banner,
      "logo":logo,
      "product":product
    };
  }

  @override
  String toString(){
    return 'Brand{id: $id, brand: $brand, nama_brand: $nama_brand, banner: $banner, logo: $logo, product: $product}';
  }
}

class ProductBrand{
  late Brand brandd;
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

  ProductBrand({
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
  });

  factory ProductBrand.fromJson(Map<String, dynamic> map){
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

    return ProductBrand(
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
    };
  }
}

List<Brand> brandFromJson(String jsonData){
  final data = json.decode(jsonData);
  return List<Brand>.from(data.map((item) => Brand.fromJson(item)));
}

String brandToJson(Brand data){
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
