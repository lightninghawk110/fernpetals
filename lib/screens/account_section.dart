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
              color: Color.fromARGB(255, 103, 111, 94),
            ),
            height: 60,
            width: 390,
            child: TextButton(
              onPressed: () {},
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
                ),
              )),
          title: Text(
            "fnpCash",
            style: TextStyle(fontSize: 12.0),
          ),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
        Div(),
        EnquiriesUI(),
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
                          child: Icon(Icons.card_giftcard),
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
                          child: Icon(Icons.card_giftcard),
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
                          child: Icon(Icons.card_giftcard),
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
                          child: Icon(Icons.card_giftcard),
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
