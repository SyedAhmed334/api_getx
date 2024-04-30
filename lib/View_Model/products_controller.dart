import 'dart:convert';
import 'dart:developer';

import 'package:api_getx_flutter/Model/product/product.dart';
import 'package:api_getx_flutter/Utils/Network/url.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class ProductsController extends GetxController {
  Future<List<Product>> getProductsAPi() async {
    var response = await http.get(Uri.parse(Url.products));
    try {
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body)['products'];
        List<Product> products = jsonList
            .map((jsonProduct) => Product.fromJson(jsonProduct))
            .toList();
        log(products.length.toString());
        return products;
        // return products;
      } else {
        log('else block');
        throw Exception('Failed to load products');
      }
    } catch (e) {
      log(e.toString());
      throw Exception('No Data Found!');
    }
  }
}
