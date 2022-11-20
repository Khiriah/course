import 'package:course/model/product_models.dart';
import 'package:course/utills/my_string.dart';
import 'package:http/http.dart' as http; //عشان نعرف نستخدم المكتبه بشكل مختصر

class ProductServices {
  static Future<List<ProductModels>> getProduct() async {
    var response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productModelsFromJson(jsonData);// بيحول البدي الى جسون
    } else {
      return throw Exception("Failed to load product");
    }
  }
}

