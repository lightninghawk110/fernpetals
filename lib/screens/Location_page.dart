// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors

import 'package:fern_n_petals/helper/pincodeSuggestion.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fern_n_petals/viewmodel/location_provider.dart';

class LocationPage extends StatefulWidget {
  LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  double Latitude = 0.0;
  double Longitude = 0.0;
  String Address = "";

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
        body: ListView(
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
                        Location_box(
                          address: Address,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Consumer<LocationProvider>(
                builder: (context, provider, child, {listen = true}) {
              return InkWell(
                onTap: () async {
                  await provider.getPosition();
                  await provider.getAddressFromLatLng(
                      provider.currentPosition!.latitude,
                      provider.currentPosition!.longitude);

                  setState(() {
                    Latitude = provider.currentPosition!.latitude;
                    Longitude = provider.currentPosition!.longitude;
                    Address = provider.currentAddress!;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Get Current Location?",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.black),
                      )),
                ),
              );
            }),
            Consumer<LocationProvider>(
                builder: (context, provider, child, {listen = true}) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
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
              );
            }),
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
  String address = "";

  Location_box({
    Key? key,
    required this.address,
  }) : super(key: key);
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
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(7.0),
                    border: Border.all(color: Colors.black)),
                child: InkWell(
                  child: Consumer<LocationProvider>(
                      builder: (context, provider, child) {
                    return ListTile(
                      dense: true,
                      visualDensity: VisualDensity.compact,
                      contentPadding: EdgeInsets.all(4.0),
                      leading: SizedBox(
                          width: 230,
                          child: provider.getCurrLocation
                              ? TextFormField(
                                  decoration: InputDecoration(
                                      hintStyle: TextStyle(color: Colors.black),
                                      enabled: address == "" ? true : false,
                                      hintText: address == ""
                                          ? "Enter Delivery Information"
                                          : address,
                                      border: InputBorder.none),
                                )
                              : PincodeSuggestionBox()),
                    );
                  }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
