import 'dart:convert';
import 'dart:developer';

import 'package:fern_n_petals/models/emailmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginProvider with ChangeNotifier {
  bool _isLoading = false;
  bool isSignedIn = false;
  String url =
      "https://brotherstreat.infinitmindsdigital.com/webservices/api.php";

  bool get isLoading => _isLoading;
  void login({required String email, required String password}) async {
    // log('login called');

    final Map<String, String> queryParams = {
      'action': 'authentication',
      'username': email,
      'password': password,
    };
    final uri = Uri.parse(url).replace(queryParameters: queryParams);

    log(uri.toString());
    http.Response response = await http.get(uri);
    _isLoading = true;

    final d = SuccessResponse.fromJson(jsonDecode(response.body));
    if (d.responseCode == "2XX") {
        isSignedIn = true;
    } else {
      log(d.errorData![0].message);
    }

    notifyListeners();
  }
}
