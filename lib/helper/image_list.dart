import 'package:flutter/material.dart';

class ImageBox extends StatelessWidget {
  ImageBox({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
        // margin: EdgeInsets.all(7.0),
        clipBehavior: Clip.antiAlias,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ));
  }
}
