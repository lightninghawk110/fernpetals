import 'package:fern_n_petals/models/cartmodel.dart';
import 'package:fern_n_petals/models/grid_argument.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addToCart(GridArguments item) {
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

  double get totalPrice {
    return _cartItems.fold(
        0.0, (sum, unit) => sum + ((unit.item.price as num) * unit.quantity));
  }

  double get deliverycharge {
    return 59.0*cartItems.length;
}

  double get convinencecharge {
    return 249.0*cartItems.length;
}
  double get finalAmount {
    return totalPrice + deliverycharge + convinencecharge;
  }

  void reduce(GridArguments item) {
    for (var cartItem in _cartItems) {
      if (cartItem.quantity > 1) {
        cartItem.quantity--;
        notifyListeners();
      }
    }
  }

  void deleteToCart(int index) {
    cartItems.removeAt(index);
    notifyListeners();
  }
}
