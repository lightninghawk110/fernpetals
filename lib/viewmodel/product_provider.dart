import 'dart:convert';
import 'dart:developer';

import 'package:fern_n_petals/models/productmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductProvider with ChangeNotifier {
  ProductResponse? _product;
  String url =
      "https://brotherstreat.infinitmindsdigital.com/webservices/api.php";

  Future<ProductResponse> getProduct() async {
    try {
      final Map<String, String> queryParams = {'action': 'get_products'};
      final uri = Uri.parse(url).replace(queryParameters: queryParams);

      final response = await http.get(uri);
      if (response.statusCode == 200) {
        _product = ProductResponse.fromJson(jsonDecode(response.body));
        if (_product?.responseCode == "2XX") {
          log(_product!.data[0].title);
          log(_product!.data[0].fileUrl);
          log(_product!.data.length.toString());
          return _product!;
        } else {
          throw Exception("Failed to get product");
        }
      } else {
        throw Exception("Failed to load data from server");
      }
    } catch (e) {
      throw Exception("An error occurred: $e");
    }
  }

  ProductResponse? get product => _product;

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
