import 'package:flutter/material.dart';

class AllGiftsSection extends StatelessWidget {
  const AllGiftsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Gifts"),
      ),
      body: Center(child: Text("Body Section")),
    );
  }
}
