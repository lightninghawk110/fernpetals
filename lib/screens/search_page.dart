import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final searchvalue = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 224, 224, 204),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12.0),
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color.fromARGB(255, 212, 212, 212).withOpacity(.2)),
            child: TextField(
                controller: searchvalue,
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.mic),
                    hintText: "What are you looking for?",
                    icon: Icon(Icons.search),
                    border: InputBorder.none,
                    iconColor: Colors.brown)),
          )
        ],
      ),
    );
  }
}
