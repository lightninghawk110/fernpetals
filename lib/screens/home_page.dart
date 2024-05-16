// ignore_for_file: prefer_const_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables

import 'package:fern_n_petals/Routes/Route_Paths.dart';
import 'package:fern_n_petals/screens/Home_Section.dart';
import 'package:fern_n_petals/screens/account_section.dart';
import 'package:fern_n_petals/viewmodel/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: Border(
            bottom: BorderSide(color: Color.fromARGB(255, 245, 242, 242))),
        centerTitle: false,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () => Navigator.of(context).pushNamed(RoutePaths.Loc),
          child: Icon(
            Icons.location_on_outlined,
            size: 25,
          ),
        ),
        titleSpacing: 0,
        title: InkWell(
          onTap: () => Navigator.of(context).pushNamed(RoutePaths.Loc),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Patna',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              Text(
                '800003',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w100),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(icon: FaIcon(FontAwesomeIcons.heart), onPressed: () {}),
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Stack(
              children: [
                Consumer<CartProvider>(builder: (context, cartCounter, child) {
                  return IconButton(
                      icon: Icon(Icons.shopping_cart_outlined),
                      onPressed: cartCounter.cartItems.length == 0
                          ? () => Navigator.of(context)
                              .pushNamed(RoutePaths.cartpg_empty)
                          : () => Navigator.of(context)
                              .pushNamed(RoutePaths.cartpg));
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
      ),
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
      child: Text("Same Day"),
    ),
    Center(
      child: Text("All Gifts"),
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
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.truckFast), label: "Same Day"),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.gift), label: "All Gifts"),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.plane), label: "Abroad"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box_outlined), label: "Account"),
        ],
      ),
    );
  }
}
