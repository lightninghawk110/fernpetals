import 'dart:convert';
import 'dart:developer';
import 'package:fern_n_petals/models/product_responsemodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductProvider with ChangeNotifier {
  ProductResponse? _originalProduct; // To store the original data
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
          _originalProduct = ProductResponse(
              responseCode: _product!.responseCode,
              activeRecords: _product!.activeRecords,
              data: List.from(_product!.data));

          log(_product!.data[0].title);
          log(_product!.data[0].fileUrl);
          log(_product!.data.length.toString());

          notifyListeners(); // Notify listeners to update UI
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
    if (p == null || _originalProduct == null) {
      log("ProductResponse is null");
      return;
    }
    p.data = List.from(_originalProduct!.data);
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

  void filter(double minPrice, double maxPrice) {
    if (_originalProduct == null) {
      log("ProductResponse is null");
      return;
    }

    List<Product> filteredData = _originalProduct!.data
        .where(
          (element) =>
              element.features.isNotEmpty &&
              double.tryParse(element.features[0].onSalePrice)! > minPrice &&
              double.tryParse(element.features[0].onSalePrice)! <= maxPrice,
        )
        .toList();

    _product = ProductResponse(
        responseCode: _originalProduct!.responseCode,
        activeRecords: _originalProduct!.activeRecords,
        data: filteredData);

    log(filteredData.isNotEmpty
        ? filteredData[0].features[0].onSalePrice
        : "No products found");
    notifyListeners();
  }

  void search(List<Product> products, String searchText) {
    if (_originalProduct == null) {
      log("ProductResponse is null");
      return;
    }

    String st = searchText.toLowerCase();
    st = st.split(" ").join("");

    List<Product> searchedData = products.where((product) {
      return product.title.toLowerCase().contains(st);
    }).toList();

    _product = ProductResponse(
        responseCode: _originalProduct!.responseCode,
        activeRecords: _originalProduct!.activeRecords,
        data: searchedData);

    log(searchedData.isNotEmpty
        ? searchedData[0].features[0].onSalePrice
        : "No products found");
    notifyListeners();
  }

  ProductResponse? get product => _product;
  ProductResponse? get originalproduct => _originalProduct;

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
