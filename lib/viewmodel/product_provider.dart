import 'dart:convert';
import 'dart:developer';

import 'package:fern_n_petals/models/productmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductProvider with ChangeNotifier {
  ProductResponse? p;
  String url =
      "https://brotherstreat.infinitmindsdigital.com/webservices/api.php";

  Future getProduct() async {
    // log('login called');
    final Map<String, String> queryParams = {'action': 'get_products'};
    final uri = Uri.parse(url).replace(queryParameters: queryParams);

    http.Response response = await http.get(uri);
    p = ProductResponse.fromJson(jsonDecode(response.body));
    if (p?.responseCode == "2XX") {
      log(p!.data[0].title);
      log(p!.data[0].fileUrl);
      log(p!.data.length.toString());
    } else {
      log("failed to get product");
    }
  }

  @override
  notifyListeners();
}
