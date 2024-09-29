import 'dart:developer';

import 'package:fern_n_petals/Routes/Route_Paths.dart';
import 'package:fern_n_petals/helper/Categories_Tab.dart';
import 'package:fern_n_petals/helper/Countdown_timer.dart';
import 'package:fern_n_petals/helper/Three_Tab.dart';
import 'package:fern_n_petals/helper/customdot.dart';
import 'package:fern_n_petals/helper/itemslist.dart';
import 'package:fern_n_petals/viewmodel/cart_provider.dart';
import 'package:fern_n_petals/viewmodel/location_provider.dart';
import 'package:fern_n_petals/viewmodel/login_provider.dart';
import 'package:fern_n_petals/viewmodel/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomeSection extends StatefulWidget {
  HomeSection({super.key});

  @override
  State<HomeSection> createState() => HomeSectionState();
}

class HomeSectionState extends State<HomeSection> {
  ScrollController _scrollController = ScrollController();
  double scrollPosition = 0;

  _scrollListener() {
    setState(() {
      scrollPosition = _scrollController.position.pixels;
    });
  }

  void setPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool("SIGNED_IN") == null) {
      prefs.setBool("SIGNED_IN", false);
    }
  }

  bool? signstatus = false;
  void getSignedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    signstatus = prefs.getBool("SIGNED_IN");
    setState(() {});
    log(signstatus.toString());
  }

  @override
  void initState() {
    Provider.of<ProductProvider>(context, listen: false).getProduct();

    setPrefs();
    getSignedIn();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: Border(
            bottom: BorderSide(color: Color.fromARGB(255, 245, 242, 242))),
        centerTitle: false,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () => Navigator.of(context).pushNamed(RoutePaths.Loc),
          child: Icon(Iconsax.location),
        ),
        titleSpacing: 0,
        title: InkWell(
          onTap: () => Navigator.of(context).pushNamed(RoutePaths.Loc),
          child: Consumer<LoginProvider>(builder: (context, provider, child) {
            return Consumer<LocationProvider>(
                builder: (context, locationProvider, child) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    signstatus!
                        ? locationProvider.subArea!
                        : "Where to deliver?",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    signstatus!
                        ? locationProvider.pincode!
                        : "Location Missing  >",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight:
                            signstatus! ? FontWeight.w200 : FontWeight.w400,
                        color: signstatus! ? Colors.black : Colors.red),
                  ),
                ],
              );
            });
          }),
        ),
        actions: <Widget>[
          scrollPosition == 0.0
              ? SizedBox(
                  height: 0,
                )
              : IconButton(
                  icon: Icon(Iconsax.search_normal),
                  onPressed: () =>
                      Navigator.of(context).pushNamed(RoutePaths.search)),
          IconButton(
              icon: Icon(Iconsax.heart),
              onPressed: () =>
                  Navigator.of(context).pushNamed(RoutePaths.wishlist_empty)),
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Stack(
              children: [
                Consumer<CartProvider>(builder: (context, cartCounter, child) {
                  return IconButton(
                      icon: Icon(Iconsax.shopping_cart4),
                      onPressed: cartCounter.cartItems.length == 0
                          ? () => Navigator.of(context)
                              .pushNamed(RoutePaths.cartpg_empty)
                          : () => Navigator.of(context)
                              .pushNamed(RoutePaths.cartpg));
                }),
                Positioned(
                    top: 5,
                    right: 7,
                    child: Badge(label: Consumer<CartProvider>(
                        builder: (context, cartCounter, child) {
                      return Text(
                        cartCounter.cartItems.length.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      );
                    })))
              ],
            ),
          ),
        ],
      ),
      body: HomePageBody(
        s: _scrollController,
      ),
    );
  }
}

class HomePageBody extends StatelessWidget {
  final ScrollController s;
  HomePageBody({super.key, required this.s});

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: s,
      children: <Widget>[
        SizedBox(
          height: 15,
        ),
        SearchBox(),
        // FutureBuilder(
        //     future: Provider.of<ProductProvider>(context, listen: false)
        //         .getProduct(),
        //     builder: (context, snapshot) {
        //       if (snapshot.connectionState == ConnectionState.waiting) {
        //         return Center();
        //       } else if (snapshot.hasError) {
        //         return Center(child: Text("Error: ${snapshot.error}"));
        //       } else {
        //         return SizedBox(
        //           height: 1,
        //         );
        //       }
        //     }),
        SizedBox(
          height: 15,
        ),
        CategoriesGrid(),
        SizedBox(
          height: 25,
        ),
        Carousel(),
        SizedBox(
          height: 20,
        ),
        TabText(),
        SizedBox(
          height: 20,
        ),
        IconTab(),
        TimerCard(),
        SizedBox(
          height: 20,
        ),
        ThreeListTile(
          img: 'assets/images/tabviewpic1.png',
          c: Colors.brown,
        ),
        SizedBox(
            height: 200,
            child: ItemList(
              val: 41,
            )),
        RelationshipSection(),
        ThreeListTile(
          img: 'assets/images/tabviewpic2.png',
          c: Colors.blueGrey,
        ),
        SizedBox(
            height: 200,
            child: ItemList(
              val: 10,
            )),
        CarouselOffers(),
        SizedBox(
          height: 10,
        ),
        CarouselDeal(),
        SizedBox(
          height: 10,
        ),
        ThreeListTile(c: Colors.brown, img: "assets/images/tabviewpic4.png"),
        SizedBox(
            height: 200,
            child: ItemList(
              val: 20,
            )),
        ThreeListTile(c: Colors.blueGrey, img: "assets/images/tabviewpic3.png"),
        SizedBox(
            height: 200,
            child: ItemList(
              val: 30,
            )),
        PassionSection(),
      ],
    );
  }
}

class SearchBox extends StatelessWidget {
  SearchBox({super.key});
  var searchvalue = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(RoutePaths.search),
      child: Container(
          height: 40,
          margin: EdgeInsets.symmetric(horizontal: 12.0),
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color.fromARGB(255, 212, 212, 212).withOpacity(.2)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: 20,
                child: Icon(
                  Icons.search,
                  color: Colors.brown,
                ),
              ),
              Container(
                  margin: EdgeInsets.only(right: 50),
                  width: 200,
                  child: AnimatedTextKit(animatedTexts: [
                    TyperAnimatedText('What Are You Looking For ?',
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 15,
                        )),
                  ])),
              SizedBox(
                width: 20,
                child: Icon(
                  Icons.mic_sharp,
                ),
              ),
            ],
          )),
    );
  }
}

class CategoriesGrid extends StatelessWidget {
  List<String> images = [
    "assets/images/home_img3.png",
    "assets/images/international.png",
    "assets/images/home_img.png",
    "assets/images/home_img2.png",
    "assets/images/grid_personalized1.png",
    "assets/images/cake.png",
    "assets/images/home_img6.png",
    "assets/images/home_img5.png",
    "assets/images/chocolate.png",
    "assets/images/gift3.png",
    "assets/images/gift.png",
    "assets/images/vase.png",
    "assets/images/vase.png",
    "assets/images/teddy.png",
    "assets/images/vase.png",
    "assets/images/gift.png",
  ];
  List<String> imagename = [
    "Father's Day",
    "International",
    "Birthday",
    "Same Day",
    "Personalized",
    "Cakes",
    "Flower",
    "Anniversary",
    "Chocolates",
    "Gift Hampers",
    "Combo",
    "Experience",
    "New Arrivals",
    "Home Living",
    "Themed Gifts",
    "All Gifts"
  ];
  CategoriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: GridView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: images.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 80, crossAxisSpacing: 20, mainAxisSpacing: 2),
          itemBuilder: (context, index) {
            return GridTile(
                child: Column(
              children: [
                InkWell(
                  onTap: () {
                    switch (index) {
                      case 5:
                        log("5 pressed");
                        Navigator.popAndPushNamed(
                            context, RoutePaths.cake_category);
                        break;
                      default:
                    }
                  },
                  child: Container(
                      clipBehavior: Clip.hardEdge,
                      width: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 241, 244, 246)),
                      alignment: Alignment.center,
                      child: Image.asset(
                        images[index],
                        height: 70,
                        fit: BoxFit.cover,
                      )),
                ),
                Text(imagename[index]),
              ],
            ));
          }),
    );
  }
}

class Carousel extends StatefulWidget {
  Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int currentIndex = 0;
  List<Widget> carouselItems = [
    Container(
        margin: EdgeInsets.all(7.0),
        clipBehavior: Clip.antiAlias,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Image.asset(
          'assets/images/car1.png',
          fit: BoxFit.cover,
        )),
    Container(
        // margin: EdgeInsets.all(7.0),
        clipBehavior: Clip.antiAlias,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Image.asset(
          'assets/images/car2.png',
          fit: BoxFit.cover,
        )),
    Container(
        // margin: EdgeInsets.all(7.0),
        clipBehavior: Clip.antiAlias,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Image.asset(
          'assets/images/car3.png',
          fit: BoxFit.cover,
        )),
    Container(
        // margin: EdgeInsets.all(7.0),
        clipBehavior: Clip.antiAlias,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Image.asset(
          'assets/images/car4.png',
          fit: BoxFit.cover,
        )),
    Container(
        // margin: EdgeInsets.all(7.0),
        clipBehavior: Clip.antiAlias,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Image.asset(
          'assets/images/car5.png',
          fit: BoxFit.cover,
        )),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: CarouselSlider(
            items: carouselItems,
            options: CarouselOptions(
              enableInfiniteScroll: false,
              autoPlay: true,
              padEnds: false,
              autoPlayAnimationDuration: Duration(milliseconds: 500),
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        CustomDot(dotIndex: currentIndex, dotLength: carouselItems.length)
      ],
    );
  }
}

class TabText extends StatelessWidget {
  const TabText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 20),
      child: Text(
        'Tailored For Your Occassions',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
    );
  }
}

class IconTab extends StatelessWidget {
  const IconTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Categories(),
    );
  }
}

class TimerCard extends StatelessWidget {
  const TimerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Color.fromARGB(255, 234, 244, 225),
          child: Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Image.asset('assets/images/clock.gif'),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Need it Today?",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Time Left for Today Delivery',
                        style: TextStyle(fontSize: 9),
                      ),
                      CountdownTimerPage(),
                      Container(
                        width: 130,
                        height: 20,
                        child: Center(
                          child: Text(
                            "Find Gifts Now",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.brown),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RelationshipSection extends StatelessWidget {
  RelationshipSection({super.key});

  List<String> relationshipName = ['Men', "Women", " Kids", "Friends"];
  List<String> relationshipImg = [
    'assets/images/man1.png',
    "assets/images/girlimg2.png",
    "assets/images/kid.png",
    "assets/images/friends2.png"
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "For Every Relationship",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      height: 120,
                      width: 100,
                      clipBehavior: Clip.hardEdge,
                      child: Stack(
                        children: <Widget>[
                          Image.asset(
                            relationshipImg[index],
                            fit: BoxFit.contain,
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              child: Center(
                                child: Text(
                                  relationshipName[index],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 9,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              height: 14,
                              width: 100,
                              color: Colors.black.withOpacity(0.7),
                            ),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CarouselOffers extends StatefulWidget {
  const CarouselOffers({super.key});

  @override
  State<CarouselOffers> createState() => _CarouselOffersState();
}

class _CarouselOffersState extends State<CarouselOffers> {
  int currentIndex = 0;
  List<Widget> carouselItems = [
    Container(
        margin: EdgeInsets.all(7.0),
        clipBehavior: Clip.antiAlias,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Image.asset(
          'assets/images/carousel_offers.png',
          fit: BoxFit.fill,
        )),
    Container(
        // margin: EdgeInsets.all(7.0),
        clipBehavior: Clip.antiAlias,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Image.asset(
          'assets/images/carousel_offers2.png',
          height: 90,
          fit: BoxFit.fill,
        )),
    Container(
        // margin: EdgeInsets.all(7.0),
        clipBehavior: Clip.antiAlias,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Image.asset(
          'assets/images/carousel_offers3.png',
          height: 90,
          fit: BoxFit.fill,
        )),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 180,
          child: CarouselSlider(
            items: carouselItems,
            options: CarouselOptions(
              enableInfiniteScroll: false,
              viewportFraction: 1,
              autoPlay: true,
              padEnds: false,
              autoPlayAnimationDuration: Duration(milliseconds: 500),
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        CustomDot(dotIndex: currentIndex, dotLength: carouselItems.length)
      ],
    );
  }
}

class CarouselDeal extends StatefulWidget {
  const CarouselDeal({super.key});

  @override
  State<CarouselDeal> createState() => _CarouselDealState();
}

class _CarouselDealState extends State<CarouselDeal> {
  @override
  int currentIndex = 0;
  List<Widget> carouselItems = [
    Container(
        margin: EdgeInsets.all(7.0),
        clipBehavior: Clip.antiAlias,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Image.asset(
          'assets/images/carousel_deal.jpg',
          fit: BoxFit.fill,
        )),
    Container(
        // margin: EdgeInsets.all(7.0),
        clipBehavior: Clip.antiAlias,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Image.asset(
          'assets/images/carousel_deal2.png',
          height: 90,
          fit: BoxFit.fill,
        )),
    Container(
        // margin: EdgeInsets.all(7.0),
        clipBehavior: Clip.antiAlias,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Image.asset(
          'assets/images/carousel_deal3.png',
          height: 90,
          fit: BoxFit.fill,
        )),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: CarouselSlider(
            items: carouselItems,
            options: CarouselOptions(
              enableInfiniteScroll: false,
              viewportFraction: 1,
              autoPlay: true,
              padEnds: false,
              autoPlayAnimationDuration: Duration(milliseconds: 500),
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        CustomDot(dotIndex: currentIndex, dotLength: carouselItems.length)
      ],
    );
  }
}

class PassionSection extends StatelessWidget {
  PassionSection({super.key});

  List<String> relationshipName = [
    'Gardening',
    "Fashion",
    " Travel",
    "Decorative"
  ];
  List<String> relationshipImg = [
    'assets/images/gardening.png',
    "assets/images/fashion.png",
    "assets/images/travel.png",
    "assets/images/gifthamper_5.png"
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Passion Inspired Presents",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () => Navigator.of(context)
                          .pushNamed(RoutePaths.itemsearch),
                      child: Container(
                        height: 120,
                        width: 100,
                        clipBehavior: Clip.hardEdge,
                        child: Stack(
                          children: <Widget>[
                            Image.asset(
                              relationshipImg[index],
                              fit: BoxFit.contain,
                            ),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                child: Center(
                                  child: Text(
                                    relationshipName[index],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 9,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                height: 14,
                                width: 100,
                                color: Colors.black.withOpacity(0.8),
                              ),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
