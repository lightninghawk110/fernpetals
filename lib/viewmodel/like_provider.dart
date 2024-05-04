// import 'package:fern_n_petals/models/cartmodel.dart';
// import 'package:fern_n_petals/models/grid_argument.dart';
// import 'package:flutter/material.dart';

// class LikeProvider with ChangeNotifier {
//   final List<CartItem> _likedItems = [];

//   List<CartItem> get likedItems => _likedItems;

//   void addToLiked(GridArguments item) {
//     bool found = false;
//     for (var likedItem in _likedItems) {
//       if (likedItem.item.name == item.name) {
//         found = true;
//         break;
//       }
//     }
//     if (!found) {
//       _likedItems.add(CartItem(item: item));
//     }
//     notifyListeners();
//   }

  
//   void deleteFromLiked(int index) {
//     likedItems.removeAt(index);
//     notifyListeners();
//   }
// }
