// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Delivery Location',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color.fromARGB(255, 227, 244, 228),
        ),
        body: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              color: Color.fromARGB(255, 240, 253, 241),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.location_on_outlined,
                                size: 30,
                              ),
                            ),
                            Text(
                              "Gift Receiver's Location",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ],
                        ),
                        Text(
                          "Check availability of gifts by sharing receiver's delivery location",
                          style: TextStyle(fontSize: 12),
                        ),
                        country_part(),
                        Location_box(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  height: 40,
                  color: Color.fromARGB(159, 83, 79, 3),
                  child: Center(
                      child: Text("Continue",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )))),
            ),
          ],
        ));
  }
}

class country_part extends StatelessWidget {
  country_part({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        height: 50,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SizedBox(
              child: DecoratedBox(
                //margin: EdgeInsets.all(0.0),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(7.0),
                    border: Border.all(color: Colors.grey)),
                child: ListTile(
                  dense: true,
                  visualDensity: VisualDensity.compact,
                  contentPadding: EdgeInsets.all(2.0),
                  leading: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      'assets/images/flag.png',
                    ),
                  ),
                  title: Text(
                    'India',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w200),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_down),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Location_box extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        height: 50,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SizedBox(
              child: DecoratedBox(
                //margin: EdgeInsets.all(0.0),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(7.0),
                    border: Border.all(color: Colors.black)),
                child: ListTile(
                  dense: true,
                  visualDensity: VisualDensity.compact,
                  contentPadding: EdgeInsets.all(4.0),
                  leading: Text(
                    '800003,Patna,Bihar',
                    style: TextStyle(fontSize: 15),
                  ),
                  trailing: Icon(Icons.close),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}