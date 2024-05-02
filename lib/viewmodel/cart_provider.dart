import 'package:fern_n_petals/models/cartmodel.dart';
import 'package:fern_n_petals/models/itemmodel.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addToCart(Item item) {
    bool found = false;
    for (var cartItem in _cartItems) {
      if (cartItem.item.name == item.name) {
        cartItem.quantity++;
        found = true;
        break;
      }
    }
    if (!found) {
      _cartItems.add(CartItem(item: item));
    }
    notifyListeners();
  }
}