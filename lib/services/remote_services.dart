import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shopx/models/product.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<RxList<Product>> fetchProducts() async {
    var response = await client.get(Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      Iterable jsonList = jsonDecode(jsonString);
    

      RxList<Product> productList = RxList<Product>.from(jsonList.map((model) => Product.fromJson(model)));
      return productList;
      
    } else {
      //show error message
      return null;
    }
  }
}
