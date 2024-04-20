import 'package:fern_n_petals/Routes/Route_Paths.dart';
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

  late ItemState itemState;
  void initState() {
    super.initState();
    itemState = ItemState();
  }

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
          itemState.shuffleItems();
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

  Widget _buildGrid(String category) {
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
      child: item(itemState: itemState),
    );
  }
}

class ItemState {
  void shuffleItems() {
    itemData.shuffle();
  }
}

List<Map<String, String>> itemData = [
  {
    "name": "Faboulous Moment Chocolate Cake",
    "link": "assets/images/grid_cake1.png",
  },
  {
    "name": "Chocolate Affair Birthday",
    "link": "assets/images/grid_chocolate1.png"
  },
  {"name": "Sweet Memories Roses", "link": "assets/images/grid_flower1.png"},
  {"name": "Gift Hamper", "link": "assets/images/grid_gift1.png"},
  {
    "name": "Sweet Sernity Birthday Cake",
    "link": "assets/images/grid_cake2.png"
  },
  {
    "name": "Personalized Gift Anniversary",
    "link": "assets/images/grid_personalized1.png"
  },
  {"name": "Pretty in Pink Cake", "link": "assets/images/grid_flower2.png"},
  {"name": "Lovely Gift Hampers", "link": "assets/images/grid_gift2.png"},
  {
    "name": "Anniversary Magic Photos",
    "link": "assets/images/grid_anniversary1.png"
  },
];

class item extends StatefulWidget {
  final ItemState itemState;

  item({required this.itemState, Key? key}) : super(key: key);
  @override
  State<item> createState() => _itemState();
}

class _itemState extends State<item> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemData.length,
        itemBuilder: (context, index) {
          String? imageName = itemData[index]['name'];
          String? imageUrl = itemData[index]['link'];
          return Padding(
            padding: const EdgeInsets.all(6.0),
            child: SizedBox(
              width: 130,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () =>
                        Navigator.of(context).pushNamed(RoutePaths.ItemPage),
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
                  Text(' ₹1449', style: TextStyle(fontSize: 15)),
                ],
              ),
            ),
          );
        });
  }
}
