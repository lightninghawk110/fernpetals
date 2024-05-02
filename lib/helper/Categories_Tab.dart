import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fern_n_petals/Routes/Route_Paths.dart';
import 'package:fern_n_petals/models/grid_argument.dart';
import 'package:fern_n_petals/viewmodel/item_provider.dart';

class Categories extends StatefulWidget {
  Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  String activeTab = 'Birthday';

  final List<String> tabName = [
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
                return categoryTab(tabName[index], index);
              },
            ),
          ),
          SizedBox(
            height: 200,
            child: _buildGrid(),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: InkWell(
                child: Text(
                  'View All Birthday Gifts  >',
                  style: TextStyle(color: Color.fromARGB(255, 74, 83, 63)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget categoryTab(String category, int index) {
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
            Icon(icons[index]),
            Padding(
              padding: const EdgeInsets.only(top: 9.0),
              child: Text(category),
            )
          ],
        ),
      ),
    );
  }

 Widget _buildGrid() {
    final itemProvider = Provider.of<ItemProvider>(context);
    final items = itemProvider.items; // Assuming this gives the list of items

    return Container(
      padding: EdgeInsets.all(8),
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
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          String? imageName = items[index].name;
          String? imageUrl = items[index].imageUrl;
          return Padding(
            padding: const EdgeInsets.all(6.0),
            child: SizedBox(
              width: 130,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => Navigator.of(context).pushNamed(
                      RoutePaths.ItemPage,
                      arguments: GridArguments(
                        imageName,
                        imageUrl,
                        items[index].price,
                      ),
                    ),
                    child: Card(
                      elevation: 0,
                      child: Image.asset(
                        imageUrl!,
                        height: 120,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Text(
                    imageName!,
                    style: TextStyle(fontSize: 15),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "₹${items[index].price}",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
