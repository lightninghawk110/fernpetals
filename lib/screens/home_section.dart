import 'package:fern_n_petals/helper/customdot.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeSection extends StatelessWidget {
  HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
        ],
      ),
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

class Categories extends StatelessWidget {
  Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      child: Row(
        children: [
          for (int i = 0; i < 8; i++)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: 70,
                height: 70,
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 227, 246, 205),
                    borderRadius: BorderRadius.circular(10)),
              ),
            )
        ],
      ),
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
          'assets/images/car4.png',
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
      height: 250,
      child: SingleChildScrollView(
        child: Column(children: [
          Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Color.fromARGB(255, 242, 246, 234)),
                height: 80,
                width: 90,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Icon(Icons.cake_outlined),
                      Padding(
                        padding: EdgeInsets.only(top: 9),
                        child: Text('Birthday'),
                      ),
                    ],
                  ),
                ),
              ),
        
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white),
                height: 80,
                width: 150,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Icon(Icons.heart_broken_sharp),
                      Padding(
                        padding: EdgeInsets.only(top: 9),
                        child: Text('Love N Romance'),
                      ),
                    ],
                  ),
                ),
              ),
        
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white),
                height: 80,
                width: 100,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Icon(Icons.key),
                      Padding(
                        padding: EdgeInsets.only(top: 9),
                        child: Text('Anniversary'),
                      ),
                    ],
                  ),
                ),
              ),
        
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white),
                height: 80,
                width: 90,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Icon(Icons.handshake),
                      Padding(
                        padding: EdgeInsets.only(top: 9),
                        child: Text('Congratulations'),
                      ),
                    ],
                  ),
                ),
              ),
        
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white),
                height: 80,
                width: 90,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Icon(Icons.thumb_up_sharp),
                      Padding(
                        padding: EdgeInsets.only(top: 9),
                        child: Text('Thank You'),
                      ),
                    ],
                  ),
                ),
              ),
        
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white),
                height: 80,
                width: 90,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Icon(Icons.cake_outlined),
                      Padding(
                        padding: EdgeInsets.only(top: 9),
                        child: Text('Birthday'),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
