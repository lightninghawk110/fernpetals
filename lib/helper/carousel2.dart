import 'package:fern_n_petals/helper/image_list.dart';
import 'package:fern_n_petals/helper/customdot2.dart';
import 'package:fern_n_petals/helper/image_list2.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselItem2 extends StatefulWidget {
  final pagelink;

  const CarouselItem2({super.key,  required this.pagelink});

  @override
  State<CarouselItem2> createState() => _CarouselState();
}

class _CarouselState extends State<CarouselItem2> {
  int currentIndex = 0;
  // List<Widget> carouselItems = [
  //   ImageBox(image: 'assets/images/gifthamper_1.png'),
  //   ImageBox(image: 'assets/images/gifthamper_1.png'),
  //   ImageBox(image: 'assets/images/gifthamper_1.png'),
  //   ImageBox(image: 'assets/images/gifthamper_1.png'),
  // ];

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
              items:
                  List.generate(5, (index) => ImageBox2(image: widget.pagelink)),
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
          CustomDot2(dotIndex: currentIndex, dotLength: 5),
        ],
      ),
    );
  }
}
