import 'package:flutter/material.dart';

class MessageCardPage extends StatelessWidget {
  const MessageCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Free Message Card',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
        ),
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              padding: EdgeInsets.all(10),
              //margin: EdgeInsets.all(10),
              color: Color.fromARGB(255, 236, 241, 232),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      SelectOccassion(),
                      giftcard(),
                      BodySection(),
                      CheckingBox()
                    ],
                  ),
                ],
              ),
            ),
            Positioned(bottom: 10, child: ButtonBar()),
          ],
        ));
  }
}

class SelectOccassion extends StatelessWidget {
  const SelectOccassion({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
          width: 350,
          height: 150,
          decoration: BoxDecoration(
              border:
                  Border.all(color: const Color.fromARGB(255, 219, 218, 218)),
              borderRadius: BorderRadius.circular(10),
              color: Colors.white),
          child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Select Occassion",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  RoundedBox(),
                ],
              ))),
    );
  }
}

class RoundedBox extends StatelessWidget {
  List l = [
    'Birthday',
    "Anniversary",
    "Love and Romance",
    "Congratulations",
    "More"
  ];

  RoundedBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      // width: 200,
      child: GridView.builder(
        //scrollDirection: Axis.horizontal,
        itemCount: l.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(
                  color: Colors.grey.shade300,
                  width: 2.0,
                ),
              ),
              child: Center(
                child: Text(
                  l[index],
                  style: TextStyle(fontSize: 12.0, color: Colors.grey.shade700),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          );
        },
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 1.0,
            childAspectRatio: 3),
      ),
    );
  }
}

class BodySection extends StatelessWidget {
  const BodySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 350,
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 219, 218, 218)),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IntrinsicHeight(
                child: TextField(
                    maxLines: 1,
                    decoration: InputDecoration(
                        hintText: "Dear",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IntrinsicHeight(
                child: TextField(
                    maxLines: 4,
                    decoration: InputDecoration(
                        hintText: "Message",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IntrinsicHeight(
                child: TextField(
                    maxLines: 1,
                    decoration: InputDecoration(
                        hintText: "From",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ))),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class giftcard extends StatelessWidget {
  const giftcard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 350,
        height: 70,
        decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 219, 218, 218)),
            borderRadius: BorderRadius.circular(10),
            color: Colors.white),
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              child: DecoratedBox(
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
                    'Select Message Template',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w200),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
              ),
            )),
      ),
    );
  }
}

class CheckingBox extends StatelessWidget {
  bool val = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Color.fromARGB(255, 202, 242, 173),
        ),
        width: 340,
        child: Row(
          children: <Widget>[
            Checkbox(
              value: val,
              onChanged: (value) => {},
            ),
            Text("Don't show my name on the card")
          ],
        ),
      ),
    );
  }
}

class ButtonBar extends StatelessWidget {
  const ButtonBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 60,
      width: 390,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ElevatedButton(
              onPressed: () => {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.camera,
                    color: Color.fromARGB(255, 130, 139, 121),
                  ),
                  Text(
                    "Preview",
                    style: TextStyle(color: Color.fromARGB(255, 130, 139, 121)),
                  )
                ],
              )),
          ElevatedButton(
              onPressed: () => {},
              child: Center(
                  child: Text("Continue",
                      style: TextStyle(
                          color: Color.fromARGB(255, 130, 139, 121)))))
        ],
      ),
    );
  }
}
