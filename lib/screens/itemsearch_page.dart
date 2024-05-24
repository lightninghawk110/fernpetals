import 'package:fern_n_petals/helper/appbar2.dart';
import 'package:fern_n_petals/viewmodel/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ItemSearchPage extends StatefulWidget {
  const ItemSearchPage({super.key});

  @override
  State<ItemSearchPage> createState() => _ItemSearchPageState();
}

class _ItemSearchPageState extends State<ItemSearchPage> {
  void initState() {
    getItem();
  }

  void getItem() async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductProvider>(context, listen: true).getProduct();
    });
  }

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
  ItemCategories({super.key});

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
                categoryName[index],
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
    return Consumer<ProductProvider>(builder: (context, provider, child) {
      return GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: 4,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 4,
            mainAxisExtent: 240),
        padding: EdgeInsets.all(8.0), // padding around the grid
        // total number of items
        itemBuilder: (context, index) {
          return Container(
              child: Column(
            children: <Widget>[
              ItemBox(
                i: index,
              )
            ],
          ));
        },
      );
    });
  }
}

class ItemBox extends StatelessWidget {
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
  ItemBox({super.key, required this.i});

  var i = 0;
  String url = "https://brotherstreat.infinitmindsdigital.com/";

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
        builder: (context, provider, child, {listen = false}) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              clipBehavior: Clip.hardEdge,
              child: Image.asset(
                url + provider.p!.data[i].fileUrl.toString(),
                height: 180,
                width: 180,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
                bottom: 5,
                right: 7,
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.2),
                      border: Border.all(color: Colors.grey.shade500)),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: FaIcon(
                      FontAwesomeIcons.heart,
                      color: Colors.black,
                      size: 15,
                    ),
                  ),
                )),
            Positioned(
                bottom: 5,
                left: 7,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white.withOpacity(0.5),
                      border: Border.all(color: Colors.grey.shade500)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 2),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.green,
                          size: 12,
                        ),
                        Text(
                          "4.4",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 13),
                        ),
                        Text(
                          " | ",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text("4.2K",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 13))
                      ],
                    ),
                  ),
                )),
          ]),
          Text(
            provider.p!.data[i].title.toString(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            provider.p!.data[i].features[i].onSalePrice.toString(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            "Earliest Delivery : Today",
            style: TextStyle(color: Colors.blue, fontSize: 12),
          ),
        ],
      );
    });
  }
}
