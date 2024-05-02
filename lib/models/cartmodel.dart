import 'package:fern_n_petals/models/grid_argument.dart';

class CartItem {
  final GridArguments item;
  int quantity;

  CartItem({required this.item, this.quantity = 1});
}