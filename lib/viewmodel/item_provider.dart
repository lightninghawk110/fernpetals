import 'package:fern_n_petals/models/itemmodel.dart';
import 'package:flutter/material.dart';

class ItemProvider with ChangeNotifier {
  final List<Item> _items = [
    Item(name: "Faboulous Moment Chocolate Cake", price: 2884.0, id: '', description: '', imageUrl: 'assets/images/grid_cake1.png'),
    Item(name: "Chocolate Affair Birthday", price: 1882.0, id: '', description: '', imageUrl: 'assets/images/grid_chocolate1.png'),
    Item(name: "Sweet Memories Roses", price: 990.0, id: '', description: '', imageUrl: 'assets/images/grid_gift1.png'),
    Item(name: "Sweet Sernity Birthday Cake", price: 1524.0, id: '', description: '', imageUrl: 'assets/images/grid_cake2.png'),
    Item(name: "Personalized Gift Anniversary", price: 1161.0, id: '', description: '', imageUrl: 'assets/images/grid_personalized1.png'),
    Item(name: "Pretty in Pink Cake", price: 290.0, id: '', description: '', imageUrl: 'assets/images/grid_flower2.png'),
    Item(name: "Anniversary Magic Photos", price: 3021.0, id: '', description: '', imageUrl: 'assets/images/grid_anniversary1.png'),
  ];

  List<Item> get items => _items;
}