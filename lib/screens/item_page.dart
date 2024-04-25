// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:fern_n_petals/Routes/Route_Paths.dart';
import 'package:fern_n_petals/helper/appbar2.dart';
import 'package:fern_n_petals/helper/carousel.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class ItemPage extends StatelessWidget {
  final pageimage;
  final pagename;
  final pageprice;

  ItemPage({super.key, this.pageimage, this.pagename, this.pageprice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar2(),
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            ItemPrice(
              imagelink: pageimage,
              itemname: pagename,
              itemprice: pageprice,
            ),
            Div(),
            receiver_part(),
            Div(),
            DateSelect(),
            Div(),
            message_part(),
            Div(),
            AboutProduct(),
            Div(),
          ],
        ));
  }
}

class ItemPrice extends StatelessWidget {
  final String imagelink;
  final String itemprice;
  final String itemname;

  const ItemPrice(
      {super.key,
      required this.imagelink,
      required this.itemprice,
      required this.itemname});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 410,
      child: ListView(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CarouselItem(
            pagelink: imagelink,
          ),
          ItemText(
            itemname: itemname,
            itemprice: itemprice,
          )
        ],
      ),
    );
  }
}

class ItemText extends StatelessWidget {
  final String itemname;
  final String itemprice;

  const ItemText({super.key, required this.itemname, required this.itemprice});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(itemname, style: TextStyle(fontSize: 18)),
          Text(
            itemprice,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          InkWell(
            splashFactory: NoSplash.splashFactory,
            onTap: () {
              // adding some properties
              showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.white,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Price Details",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Maximum Retail Price",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "₹2849",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Text(
                              "(Inclusive of all taxes)",
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            },
            child: Row(
              children: [
                Text(
                  "Price inclusive of all taxes",
                  style: TextStyle(
                    fontSize: 11,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  size: 15,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Div extends StatelessWidget {
  const Div({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 10,
      thickness: 3,
      color: Colors.grey.shade200,
    );
  }
}

class receiver_part extends StatelessWidget {
  receiver_part({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(RoutePaths.Loc),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          height: 90,
          width: 120,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                "Gift Receiver's Location",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
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
                    contentPadding: EdgeInsets.all(4.0),
                    leading: Icon(
                      Icons.location_on_outlined,
                      color: Color.fromARGB(255, 130, 139, 121),
                      size: 24,
                    ),
                    title: Text(
                      '800003,Patna, Bihar',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DateSelect extends StatelessWidget {
  List<String> item = ['Today', 'Tomorrow', 'Later'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: SizedBox(
        height: 130,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Select a Date",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        // width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0),
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 2.0,
                          ),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                item[index],
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade700),
                              ),
                              Text(
                                DateFormat.d()
                                        .format(DateTime.now())
                                        .toString() +
                                    DateFormat.LLL()
                                        .format(DateTime.now())
                                        .toString(),
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey.shade600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class message_part extends StatelessWidget {
  message_part({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(RoutePaths.FreeMessageCard),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          height: 90,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                "Add Message",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
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
                    contentPadding: EdgeInsets.all(4.0),
                    leading: Icon(
                      Icons.card_giftcard,
                      color: Color.fromARGB(255, 130, 139, 121),
                      size: 24,
                    ),
                    title: Text(
                      'Add Free Message Card',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w200),
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AboutProduct extends StatelessWidget {
  List<String> items = [
    "Product Description",
    "Care Instructions",
    "Delivery Information"
  ];
  AboutProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: SizedBox(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                Text(
                  "About the product",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 180,
                  child: Column(
                    children: [
                      Card(
                        elevation: 0,
                        child: ExpansionTile(
                          dense: true,
                          visualDensity: VisualDensity.compact,
                          collapsedBackgroundColor:
                              Colors.grey.shade100.withOpacity(0.6),
                          leading: Icon(Icons.notes),
                          title: Text("Product Description"),
                          trailing: Icon(Icons.add),
                          children: [
                            Text(
                                maxLines: 4,
                                "If you're looking for random paragraphs, you've come to the right place. When a random word or a random sentence isn't quite enough, the next logical step is to find a random paragraph. We created the Random Paragraph Generator with you in mind. The process is quite simple. Choose the number of random paragraphs you'd like to see and click the button. Your chosen number of paragraphs will instantly appear.")
                          ],
                        ),
                      ),
                      Card(
                        elevation: 0,
                        child: ExpansionTile(
                          dense: true,
                          visualDensity: VisualDensity.compact,
                          collapsedBackgroundColor:
                              Colors.grey.shade100.withOpacity(0.6),
                          leading: Icon(Icons.integration_instructions),
                          title: Text("Care Instructions"),
                          trailing: Icon(Icons.add),
                        ),
                      ),
                      Card(
                        elevation: 0,
                        child: ExpansionTile(
                          dense: true,
                          visualDensity: VisualDensity.compact,
                          collapsedBackgroundColor:
                              Colors.grey.shade100.withOpacity(0.6),
                          leading: Icon(Icons.delivery_dining_outlined),
                          title: Text("Delivery Information"),
                          trailing: Icon(Icons.add),
                        ),
                      ),
                    ],
                  ),
                )
              ])),
        ));
  }
}
