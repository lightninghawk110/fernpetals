import 'package:fern_n_petals/models/cartmodel.dart';
import 'package:fern_n_petals/models/grid_argument.dart';
import 'package:flutter/material.dart';

class LikeProvider with ChangeNotifier {
  final List<CartItem> _likedItems = [];

  List<CartItem> get likedItems => _likedItems;

  

  
  void deleteFromLiked(int index) {
    likedItems.removeAt(index);
    notifyListeners();
  }
}
