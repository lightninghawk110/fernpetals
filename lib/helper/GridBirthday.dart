import 'package:flutter/material.dart';

class BdGrid extends StatelessWidget {
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
  BdGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
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
