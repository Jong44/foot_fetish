import 'package:shoes/model/api/Brand.dart';
import 'package:http/http.dart' show Client;

class BrandService{
  final String baseUrl = "https://foot-fetish-dummy-api-default-rtdb.firebaseio.com/";
  Client client = Client();

  Future<List<Brand>?> getBrand() async {
    final response =  await client.get(Uri.parse(("$baseUrl/brand.json")));
    if(response.statusCode == 200){
      return brandFromJson(response.body);
    } else {
      return null;
    }
  }
}