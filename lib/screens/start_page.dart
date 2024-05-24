// ignore_for_file: prefer_const_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables

import 'package:fern_n_petals/screens/Home_Section.dart';
import 'package:fern_n_petals/screens/account_section.dart';
import 'package:fern_n_petals/screens/allgifts_section.dart';
import 'package:fern_n_petals/screens/itemsearch_page.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BottomNavigationExample(),
    );
  }
}

class BottomNavigationExample extends StatefulWidget {
  const BottomNavigationExample({Key? key}) : super(key: key);

  @override
  _BottomNavigationExampleState createState() =>
      _BottomNavigationExampleState();
}

class _BottomNavigationExampleState extends State {
  int _selectedTab = 0;

  List _pages = [
    HomeSection(),
    Center(
      child: ItemSearchPage(),
    ),
    Center(
      child: AllGiftsSection(),
    ),
    Center(
      child: Text("Abroad"),
    ),
    AccountSection(),
  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (index) => _changeTab(index),
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Iconsax.shopping_bag4), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Iconsax.truck_fast), label: "Same Day"),
          BottomNavigationBarItem(
              icon: Icon(Iconsax.gift4), label: "All Gifts"),
          BottomNavigationBarItem(
              icon: Icon(Iconsax.airplane4), label: "Abroad"),
          BottomNavigationBarItem(
              icon: Icon(Iconsax.profile_2user4), label: "Account"),
        ],
      ),
    );
  }
}
