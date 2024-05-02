import 'package:fern_n_petals/Routes/Route_Paths.dart';
import 'package:fern_n_petals/models/grid_argument.dart';
import 'package:fern_n_petals/screens/Location_page.dart';
import 'package:fern_n_petals/screens/cart_page.dart';
import 'package:fern_n_petals/screens/cart_page_emp.dart';
import 'package:fern_n_petals/screens/home_page.dart';
import 'package:fern_n_petals/screens/item_page.dart';
import 'package:fern_n_petals/screens/message_card_page.dart';
import 'package:flutter/material.dart';

class Routerg {
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
              pageprice: arguments?.price,
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
