import 'dart:convert';
import 'dart:developer';

import 'package:fern_n_petals/models/emailmodel.dart';
import 'package:fern_n_petals/models/registermodel.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginProvider with ChangeNotifier {
  bool _isLoading = false;
  bool isSignedIn = false;
  bool isRegistered = false;

  SuccessResponse? d;
  String url =
      "https://brotherstreat.infinitmindsdigital.com/webservices/api.php";

  bool get isLoading => _isLoading;

  Future login({required String email, required String password}) async {
    // log('login called');
    final Map<String, String> queryParams = {
      'action': 'authentication',
      'username': email,
      'password': password,
    };
    final uri = Uri.parse(url).replace(queryParameters: queryParams);

    _isLoading = true;
    http.Response response = await http.get(uri);
    d = SuccessResponse.fromJson(jsonDecode(response.body));
    if (d?.responseCode == "2XX") {
      log(d!.data![0].email);
      _isLoading = false;
      isSignedIn = true;
    } else {
      log(d!.errorData![0].message);
    }

    if (isSignedIn) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("SIGNED_IN", isSignedIn);
      prefs.setString("USER_MOBILE", d!.data![0].mobile);
      prefs.setString("USER_EMAIL", d!.data![0].email);
      prefs.setString("USER_NAME", d!.data![0].firstName);
    }

    notifyListeners();
  }

  Future logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isSignedIn = false;
    prefs.setBool("SIGNED_IN", false);
    prefs.remove("USER_MOBILE");
    prefs.remove("USER_EMAIL");
    prefs.remove("USER_NAME");
    log(prefs.getBool("SIGNED_IN").toString());
    notifyListeners();
  }

  Future register(
      {required String fname,
      required String lname,
      required String email,
      required String password,
      required String mobile}) async {
    final Map<String, String> queryParams = {
      'action': 'registration',
      'fname': fname,
      'lname': lname,
      'email': email,
      'password': password,
      'mobile_no': mobile,
    };

    final uri = Uri.parse(url).replace(queryParameters: queryParams);
    http.Response response = await http.get(uri);
    ResponseModel r = ResponseModel.fromJson(jsonDecode(response.body));
    log(response.body);
    log("-------------------------------------------------------------");
    if (r.responseCode == "2XX") {
      log("Successfully Registered");
      isRegistered = true;

    } else {
      log("Error");
    }

    notifyListeners();
  }
}
