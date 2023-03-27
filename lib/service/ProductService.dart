import 'package:shoes/model/api/Product.dart';
import 'package:http/http.dart' show Client;

class ProductService{
  final String baseUrl = "https://foot-fetish-dummy-api-default-rtdb.firebaseio.com/";
  Client client = Client();

  Future<List<Product>?> getProduct() async {
    final response =  await client.get(Uri.parse(("$baseUrl/product.json")));
    if(response.statusCode == 200){
      return productFromJson(response.body);
    } else {
      return null;
    }
  }
}