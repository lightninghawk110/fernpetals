
import 'package:fern_n_petals/helper/image_list.dart';
import 'package:fern_n_petals/helper/customdot2.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselItem extends StatefulWidget {
  CarouselItem({super.key});

  @override
  State<CarouselItem> createState() => _CarouselState();
}

class _CarouselState extends State<CarouselItem> {
  int currentIndex = 0;
  final List img = [
    'assets/images/gifthamper_1.png',
    'assets/images/gifthamper_1.png',
    'assets/images/gifthamper_1.png',
    'assets/images/gifthamper_1.png',
  ];
  List<Widget> carouselItems = [
    ImageBox(image: 'assets/images/gifthamper_1.png'),
    ImageBox(image: 'assets/images/gifthamper_1.png'),
    ImageBox(image: 'assets/images/gifthamper_1.png'),
    ImageBox(image: 'assets/images/gifthamper_1.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 290,
            child: CarouselSlider(
              items: carouselItems,
              options: CarouselOptions(
                height: 300,
                viewportFraction: 1,
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
          CustomDot2(dotIndex: currentIndex, dotLength: carouselItems.length),
        ],
      ),
    );
  }
}
