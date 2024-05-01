// ignore_for_file: prefer_const_constructors

import "package:fern_n_petals/Routes/Route_Paths.dart";
import "package:fern_n_petals/Routes/router.dart";
import "package:flutter/material.dart";

import "screens/home_page.dart";

void main() {
  runApp(FernNPetal());
}

class FernNPetal extends StatelessWidget {
  const FernNPetal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      initialRoute: RoutePaths.Start,
      onGenerateRoute: Routerg.generateRoute,
      debugShowCheckedModeBanner: false,
      title: 'FernNPetals',
      
      home: HomePage(),
    );
  }
}