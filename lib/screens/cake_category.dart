import 'package:carousel_slider/carousel_slider.dart';
import 'package:fern_n_petals/Routes/Route_Paths.dart';
import 'package:fern_n_petals/helper/appbar2.dart';

import 'package:fern_n_petals/helper/customdot.dart';

import 'package:fern_n_petals/screens/itemsearch_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CakeCategory extends StatefulWidget {
  const CakeCategory({super.key});

  @override
  State<CakeCategory> createState() => _CakeCategoryState();
}

class _CakeCategoryState extends State<CakeCategory> {
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
          Apptitle: "",
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          LocationGradient(
            signstatus: signinstatus,
          ),
          CarouselCakeCategory(),
          Container(
            height: 60,
            color: Colors.pink.shade100.withOpacity(0.22),
            child: Center(
              child: Text(
                "Cakes: Fresh & Flavourful",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ImageContainer(
                  link: "assets/images/cake_category_one.png",
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.height / 5,
                ),
                ImageContainer(
                  link: "assets/images/cake_category_two.png",
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.height / 5,
                ),
              ],
            ),
          ),
          PinkDiv(),
          FlavourSection(
            heading_text: "Pick A Flavour",
          ),
          PinkDiv(),
          OccassionsSection(
            heading_text: "Celebrate Special Occasions",
          ),
        ])));
  }
}

class CarouselCakeCategory extends StatefulWidget {
  const CarouselCakeCategory({super.key});

  @override
  State<CarouselCakeCategory> createState() => _CarouselOffersState();
}

class _CarouselOffersState extends State<CarouselCakeCategory> {
  int currentIndex = 0;
  List<Widget> carouselItems = [
    Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Image.asset(
          'assets/images/cake_slider_category.png',
          fit: BoxFit.fill,
        )),
    Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Image.asset(
          'assets/images/cake_slider_category2.png',
          fit: BoxFit.fill,
        )),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          child: CarouselSlider(
            items: carouselItems,
            options: CarouselOptions(
              enableInfiniteScroll: false,
              viewportFraction: 1,
              autoPlay: true,
              aspectRatio: 16 / 6,
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
        Positioned(
            left: MediaQuery.of(context).size.width / 2.2,
            bottom: 1,
            child: CustomDot(
                dotIndex: currentIndex, dotLength: carouselItems.length))
      ],
    );
  }
}

class ImageContainer extends StatelessWidget {
  final String link;
  final double height;
  final double width;
  const ImageContainer(
      {super.key,
      required this.link,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
      child: Image.asset(
        link,
        fit: BoxFit.cover,
        height: height,
        width: height,
      ),
    );
  }
}

class PinkDiv extends StatelessWidget {
  const PinkDiv({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15,
      width: MediaQuery.of(context).size.width,
      color: Colors.pink.shade100.withOpacity(0.22),
    );
  }
}

class FlavourSection extends StatelessWidget {
  FlavourSection({super.key, this.heading_text});

  final heading_text;

  List<String> images = [
    "assets/images/flavour_cake1.png",
    "assets/images/flavour_cake2.png",
    "assets/images/flavour_cake3.png",
    "assets/images/flavour_cake4.png",
    "assets/images/flavour_cake5.png",
    "assets/images/flavour_cake6.png",
    "assets/images/flavour_cake7.png",
    "assets/images/flavour_cake8.png",
  ];
  List<String> imagename = [
    "Chocolate Cakes",
    "Truffle Cakes",
    "Fresh Fruit Cakes",
    "Black Forest Cakes",
    "Mango Cakes",
    "Red Velvet Cakes",
    "Butterscotch Cakes",
    "Pineapple Cakes",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              heading_text,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 135, 135, 84),
                  borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  "All Cakes",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            )
          ]),
        ),
        GridView.builder(
          itemCount: 8,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return Container(
                child: Column(
              children: [
                ImageContainer(
                  link: images[index],
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.height / 5,
                ),
                Center(
                  child: Text(
                    imagename[index],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ));
          },
        )
      ],
    );
  }
}

class OccassionsSection extends StatelessWidget {
  final heading_text;
  List<String> images = [
    "assets/images/cake_category_occassions.png",
    "assets/images/cake_category_occassions2.png",
  ];
  List<String> imagename = [
    "Birthday",
    "Anniversary",
  ];

  OccassionsSection({super.key, this.heading_text});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          heading_text,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
      ),
      Container(
          child: Column(
        children: [
          ImageContainer(
            link: images[0],
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width / 4,
          ),
          Center(
            child: Text(
              imagename[0],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      )),
      Container(
          child: Column(
        children: [
          ImageContainer(
            link: images[1],
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width / 4,
          ),
          Center(
            child: Text(
              imagename[1],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      )),
    ]);
  }
}
