import 'package:fern_n_petals/models/itemmodel.dart';

class CartItem {
  final Item item;
  int quantity;

  CartItem({required this.item, this.quantity = 1});
}