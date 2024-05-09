import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginProvider with ChangeNotifier {
   bool _isLoading = false;

  bool get isLoading => _isLoading;
  void login({required String email}) async {
    _isLoading = true;

  }
}
