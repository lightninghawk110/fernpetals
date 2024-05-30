import 'dart:convert';
import 'dart:developer';
import 'package:fern_n_petals/models/product_responsemodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductProvider with ChangeNotifier {
  ProductResponse? temp;
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
          temp!.data = List.from(_product!.data);
          log(_product!.data[0].title);
          log(_product!.data[0].fileUrl);
          log(_product!.data.length.toString());
          log(temp!.data[0].title.toString());
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

  void sortProductRecommended(ProductResponse? p) {
    if (p == null) {
      log("ProductResponse is null");
      return;
    }
    p.data = List.from(temp!.data);
    log(temp!.data[0].title.toString());
    log(p.data[0].title.toString());
    notifyListeners();
  }

  void sortProductsByTitle(ProductResponse? p) {
    if (p == null) {
      log("ProductResponse is null");
      return;
    }
    p.data.sort((a, b) => a.title.compareTo(b.title));

    notifyListeners();
  }

  void sortProductsByOnSalePrice(ProductResponse? p) {
    if (p == null) {
      log("ProductResponse is null");
      return;
    }

    p.data.sort((a, b) {
      double aMinPrice = a.features.isEmpty
          ? double.infinity
          : a.features
              .map((f) => double.tryParse(f.onSalePrice) ?? double.infinity)
              .reduce((curr, next) => curr < next ? curr : next);

      double bMinPrice = b.features.isEmpty
          ? double.infinity
          : b.features
              .map((f) => double.tryParse(f.onSalePrice) ?? double.infinity)
              .reduce((curr, next) => curr < next ? curr : next);

      return aMinPrice.compareTo(bMinPrice);
    });
    notifyListeners();
  }

  void sortProductsByOnSalePriceDescending(ProductResponse? p) {
    sortProductsByOnSalePrice(p); // Sort in ascending order

    p?.data = p.data.reversed.toList();

    notifyListeners();
  }

  ProductResponse? get product => _product;

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
