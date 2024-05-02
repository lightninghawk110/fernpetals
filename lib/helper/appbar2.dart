import 'package:fern_n_petals/Routes/Route_Paths.dart';
import 'package:fern_n_petals/viewmodel/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class AppBar2 extends StatelessWidget implements PreferredSizeWidget {
  const AppBar2({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape:
          Border(bottom: BorderSide(color: Color.fromARGB(255, 245, 242, 242))),
      centerTitle: false,
      backgroundColor: Colors.white,
      actions: <Widget>[
        IconButton(icon: Icon(Icons.search), onPressed: () {}),
        IconButton(icon: FaIcon(FontAwesomeIcons.heart), onPressed: () {}),
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Stack(
            children: [
              Consumer<CartProvider>(builder: (context, cartCounter, child) {
                return IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: cartCounter.cartItems.length == 0
                        ? () => Navigator.of(context)
                            .pushNamed(RoutePaths.cartpg_empty)
                        : () =>
                            Navigator.of(context).pushNamed(RoutePaths.cartpg));
              }),
              Positioned(
                  top: 5,
                  right: 7,
                  child: Badge(label: Consumer<CartProvider>(
                      builder: (context, cartCounter, child) {
                    return Text(
                      cartCounter.cartItems.length.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    );
                  })))
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
