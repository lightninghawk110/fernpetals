import 'package:flutter/material.dart';

class WishlistEmpty extends StatelessWidget {
  WishlistEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: Text(
            "Wishlist",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/empty_cart.png',
                height: 200,
                width: 200,
              ),
              Text(
                " Let's Fill it up, shall we ",
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ));
  }
}
