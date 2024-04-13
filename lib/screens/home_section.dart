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
          SearchBox(),
          SizedBox(
            height: 15,
          ),
          CategoriesGrid(),
          SizedBox(
            height: 20,
          ),
          Carousel(),
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
          color: Colors.grey.withOpacity(.2)),
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
        CustomDot(dotIndex: currentIndex, dotLength: carouselItems.length)
      ],
    );
  }
}
