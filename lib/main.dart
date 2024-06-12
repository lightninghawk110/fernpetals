// ignore_for_file: prefer_const_constructors

import "package:fern_n_petals/Routes/Route_Paths.dart";
import "package:fern_n_petals/Routes/router.dart";
import "package:fern_n_petals/models/product_responsemodel.dart";
import "package:fern_n_petals/screens/start_page.dart";
import "package:fern_n_petals/viewmodel/cart_provider.dart";
import "package:fern_n_petals/viewmodel/item_provider.dart";
import "package:fern_n_petals/viewmodel/like_provider.dart";
import "package:fern_n_petals/viewmodel/location_provider.dart";
import "package:fern_n_petals/viewmodel/login_provider.dart";
import "package:fern_n_petals/viewmodel/product_provider.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ProductAdapter());
  Hive.registerAdapter(FeatureAdapter());

  runApp(FernNPetal());
}

class FernNPetal extends StatelessWidget {
  const FernNPetal({super.key});
/
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ItemProvider()),
          ChangeNotifierProvider(create: (_) => CartProvider()),
          ChangeNotifierProvider(create: (_) => LoginProvider()),
          ChangeNotifierProvider(create: (_) => LocationProvider()),
          ChangeNotifierProvider(create: (_) => ProductProvider()),
          ChangeNotifierProvider(create: (_) => FavouriteProvider()),
        ],
        child: MaterialApp(
          initialRoute: RoutePaths.Start,
          onGenerateRoute: Routerg.generateRoute,
          debugShowCheckedModeBanner: false,
          title: 'FernNPetals',
          home: HomePage(),
        ));
  }
}
