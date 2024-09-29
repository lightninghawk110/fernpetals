import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CarouselDemo(),
    );
  }
}

class CarouselDemo extends StatefulWidget {
  @override
  _CarouselDemoState createState() => _CarouselDemoState();
}

class _CarouselDemoState extends State<CarouselDemo> {
  int activeIndex = 0;
  final List<String> imageUrls = [
    'https://via.placeholder.com/800x400.png?text=Image+1',
    'https://via.placeholder.com/800x400.png?text=Image+2',
    'https://via.placeholder.com/800x400.png?text=Image+3',
    'https://via.placeholder.com/800x400.png?text=Image+4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Carousel Demo')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider.builder(
            itemCount: imageUrls.length,
            itemBuilder: (context, index, realIndex) {
              return Image.network(
                imageUrls[index],
                width: double.infinity,
                height: 100,
                fit: BoxFit.cover,
              );
            },
            options: CarouselOptions(
              height: 100,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 4),
              onPageChanged: (index, reason) {
                setState(() {
                  activeIndex = index;
                });
              },
            ),
          ),
          SizedBox(height: 16),
          AnimatedSmoothIndicator(
            activeIndex: activeIndex,
            count: imageUrls.length,
            effect: ScrollingDotsEffect(
              activeDotColor: Colors.white,
              dotColor: Colors.grey,
              dotHeight: 10,
              dotWidth: 10,
              activeDotScale: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
