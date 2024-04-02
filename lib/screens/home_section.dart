import 'package:flutter/material.dart';

class HomeSection extends StatelessWidget {
 
  HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[],
    );
  }
}

class SearchBox extends StatelessWidget {
   SearchBox({super.key});
 var searchvalue = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.deepPurple.withOpacity(.2)),
              child: TextField(
                controller: searchvalue,
                decoration: InputDecoration(
                    hintText: "Username",
                    icon: Icon(Icons.person),
                    border: InputBorder.none),
              ),
            );
  }
}
