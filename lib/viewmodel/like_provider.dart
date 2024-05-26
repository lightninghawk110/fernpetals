import 'package:flutter/material.dart';
import 'package:fern_n_petals/models/productmodel.dart';

class FavouriteProvider with ChangeNotifier {
  final List<Product> _likedItems = [];

  List<Product> get likedItems => _likedItems;

  void addtoFav(Product item) {
    
    bool isExisting = _likedItems.any((product) => product.title == item.title);

    if (isExisting) {
      
      _likedItems.removeWhere((product) => product.title == item.title);
      item.favourite = false;
    } else {
     
      _likedItems.add(item);
      item.favourite = true;
    }

    
    notifyListeners();
  }

  bool isExist(Product item) {
   
    return _likedItems.any((product) => product.title == item.title);
  }
}
