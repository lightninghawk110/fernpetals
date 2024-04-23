import 'package:fern_n_petals/Routes/Route_Paths.dart';
import 'package:fern_n_petals/screens/Location_page.dart';
import 'package:fern_n_petals/screens/home_page.dart';
import 'package:fern_n_petals/screens/item_page.dart';
import 'package:fern_n_petals/screens/message_card_page.dart';
import 'package:flutter/material.dart';

class Routerg {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Start:
        return MaterialPageRoute(builder: (_) => HomePage());
      case RoutePaths.ItemPage:
        return MaterialPageRoute(builder: (_) => ItemPage());
      case RoutePaths.Loc:
        return MaterialPageRoute(builder: (_) => LocationPage());
      case RoutePaths.FreeMessageCard:
        return MaterialPageRoute(builder: (_) => MessageCardPage());

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
