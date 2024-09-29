import 'package:fern_n_petals/Routes/Route_Paths.dart';
import 'package:fern_n_petals/models/grid_argument.dart';
import 'package:fern_n_petals/models/product_responsemodel.dart';
import 'package:fern_n_petals/screens/Location_page.dart';
import 'package:fern_n_petals/screens/cake_category.dart';
import 'package:fern_n_petals/screens/cart_page.dart';
import 'package:fern_n_petals/screens/cart_page_emp.dart';
import 'package:fern_n_petals/screens/edit_profile.dart';

import 'package:fern_n_petals/screens/item_page.dart';
import 'package:fern_n_petals/screens/itemsearch_page.dart';
import 'package:fern_n_petals/screens/login_page.dart';
import 'package:fern_n_petals/screens/message_card_page.dart';
import 'package:fern_n_petals/screens/product_screen.dart';
import 'package:fern_n_petals/screens/register_page.dart';
import 'package:fern_n_petals/screens/search_page.dart';
import 'package:fern_n_petals/screens/start_page.dart';
import 'package:fern_n_petals/screens/favourites_page.dart';
import 'package:flutter/material.dart';

class Routerg {
  static String url = "https://brotherstreat.infinitmindsdigital.com/";
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case RoutePaths.Start:
        return MaterialPageRoute(builder: (_) => HomePage());
      case RoutePaths.ItemPage:
        return MaterialPageRoute(
          builder: (context) {
            GridArguments? arguments = args as GridArguments?;
            return ItemPage(
              pageimage: arguments?.imagelink,
              pagename: arguments?.name,
              pageprice: arguments!.price,
            );
          },
        );
      case RoutePaths.ProductPage:
        return MaterialPageRoute(
          builder: (context) {
            Product? arguments = args as Product?;
            return ProductPage(
              pageimage: url + arguments!.fileUrl,
              pagename: arguments.title,
              pageprice: double.tryParse(arguments.features[0].onSalePrice),
              product: arguments,
            );
          },
        );
      case RoutePaths.Loc:
        return MaterialPageRoute(builder: (_) => LocationPage());
      case RoutePaths.FreeMessageCard:
        return MaterialPageRoute(builder: (_) => MessageCardPage());
      case RoutePaths.cartpg_empty:
        return MaterialPageRoute(builder: (_) => CartPageEmpty());
      case RoutePaths.cartpg:
        return MaterialPageRoute(builder: (_) => CartPage());
      case RoutePaths.login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case RoutePaths.editprofile:
        return MaterialPageRoute(builder: (_) => ProfilePage());
      case RoutePaths.register:
        return MaterialPageRoute(builder: (_) => RegisterPage());
      case RoutePaths.search:
        return MaterialPageRoute(builder: (_) => SearchPage());
      case RoutePaths.itemsearch:
        return MaterialPageRoute(builder: (_) => ItemSearchPage());
      case RoutePaths.wishlist_empty:
        return MaterialPageRoute(builder: (_) => WishlistEmpty());
      case RoutePaths.cake_category:
        return MaterialPageRoute(builder: (_) => CakeCategory());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
