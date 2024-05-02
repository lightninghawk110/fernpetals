// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
// import 'package:share_plus/share_plus.dart';

import 'package:fern_n_petals/Routes/Route_Paths.dart';
import 'package:fern_n_petals/helper/Tailored_Items.dart';
import 'package:fern_n_petals/helper/Tailored_Items2.dart';
import 'package:fern_n_petals/helper/appbar2.dart';
import 'package:fern_n_petals/helper/carousel.dart';
import 'package:fern_n_petals/models/grid_argument.dart';
import 'package:fern_n_petals/viewmodel/cart_provider.dart';

class ItemPage extends StatelessWidget {
  final pageimage;
  final pagename;
  final double pageprice;

  ItemPage({super.key, this.pageimage, this.pagename, required this.pageprice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar2(),
        body: Stack(
          children: [
            ListView(
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
                OfferAvailableSection(),
                Div(),
                CustomerReviewSection(),
                Div(),
                Grid1(),
                Grid2(),
              ],
            ),
            Positioned(
                bottom: 0,
                child: ItemPageButton(
                  cart_item_image: pageimage,
                  cart_item_name: pagename,
                  cart_item_price: pageprice,
                )),
          ],
        ));
  }
}

class ItemPrice extends StatelessWidget {
  final String imagelink;
  final double itemprice;
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
          Stack(children: [
            CarouselItem(
              pagelink: imagelink,
            ),
            Positioned(
                bottom: 30,
                right: 60,
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.2),
                      border: Border.all(color: Colors.grey.shade500)),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: FaIcon(
                      FontAwesomeIcons.heart,
                      color: Colors.black,
                      size: 15,
                    ),
                  ),
                )),
            Positioned(
                bottom: 70,
                right: 60,
                child: InkWell(
                  onTap: () {
                    // _shareText('Checkout this product $itemname at Fern N Petals');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.2),
                        border: Border.all(color: Colors.grey.shade500)),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FaIcon(
                        FontAwesomeIcons.shareNodes,
                        color: Colors.black,
                        size: 15,
                      ),
                    ),
                  ),
                ))
          ]),
          ItemText(
            itemname: itemname,
            itemprice: itemprice.toString(),
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
            '₹' + itemprice,
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

  final _currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final dates = [];
    for (int i = 0; i < 3; i++) {
      final date = _currentDate.add(Duration(days: i));
      dates.add(date);
    }
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
                        width: 130,
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
                                DateFormat.d().format(dates[index]).toString() +
                                    DateFormat.LLL()
                                        .format(dates[index])
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
                //height: 180,
                child: Column(
                  children: [
                    Card(
                      elevation: 0,
                      child: SingleChildScrollView(
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
                                //maxLines: 4,
                                "If you're looking for random paragraphs, you've come to the right place. When a random word or a random sentence isn't quite enough, the next logical step is to find a random paragraph. We created the Random Paragraph Generator with you in mind. The process is quite simple. Choose the number of random paragraphs you'd like to see and click the button. Your chosen number of paragraphs will instantly appear.")
                          ],
                        ),
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
                        children: [
                          Text(
                              //maxLines: 4,
                              "\u2022 Keep soil consistently moist, watering deeply once or twice a week." +
                                  "\n" +
                                  "\u2022 Place in full sunlight, providing at least six hours of direct sun daily." +
                                  "\n" +
                                  "\u2022 Prune regularly to remove dead/diseased stems and encourage new growth." +
                                  "\n" +
                                  "\u2022 Use a Clean Vase and Water")
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
                        leading: Icon(Icons.delivery_dining_outlined),
                        title: Text("Delivery Information"),
                        trailing: Icon(Icons.add),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text("\u2022 Choose from standard, express, or same-day delivery options for your rose purchase." +
                                "\n" +
                                "\u2022 Receive real-time tracking updates to monitor the delivery status of your roses from the florist to your doorstep." +
                                "\n" +
                                "\u2022 Image Displayed is Indicative in Nature" +
                                "\n" +
                                "\u2022 Select your preferred delivery date to ensure your roses arrive exactly when you need them." +
                                "\n" +
                                "\u2022 Receive instant notifications regarding order confirmation, dispatch, and delivery of your roses." +
                                "\n" +
                                "\u2022  Add specific delivery instructions such as 'leave at the door' or 'deliver to the receptionist' to ensure smooth delivery of your roses."),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ])));
  }
}

class OfferAvailableSection extends StatelessWidget {
  String t = "\u2022 Applicable only for New Users, on their 1st Transaction" +
      "\n" +
      "\u2022 Code required to avail the discound : APP20" +
      "\n" +
      "\u2022 Users will get Flat 20% off on a minimum cart value of Rs. 1999" +
      "\n" +
      "\u2022 Maximum amount of discount that can be availed by discount is Rs. 500" +
      "\n" +
      "\u2022 Offer can be avalied once per user" +
      "\n" +
      "\u2022 Offer not applicable on International Products";

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 110,
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Offer(s) Available",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 80,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.all(12.0),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          width: 450,

                          // height: 60,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 252, 239, 240),
                              border: Border.all(
                                  style: BorderStyle.solid,
                                  color: Color.fromARGB(255, 249, 172, 172)),
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Image.asset(
                                'assets/images/app20.jpeg',
                                width: 80,
                                height: 50,
                              ),
                              Text("Get 20% Off* on 1st Order, Code:APP20"),
                              InkWell(
                                onTap: () {
                                  // adding some properties
                                  showModalBottomSheet(
                                      context: context,
                                      backgroundColor: Colors.white,
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      builder: (BuildContext context) {
                                        return Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                "Terms & Conditions",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                              Text(
                                                t,
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ],
                                          ),
                                        );
                                      });
                                },
                                child: Text(
                                  "*T&C",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          width: 450,
                          // height: 60,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 239, 239, 252),
                              border: Border.all(
                                  style: BorderStyle.solid,
                                  color: Color.fromARGB(255, 177, 172, 249)),
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Image.asset(
                                'assets/images/mobikwik.jpeg',
                                width: 80,
                                height: 50,
                              ),
                              Text("Mobikwik - Get upto 15% cashback"),
                              InkWell(
                                onTap: () {
                                  // adding some properties
                                  showModalBottomSheet(
                                      context: context,
                                      backgroundColor: Colors.white,
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      builder: (BuildContext context) {
                                        return Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                "Terms & Conditions",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                              Text(
                                                t,
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ],
                                          ),
                                        );
                                      });
                                },
                                child: Text(
                                  "*T&C",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          width: 450,
                          // height: 60,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 252, 239, 240),
                              border: Border.all(
                                  style: BorderStyle.solid,
                                  color: Color.fromARGB(255, 249, 172, 172)),
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Image.asset(
                                'assets/images/airtelpayment.jpeg',
                                width: 80,
                                height: 50,
                              ),
                              Text(
                                  "Airtel Payment bank - Flat 10% off up to Rs.200"),
                              InkWell(
                                onTap: () {
                                  // adding some properties
                                  showModalBottomSheet(
                                      context: context,
                                      backgroundColor: Colors.white,
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      builder: (BuildContext context) {
                                        return Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                "Terms & Conditions",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                              Text(
                                                t,
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ],
                                          ),
                                        );
                                      });
                                },
                                child: Text(
                                  "*T&C",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
        ));
  }
}

class CustomerReviewSection extends StatelessWidget {
  const CustomerReviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 200,
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Customer Reviews",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 170,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            color: Colors.white,
                            elevation: 2,
                            child: Container(
                              padding: EdgeInsets.only(right: 80),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        CircleAvatar(
                                          backgroundColor: Colors.blueGrey,
                                          child: Center(
                                            child: Text(
                                              "P",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    size: 15,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    size: 15,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    size: 15,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    size: 15,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    size: 15,
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "Prakash Thakur \u2022  a day ago",
                                                style: TextStyle(fontSize: 10),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Text("Good"),
                                    SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.shade300,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          3.0)),
                                              child: Text("Ocassion:birthday"),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.shade300,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          3.0)),
                                              child: Text("City:Agra"),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ]),
        ));
  }
}

class Grid1 extends StatelessWidget {
  const Grid1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "You May Also Like",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 190, child: item_list()),
            ]));
  }
}

class Grid2 extends StatelessWidget {
  const Grid2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "What Others Are Viewing",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 190, child: item_list2()),
            ]));
  }
}

class ItemPageButton extends StatelessWidget {
  ItemPageButton(
      {super.key,
      required this.cart_item_image,
      required this.cart_item_name,
      required this.cart_item_price});

  final cart_item_image;
  final cart_item_name;
  final cart_item_price;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 60,
      width: 390,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Consumer<CartProvider>(builder: (context, value, child) {
            return TextButton(
                onPressed: () => {
                      value.addToCart(GridArguments(
                          cart_item_name, cart_item_image, cart_item_price))
                    },
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                          color: Color.fromARGB(255, 130, 139, 121))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.shopping_cart_outlined,
                        color: Color.fromARGB(255, 130, 139, 121),
                      ),
                      Text(
                        "Add To Cart",
                        style: TextStyle(
                            color: Color.fromARGB(255, 130, 139, 121)),
                      )
                    ],
                  ),
                ));
          }),
          TextButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(RoutePaths.cartpg_empty),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Color.fromARGB(255, 108, 117, 99),
                ),
                height: 50,
                width: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.shopping_cart_checkout_outlined,
                      color: Colors.white,
                    ),
                    Text(
                      "Gift Now",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

// void _shareText(String text) {
//   Share.share(text);
// }
