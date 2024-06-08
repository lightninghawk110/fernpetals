import 'package:flutter/material.dart';

class DeliveryPage extends StatelessWidget {
  const DeliveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delivery Details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: Image.asset(
                'assets/images/deliverypage_img.png',
                height: 50,
                width: 200,
                fit: BoxFit.contain,
              ),

              
            ),
          ],
        ),
      ),
    );
  }
}
