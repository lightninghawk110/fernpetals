import 'package:flutter/material.dart';

class CartPageEmpty extends StatelessWidget {
  CartPageEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: Text(
            "My Cart",
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
            " Cart Empty Let's Fill it ",
            style: TextStyle(color: Colors.grey),
          )
                    ],
                  ),
        ));
  }
}
