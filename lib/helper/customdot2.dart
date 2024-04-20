import 'package:flutter/material.dart';

class CustomDot2 extends StatefulWidget {
  final int dotIndex;
  final int dotLength;

  CustomDot2({required this.dotIndex, required this.dotLength});

  @override
  State<CustomDot2> createState() => _CustomDotState();
}

class _CustomDotState extends State<CustomDot2> {
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(widget.dotLength, (index) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
                height: 7,
                width: 7,
                decoration: BoxDecoration(
                    color:
                        index != widget.dotIndex ? Colors.grey : Colors.black,
                    borderRadius: BorderRadius.circular(5))),
          );
        }));
  }
}
