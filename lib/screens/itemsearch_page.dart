import 'package:fern_n_petals/helper/appbar2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemSearchPage extends StatelessWidget {
  const ItemSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar2(Apptitle: "Same Day Delivery",),
      body: ListView(
        children: <Widget>[
          Container(
            height: 40,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[
                    Color.fromARGB(255, 247, 247, 219),
                    Colors.white
                  ]),
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
          )
        ],
      ),
    );
  }
}
