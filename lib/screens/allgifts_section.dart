import 'package:flutter/material.dart';

class AllGiftsSection extends StatelessWidget {
  const AllGiftsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 242, 242, 240),
          title: Text("All Gifts"),
          bottom: TabBar(
            splashFactory: NoSplash.splashFactory,
            indicatorColor: Colors.brown,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Colors.black,
            dividerColor: Colors.transparent,
            tabs: [
              Tab(
                text: "Gift Type",
              ),
              Tab(
                text: "Occassions",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[GiftsTab(), OccassionsTab()],
        ),
      ),
    );
  }
}

class GiftsTab extends StatelessWidget {
  GiftsTab({super.key});

  List<String> categoryImg = [
    "assets/images/cat_cake.png",
    "assets/images/cat_flower.png",
    "assets/images/cat_personalised.png",
    "assets/images/cat_plant.png",
    "assets/images/cat_chocolate.png",
    "assets/images/cat_combo.png",
    "assets/images/cat_more.png",
    "assets/images/cat_trend.png",
  ];

  List<String> categoryName = [
    "Cakes",
    "Flower",
    "Personalised",
    "Plants",
    "Chocolate",
    "Combo",
    "More",
    "Trend",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 242, 242, 240),
      child: ListView.builder(
        itemCount: 7,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
                color: Colors.white,
              ),
              child: ExpansionTile(
                tilePadding: EdgeInsets.symmetric(vertical: 10),
                visualDensity: VisualDensity(vertical: 4),
                shape: Border(),
                controlAffinity: ListTileControlAffinity.trailing,
                iconColor: Colors.black,
                leading: Image.asset(categoryImg[index]),
                title: Text(categoryName[index]),
                // trailing: Icon(Icons.keyboard_arrow_down),
                children: <Widget>[NestedExpansionTile()],
              ),
            ),
          );
        },
      ),
    );
  }
}

class OccassionsTab extends StatelessWidget {
  OccassionsTab({super.key});

  List<String> NestedCategories = [
    "Anniversary",
    "Birthday",
    "Upcoming Occassions",
    "Special Occassions",
    "Emotions N Sentiments"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 242, 242, 240),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (BuildContext context, int nestedindex) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 3),
                child: ExpansionTile(
                  controlAffinity: ListTileControlAffinity.trailing,
                  iconColor: Colors.black,
                  title: Text(NestedCategories[nestedindex]),
                  collapsedBackgroundColor: Colors.white,
                  shape: Border(),
                  tilePadding: EdgeInsets.all(0),
                  visualDensity: VisualDensity(vertical: -4),
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTileList(),
                  ],
                ),
              );
            }),
      ),
    );
    ;
  }
}

class NestedExpansionTile extends StatelessWidget {
  NestedExpansionTile({super.key});

  List<String> NestedCategories = [
    "By Feature",
    "By Occassions, By Flavours",
    "By Flavour",
    "By Types"
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (BuildContext context, int nestedindex) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 3),
            child: ExpansionTile(
              controlAffinity: ListTileControlAffinity.trailing,
              iconColor: Colors.black,
              title: Text(NestedCategories[nestedindex]),
              collapsedBackgroundColor: Colors.grey.shade300,
              shape: Border(),
              tilePadding: EdgeInsets.all(0),
              visualDensity: VisualDensity(vertical: -4),
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTileList(),
              ],
            ),
          );
        });
  }
}

class ListTileList extends StatelessWidget {
  const ListTileList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (BuildContext context, int listindex) {
          return ListTile(
            title: Text("All Cake"),
            visualDensity: VisualDensity(vertical: -4),
          );
        });
  }
}
