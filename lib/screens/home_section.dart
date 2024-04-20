import 'dart:async';

import 'package:fern_n_petals/helper/Categories_Tab.dart';
import 'package:fern_n_petals/helper/Countdown_timer.dart';
import 'package:fern_n_petals/helper/GridBirthday.dart';
import 'package:fern_n_petals/helper/Tailored_Items.dart';
import 'package:fern_n_petals/helper/Tailored_Items2.dart';
import 'package:fern_n_petals/helper/Three_Tab.dart';
import 'package:fern_n_petals/helper/customdot.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class HomeSection extends StatelessWidget {
  HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(
          height: 15,
        ),
        SearchBox(),
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
          c: Colors.brown,
        ),
        SizedBox(height: 200, child: item_list()),
        ThreeListTile(
          c: Colors.red,
        ),
        SizedBox(height: 200, child: item_list2()),
      ],
    );
  }
}

class SearchBox extends StatelessWidget {
  SearchBox({super.key});
  var searchvalue = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class CategoriesGrid extends StatelessWidget {
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
  List<String> imagename = [
    "Eid Gifts",
    "International",
    "Birthday",
    "Flower",
    "Personalized",
    "Cakes",
    "Plants",
    "Combos",
    "Chocolates",
    "Gift Hampers",
    "Anniversary",
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
              maxCrossAxisExtent: 110,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemBuilder: (context, index) {
            return GridTile(
                child: InkWell(
              onTap: () {
                debugPrint(index.toString());
              },
              child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 244, 246, 242)),
                      alignment: Alignment.center,
                      child: Image.asset(
                        images[index],
                        height: 70,
                        fit: BoxFit.contain,
                      )),
                  Text(imagename[index]),
                ],
              ),
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
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
