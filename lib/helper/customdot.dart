import 'package:flutter/material.dart';

class CustomDot extends StatelessWidget {
  final int dotIndex;
  final int dotLength;

  CustomDot({required this.dotIndex, required this.dotLength});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(
            dotLength,
            (index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: Container(
                  width: 50,
                  height: 30,
                  decoration: BoxDecoration(
                      color: index == dotIndex ? Colors.black : Colors.black38,
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Text(
                    '${index + 1}/${dotLength}',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ); 
            },
          )),
    );
  }
}
