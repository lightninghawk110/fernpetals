import 'package:flutter/material.dart';

class HomeSection extends StatelessWidget {
  HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Column(
        children: <Widget>[SearchBox()],
      ),
    );
  }
}

class SearchBox extends StatelessWidget {
  SearchBox({super.key});
  var searchvalue = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.0),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey.withOpacity(.2)),
      child: TextField(
        controller: searchvalue,
        decoration: InputDecoration(
            hintText: "What are you looking for?",
            icon: Icon(Icons.search),
            border: InputBorder.none,
            iconColor: Colors.brown),
      ),
    );
  }
}
