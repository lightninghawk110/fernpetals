import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fern_n_petals/models/product_responsemodel.dart';
import 'package:hive/hive.dart';

class FavouriteProvider with ChangeNotifier {
  final List<Product> _likedItems = [];
  Box<Product>? _favBox;

  FavouriteProvider() {
    _initBox();
  }

  List<Product> get likedItems => _likedItems;

  void addtoFav(Product item) async {
    bool isExisting = _likedItems.any((product) => product.title == item.title);

    if (isExisting) {
      _likedItems.removeWhere((product) => product.title == item.title);
      item.favourite = false;
    } else {
      _likedItems.add(item);
      item.favourite = true;
    }
    
    await _saveLikedItemsToHive();
    await logLikedItemsFromHive();
    notifyListeners();
  }

  bool isExist(Product item) {
    return _likedItems.any((product) => product.title == item.title);
  }

  void _initBox() async {
    _favBox = await Hive.openBox<Product>('favouritesBox');
    _loadLikedItemsFromHive();
  }

  void _loadLikedItemsFromHive() {
    if (_favBox != null) {
      _likedItems.clear();
      _likedItems.addAll(_favBox!.values);
      notifyListeners();
    }
  }

  Future<void> _saveLikedItemsToHive() async {
    if (_favBox != null) {
      await _favBox!.clear(); // Clear existing items
      for (var item in _likedItems) {
        await _favBox!.put(item.id, item); // Assuming `id` is unique
      }
    }
  }

  Future<void> logLikedItemsFromHive() async {
  var box = await Hive.openBox<Product>('favouritesBox');
  log('Liked Items from Hive:');
  for (var product in box.values) {
    log(product.toJson().toString());
  }
}
}
