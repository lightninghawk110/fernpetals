// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

import 'package:fern_n_petals/Routes/Route_Paths.dart';
import 'package:fern_n_petals/helper/appbar2.dart';
import 'package:fern_n_petals/viewmodel/like_provider.dart';
import 'package:fern_n_petals/viewmodel/product_provider.dart';

class ItemSearchPage extends StatefulWidget {
  ItemSearchPage({Key? key}) : super(key: key);

  @override
  State<ItemSearchPage> createState() => _ItemSearchPageState();
}

class _ItemSearchPageState extends State<ItemSearchPage> {
  bool? signstatus = false;
  String selectedValue = "Recommended";
  var multipleSelected = [];
  List checkListItems = [
    {
      "id": 0,
      "value": false,
      "title": "₹0 TO ₹499 (289)",
    },
    {
      "id": 1,
      "value": false,
      "title": "₹500 TO ₹999 (760)",
    },
    {
      "id": 2,
      "value": false,
      "title": "₹1000 TO ₹1499 (500)",
    },
    {
      "id": 3,
      "value": false,
      "title": "₹1500 TO ₹1999 (289)",
    },
    {
      "id": 4,
      "value": false,
      "title": "₹2000 TO ₹2499 (171)",
    },
    {
      "id": 5,
      "value": false,
      "title": "₹2000 TO ₹2499 (171)",
    },
    {
      "id": 6,
      "value": false,
      "title": "₹3000 AND ABOVE(122)",
    },
  ];
  List<String> sortby = [
    "Recommended",
    "New",
    "Price: Low to High",
    "Price: High to Low"
  ];

  void setPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool("SIGNED_IN") == null) {
      prefs.setBool("SIGNED_IN", false);
    }
  }

  bool? signinstatus = false;
  void getSignedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    signinstatus = prefs.getBool("SIGNED_IN");
    setState(() {});
  }

  @override
  void initState() {
    setPrefs();
    getSignedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar2(
        Appleading: InkWell(
            onTap: () => Navigator.popAndPushNamed(context, RoutePaths.Start),
            child: Icon(Icons.arrow_back)),
        Apptitle: "Same Day Delivery",
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                LocationGradient(
                  signstatus: signinstatus,
                ),
                SizedBox(height: 10),
                ItemCategories(),
                SizedBox(height: 10),
                FutureBuilder(
                  future: Provider.of<ProductProvider>(context, listen: false)
                      .getProduct(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: ShimmerList());
                    } else if (snapshot.hasError) {
                      return Center(child: Text("Error: ${snapshot.error}"));
                    } else {
                      return ItemContainer();
                    }
                  },
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 65,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border:
                      Border(top: BorderSide(width: 0.5, color: Colors.grey))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.white,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          builder: (BuildContext context) {
                            return StatefulBuilder(builder:
                                (BuildContext context, StateSetter setState) {
                              return SizedBox(
                                height: 250,
                                child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      width: 0.3,
                                                      color: Colors.grey))),
                                          height: 40,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Text(
                                            "Sort By",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: sortby.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0,
                                                      vertical: 3.0),
                                              child: Consumer<ProductProvider>(
                                                  builder: (context, provider,
                                                      child) {
                                                return RadioListTile(
                                                  dense: true,
                                                  activeColor: Color.fromARGB(
                                                      255, 176, 191, 162),
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                          left: 0.0,
                                                          right: 0.0),
                                                  visualDensity: VisualDensity(
                                                      vertical: -4,
                                                      horizontal: -4),
                                                  title: Text(
                                                    sortby[index],
                                                    maxLines: 1,
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                  ),
                                                  value: sortby[index],
                                                  groupValue: selectedValue,
                                                  onChanged: (String? value) {
                                                    setState(() {
                                                      selectedValue = value!;
                                                    });
                                                    switch (selectedValue) {
                                                      case "Recommended":
                                                        provider
                                                            .sortProductRecommended(
                                                                provider
                                                                    .product!);
                                                        break;
                                                      case "New":
                                                        provider
                                                            .sortProductsByTitle(
                                                                provider
                                                                    .product!);
                                                        break;
                                                      case "Price: Low to High":
                                                        provider
                                                            .sortProductsByOnSalePrice(
                                                                provider
                                                                    .product!);
                                                        break;
                                                      case "Price: High to Low":
                                                        provider
                                                            .sortProductsByOnSalePriceDescending(
                                                                provider
                                                                    .product!);
                                                        break;
                                                      default:
                                                        print(
                                                            "no option selected");
                                                    }
                                                    Navigator.pop(context);
                                                  },
                                                );
                                              }),
                                            );
                                          },
                                        )
                                      ],
                                    )),
                              );
                            });
                          });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                          border: Border(
                              right:
                                  BorderSide(width: 0.5, color: Colors.grey))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.compare_arrows,
                            color: Color.fromARGB(255, 136, 134, 82),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Sort By",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 136, 134, 82),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                selectedValue,
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.white,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          builder: (BuildContext context) {
                            return StatefulBuilder(builder:
                                (BuildContext context, StateSetter setState) {
                              return SizedBox(
                                height: MediaQuery.of(context).size.height / 2,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 3.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    width: 0.3,
                                                    color: Colors.grey))),
                                        height: 40,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Text(
                                          "Filter(2230 Gifts Available)",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 50,
                                              width: 150,
                                              decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 232, 239, 225),
                                                border: Border(
                                                  right: BorderSide(
                                                      color:
                                                          Colors.grey.shade400),
                                                ),
                                              ),
                                              child: Text(
                                                'Price',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Consumer<ProductProvider>(builder:
                                                (context, provider, child) {
                                              return Expanded(
                                                child: Column(
                                                  children: List.generate(
                                                    checkListItems.length,
                                                    (index) => CheckboxListTile(
                                                        controlAffinity:
                                                            ListTileControlAffinity
                                                                .leading,
                                                        dense: true,
                                                        activeColor:
                                                            Color.fromARGB(255,
                                                                176, 191, 162),
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                left: 0.0,
                                                                right: 0.0),
                                                        visualDensity:
                                                            VisualDensity(
                                                                vertical: -4,
                                                                horizontal: -4),
                                                        title: Text(
                                                            checkListItems[
                                                                    index]
                                                                ["title"]),
                                                        value: checkListItems[
                                                            index]["value"],
                                                        onChanged: (value) {
                                                          setState(() {
                                                            checkListItems[
                                                                        index]
                                                                    ["value"] =
                                                                value;
                                                            if (value == true) {
                                                              multipleSelected.add(
                                                                  checkListItems[
                                                                      index]);
                                                            } else {
                                                              multipleSelected
                                                                  .removeWhere((item) =>
                                                                      item[
                                                                          "id"] ==
                                                                      checkListItems[
                                                                              index]
                                                                          [
                                                                          "id"]);
                                                            }
                                                            _applyFilters();
                                                          });
                                                        }),
                                                  ),
                                                ),
                                              );
                                            })
                                          ]),
                                    ],
                                  ),
                                ),
                              );
                            });
                          });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.filter_alt_outlined,
                              color: Color.fromARGB(255, 136, 134, 82),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Filter",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromARGB(255, 136, 134, 82),
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  multipleSelected.isNotEmpty
                                      ? multipleSelected.length.toString() +
                                          " Filter" +
                                          "Applied"
                                      : "No Filter",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _applyFilters() {
    var provider = Provider.of<ProductProvider>(context, listen: false);

    provider.sortProductRecommended(provider.product);

    for (var filter in multipleSelected) {
      switch (filter["title"]) {
        case "₹0 TO ₹499 (289)":
          provider.filter(0, 499);
          break;
        case "₹500 TO ₹999 (760)":
          provider.filter(500, 999);
          break;
        case "₹1000 TO ₹1499 (500)":
          provider.filter(1000, 1499);
          break;
        case "₹1500 TO ₹1999 (289)":
          provider.filter(1500, 1999);
          break;
        case "₹2000 TO ₹2499 (171)":
          provider.filter(2000, 2499);
          break;
        case "₹2500 TO ₹2999 (171)":
          provider.filter(2500, 2999);
          break;
        case "₹3000 AND ABOVE (122)":
          provider.filter(3000, double.infinity);
          break;
        default:
          break;
      }
    }
  }
}

class LocationGradient extends StatelessWidget {
  bool? signstatus;
  LocationGradient({
    super.key,
    required this.signstatus,
  });

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
              signstatus!
                  ? "Change your delivery location here"
                  : "Add Delivery location to Check availability ",
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
  ItemContainer({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, provider, child) {
      return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount:
            provider.product?.data.length ?? 0, // Ensure itemCount is accurate
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 4,
            mainAxisExtent: 240),
        padding: EdgeInsets.all(8.0), // padding around the grid
        itemBuilder: (context, index) {
          return Container(
            child: InkWell(
                onTap: () => Navigator.of(context).pushNamed(
                    RoutePaths.ProductPage,
                    arguments: provider.product?.data[index]),
                child: ItemBox(i: index)),
          );
        },
      );
    });
  }
}

class ItemBox extends StatefulWidget {
  ItemBox({super.key, required this.i});

  final int i; // Use 'final' to ensure immutability

  @override
  State<ItemBox> createState() => _ItemBoxState();
}

class _ItemBoxState extends State<ItemBox> {
  String url = "https://brotherstreat.infinitmindsdigital.com/";

  final Image noImage = Image.asset(
    "assets/images/noimageplaceholder.png",
    height: 180,
    width: 180,
    fit: BoxFit.fill,
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
        builder: (context, productprovider, child) {
      var product = productprovider.product?.data[widget.i];

      if (product == null) {
        return Container(); // Return an empty container if product is null
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              clipBehavior: Clip.hardEdge,
              child: CachedNetworkImage(
                height: 180,
                width: 180,
                fit: BoxFit.fill,
                imageUrl: url + product.fileUrl.toString(),
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    SizedBox(
                        height: 10,
                        width: 10,
                        child: Center(
                            child: CircularProgressIndicator(
                          color: Color.fromARGB(255, 247, 247, 219),
                        ))),
                errorWidget: (context, url, error) => noImage,
              ),
            ),
            Positioned(
                bottom: 5,
                right: 7,
                child: Consumer<FavouriteProvider>(
                    builder: (context, favouriteprovider, child) {
                  return IconButton(
                      padding: EdgeInsets.all(0.0),
                      iconSize: 12,
                      onPressed: () {
                        favouriteprovider.addtoFav(product);
                      },
                      icon: favouriteprovider.isExist(product)
                          ? Icon(
                              Iconsax.heart5,
                              color: Colors.red,
                              size: 15,
                            )
                          : Icon(
                              Iconsax.heart,
                              color: Colors.black,
                              size: 15,
                            ));
                })),
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
            product.title.toString(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            product.features.isEmpty
                ? "NOT AVAILABLE"
                : "₹${product.features[0].onSalePrice.toString()}",
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

class ShimmerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      direction: ShimmerDirection.ltr,
      baseColor: Colors.grey[200]!,
      highlightColor: Colors.grey[200]!,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 4,
            mainAxisExtent: 240),
        itemCount: 183, // Adjust the count based on your needs
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 180,
                  width: 180,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 3,
                ),
                Container(
                  height: 10,
                  width: 150,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 3,
                ),
                Container(
                  height: 10,
                  color: Colors.white,
                  width: 40,
                ),
                SizedBox(
                  height: 3,
                ),
                Container(
                  height: 10,
                  color: Colors.white,
                  width: 120,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
