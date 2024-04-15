import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  String activeTab = 'Birthday';

  final List<String> tabname = [
    'Birthday',
    'Love N Romance',
    'Anniversary',
    'Congratulations',
    'Thank You'
  ];

  final List<IconData> icons = [
    Icons.cake_outlined,
    Icons.heart_broken_sharp,
    Icons.key,
    Icons.handshake,
    Icons.thumb_up_sharp
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.center,
          colors: [
            Color.fromARGB(255, 232, 245, 216),
            Colors.white,
          ],
        ),
      ),
      child: Column(
        children: [
          SizedBox(
              height: 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: icons.length,
                itemBuilder: (context, index) {
                  return categoryTab(tabname[index], index);
                },
              )),
          SizedBox(
            height: 200,
            child: _buildGrid(activeTab),
          )
        ],
      ),
    );
  }

  Widget categoryTab(String category, i) {
    return InkWell(
      onTap: () {
        setState(() {
          activeTab = category;
        });
      },
      child: Container(
        padding: EdgeInsets.all(15.0),
        height: 90,
        decoration: BoxDecoration(
          color: activeTab == category
              ? Color.fromARGB(255, 236, 248, 222)
              : Colors.white,
          borderRadius: activeTab == category
              ? BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0))
              : BorderRadius.only(
                  bottomLeft: Radius.circular(16.0),
                  bottomRight: Radius.circular(16.0)),
        ),
        child: Column(
          children: <Widget>[
            Icon(icons[i]),
            Padding(
              padding: const EdgeInsets.only(top: 9.0),
              child: Text(category),
            )
          ],
        ),
      ),
    );
  }
}

class item extends StatelessWidget {
  List<String> images = [
    "assets/images/mother.png",
    "assets/images/international.png",
    "assets/images/gift.png",
    "assets/images/flower.png",
    "assets/images/personalize.png",
    "assets/images/cake.png",
    "assets/images/vase.png",
    "assets/images/gift2.png",
    "assets/images/chocolate.png",
    "assets/images/gift3.png",
    "assets/images/vase.png",
    "assets/images/vase.png",
    "assets/images/vase.png",
    "assets/images/teddy.png",
    "assets/images/vase.png",
    "assets/images/gift.png",
  ];

  item({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  child: Card(
                    margin: EdgeInsets.all(10.0),
                    elevation: 0,
                    child: Image.asset(
                      images[index],
                      height: 120,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Text(
                  'Young Love',
                  style: TextStyle(fontSize: 15),
                ),
                Text('1449', style: TextStyle(fontSize: 15)),
              ],
            ),
          );
        });
  }
}

Widget _buildGrid(String Category) {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.center,
        colors: [
          Color.fromARGB(255, 238, 247, 228),
          Colors.white,
        ],
      ),
    ),
    child: item(),
  );
}
