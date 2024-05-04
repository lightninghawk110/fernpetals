// ignore_for_file: public_member_api_docs, sort_constructors_first

class CartItem {
  final String name;
  final String imagelink;
  final double price;
  String deliverytype;
  double deliveryPrice;
  String deliveryDate;
  String deliveryTime;

  int quantity;

  CartItem({
    required this.name,
    required this.imagelink,
    required this.price,
    required this.deliverytype,
    required this.deliveryPrice,
    required this.deliveryDate,
    required this.deliveryTime,
    this.quantity = 1
  });
}
