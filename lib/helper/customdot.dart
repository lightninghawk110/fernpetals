import 'package:flutter/material.dart';

class CustomDot extends StatefulWidget {
  final int dotIndex;
  final int dotLength;

  CustomDot(
      {required this.dotIndex, required this.dotLength});

  @override
  State<CustomDot> createState() => _CustomDotState();
}

class _CustomDotState extends State<CustomDot> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(widget.dotLength, (index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: index != widget.dotIndex
                  ? Container(
                      width: index == widget.dotIndex-1 || index == widget.dotIndex+1 ? 8.0 : index+1.toDouble(),
                      height: index == widget.dotIndex-1 || index == widget.dotIndex+1 ? 8.0 : index+1.toDouble(),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black38,
                      ))
                  : Container(
                      width: 24,
                      height: 15,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Text('${index + 1}/${widget.dotLength}',
                            style:
                                TextStyle(color: Colors.white, fontSize: 10)),
                      ),
                    ),
            );
          })),
    );
  }
}
