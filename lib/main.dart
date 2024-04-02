// ignore_for_file: prefer_const_constructors

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
      debugShowCheckedModeBanner: false,
      title: 'FernNPetals',
      home: HomePage(),
    );
  }
}