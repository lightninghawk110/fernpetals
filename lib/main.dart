// ignore_for_file: prefer_const_constructors

import "package:fern_n_petals/Routes/Route_Paths.dart";
import "package:fern_n_petals/Routes/router.dart";
import "package:fern_n_petals/screens/start_page.dart";
import "package:fern_n_petals/viewmodel/cart_provider.dart";
import "package:fern_n_petals/viewmodel/item_provider.dart";
import "package:fern_n_petals/viewmodel/login_provider.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";


void main() {
  runApp(FernNPetal());
}

class FernNPetal extends StatelessWidget {
  const FernNPetal({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[ChangeNotifierProvider(create: (_)=> ItemProvider()),
      ChangeNotifierProvider(create: (_)=> CartProvider()),
      ChangeNotifierProvider(create: (_)=> LoginProvider()),
      ],
      
      child:MaterialApp(
      
      initialRoute: RoutePaths.Start,
      onGenerateRoute: Routerg.generateRoute,
      debugShowCheckedModeBanner: false,
      title: 'FernNPetals',
      
      home: HomePage(),
    ));
  }
}