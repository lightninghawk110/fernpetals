import 'package:fern_n_petals/helper/appbar2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemSearchPage extends StatelessWidget {
  const ItemSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar2(
        Apptitle: "Same Day Delivery",
      ),
      body: ListView(
        children: <Widget>[
          LocationGradient(),
          SizedBox(
            height: 10,
          ),
          ItemCategories(),
          SizedBox(
            height: 10,
          ),
          ItemContainer(),
        ],
      ),
    );
  }
}

class LocationGradient extends StatelessWidget {
  const LocationGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[Color.fromARGB(255, 247, 247, 219), Colors.white]),
      ),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            FaIcon(
              FontAwesomeIcons.circleQuestion,
              size: 18,
            ),
            Text(
              "Add Delivery location to Check availability ",
              style: TextStyle(color: Colors.brown),
            ),
            Icon(
              Icons.keyboard_arrow_right,
              size: 18,
            )
          ],
        ),
      ),
    );
  }
}

class ItemCategories extends StatelessWidget {
  const ItemCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 4,
            mainAxisExtent: 120),
        padding: EdgeInsets.all(8.0), // padding around the grid
        itemCount: 6, // total number of items
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 0,
                  blurRadius: 1,

                  // changes position of shadow
                ),
              ],
            ),
            child: Center(
              child: Text(
                "Cakes",
                style: TextStyle(fontSize: 14.0),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ItemContainer extends StatelessWidget {
  const ItemContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 4,
            mainAxisExtent: 180),
        padding: EdgeInsets.all(8.0), // padding around the grid
        itemCount: 6, // total number of items
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.white,
              border: Border.all(color: Colors.grey),
            ),
            child: Center(
              child: Text(
                "Cakes",
                style: TextStyle(fontSize: 14.0),
              ),
            ),
          );
        },
      ),
    );
  }
}
