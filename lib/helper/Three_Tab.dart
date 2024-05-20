// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ThreeListTile extends StatelessWidget {
  final Color c;
  final String img;

  const ThreeListTile({super.key, required this.c, required this.img});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 180,
              color: c.withOpacity(0.4),
            ),
          ),
          Positioned(
              width: MediaQuery.of(context).size.width / 2,
              top: 0,
              right: 0,
              child: Text(
                'Bloom Your House with Our Cake and ',
                style: TextStyle(
                    color: c, fontSize: 17, fontWeight: FontWeight.bold),
              )),
          Positioned(
            top: 0,
            left: 0,
            right: 220,
            child: SizedBox(
              height: 240,
              child: Image.asset(
                img,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            width: 200,
            height: 170,
            top: 70,
            right: 20,
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    gradient: LinearGradient(
                      colors: [c.withOpacity(0.4), c.withOpacity(0.1)],
                      stops: const [0, 0.8],
                    ),
                  ),
                  child: ListTile(
                    leading: Image.asset('assets/images/flower.png'),
                    visualDensity: VisualDensity(vertical: -3),
                    title: Text(
                      'Flower',
                      style: TextStyle(color: c),
                    ),
                    trailing: Text('>'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    gradient: LinearGradient(
                      colors: [c.withOpacity(0.4), c.withOpacity(0.1)],
                      stops: const [0, 0.8],
                    ),
                  ),
                  child: ListTile(
                    leading: Image.asset('assets/images/cake.png'),
                    visualDensity: VisualDensity(vertical: -3),
                    title: Text(
                      'Cake',
                      style: TextStyle(color: c),
                    ),
                    trailing: Text('>'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    gradient: LinearGradient(
                      colors: [c.withOpacity(0.4), c.withOpacity(0.1)],
                      stops: const [0, 0.8],
                    ),
                  ),
                  child: ListTile(
                    leading: Image.asset('assets/images/gift.png'),
                    visualDensity: VisualDensity(vertical: -3),
                    title: Text(
                      'Gift',
                      style: TextStyle(color: c),
                    ),
                    trailing: Text('>'),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
