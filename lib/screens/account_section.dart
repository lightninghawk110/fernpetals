import 'package:fern_n_petals/Routes/Route_Paths.dart';
import 'package:fern_n_petals/screens/item_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AccountSection extends StatelessWidget {
  const AccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        Image.asset(
          'assets/images/loginpageimg.png',
          height: 110,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color.fromARGB(255, 136, 134, 82),
            ),
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: TextButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(RoutePaths.login),
              child: Center(
                child: Text(
                  "Sign Up / Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ),
          ),
        ),
        FourSection(),
        Div(),
        ListTile(
          leading: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Icon(
                  Icons.wallet,
                  size: 20,
                ),
              )),
          title: Text(
            "fnpCash",
            style: TextStyle(fontSize: 12.0),
          ),
          trailing: Wrap(spacing: 12, children: <Widget>[
            newContainer(),
            Icon(Icons.keyboard_arrow_right)
          ]),
        ),
        Div(),
        EnquiriesUI(),
        Div(),
        BlankSpace(),
      ],
    ));
  }
}

class FourSection extends StatelessWidget {
  const FourSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                  width: 170,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.0),
                      border: Border.all(color: Colors.grey.shade400)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Icon(
                            Icons.card_giftcard,
                            size: 20,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Text("My Orders"),
                        )
                      ],
                    ),
                  )),
              Container(
                  width: 170,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.0),
                      border: Border.all(color: Colors.grey.shade400)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Icon(
                            Icons.alarm_add_outlined,
                            size: 20,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Text("Reminders"),
                        )
                      ],
                    ),
                  )),
            ],
          ),
          SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                  width: 170,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.0),
                      border: Border.all(color: Colors.grey.shade400)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Icon(
                            Icons.chat_outlined,
                            size: 20,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Text("Chat With Us"),
                        )
                      ],
                    ),
                  )),
              Container(
                  width: 170,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.0),
                      border: Border.all(color: Colors.grey.shade400)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: FaIcon(
                            FontAwesomeIcons.heart,
                            size: 20,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Text("Wishlist"),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

class EnquiriesUI extends StatelessWidget {
  const EnquiriesUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Enquiries",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.all(2.0),
              child: FaIcon(
                FontAwesomeIcons.birthdayCake,
                size: 20,
              ),
            ),
            title: Text(
              "Birthday/Wedding Decor",
              style: TextStyle(fontSize: 12.0),
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Icon(
                Icons.corporate_fare,
                size: 20,
              ),
            ),
            title: Text(
              "Corporate Gifts/Bulk Orders",
              style: TextStyle(fontSize: 12.0),
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Icon(
                Icons.house,
                size: 20,
              ),
            ),
            title: Text(
              "Become A Partner",
              style: TextStyle(fontSize: 12.0),
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Icon(
                Icons.wallet,
                size: 20,
              ),
            ),
            title: Text(
              "Start An FNP Franchise",
              style: TextStyle(fontSize: 12.0),
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Icon(
                Icons.share,
                size: 20,
              ),
            ),
            title: Text(
              "Share App Feedback",
              style: TextStyle(fontSize: 12.0),
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
        ],
      ),
    );
  }
}

class newContainer extends StatelessWidget {
  const newContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9.0, vertical: 5.0),
        child: Text(
          "New",
          style: TextStyle(
              fontSize: 13, color: Colors.white, fontWeight: FontWeight.w400),
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.topRight,
              colors: [
                Colors.red,
                Colors.yellow,
              ])),
    );
  }
}

class BlankSpace extends StatelessWidget {
  const BlankSpace({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextButton(
                onPressed: () {},
                child: Text(
                  "Contact Us",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.black),
                )),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Privacy Policy",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.black),
                )),
            TextButton(
              onPressed: () {},
              child: SizedBox(
                width: 90,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Log Out",
                      style:
                          TextStyle(color: Color.fromARGB(255, 136, 134, 82)),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Color.fromARGB(255, 136, 134, 82),
                    )
                  ],
                ),
              ),
            ),
            Text(
              "App Version 4.0.4",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
