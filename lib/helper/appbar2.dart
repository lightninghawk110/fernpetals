import 'package:fern_n_petals/Routes/Route_Paths.dart';
import 'package:fern_n_petals/viewmodel/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class AppBar2 extends StatelessWidget implements PreferredSizeWidget {
  var Apptitle;
  Widget? Appleading;
  AppBar2(
      {super.key,
      this.Apptitle = "",
      this.Appleading = const Icon(Icons.arrow_back)});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: InkWell(
        child: Appleading,
        onTap: () => Navigator.pop(context),
      ),
      title: Text(
        Apptitle,
        style: TextStyle(fontWeight: FontWeight.w400),
      ),
      shape:
          Border(bottom: BorderSide(color: Color.fromARGB(255, 245, 242, 242))),
      centerTitle: false,
      backgroundColor: Colors.white,
      actions: <Widget>[
        IconButton(
            icon: Icon(Iconsax.search_normal),
            onPressed: () =>
                Navigator.of(context).pushNamed(RoutePaths.search)),
        IconButton(
            icon: Icon(Iconsax.heart),
            onPressed: () =>
                Navigator.of(context).pushNamed(RoutePaths.wishlist_empty)),
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Stack(
            children: [
              Consumer<CartProvider>(builder: (context, cartCounter, child) {
                return IconButton(
                    icon: Icon(Iconsax.shopping_cart),
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
