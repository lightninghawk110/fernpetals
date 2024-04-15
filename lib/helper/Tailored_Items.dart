import 'package:flutter/material.dart';

class TailoredItem extends StatelessWidget {
  const TailoredItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Color.fromARGB(255, 242, 246, 234)),
                  height: 100,
                  width: 90,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Icon(Icons.cake_outlined),
                        Padding(
                          padding: EdgeInsets.only(top: 9),
                          child: Text('Birthday'),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white),
                height: 80,
                width: 130,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Icon(Icons.heart_broken_sharp),
                      Padding(
                        padding: EdgeInsets.only(top: 9),
                        child: Text('Love N Romance'),
                      ),
                    ],
                  ),
                ),
              ),
        
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white),
                height: 80,
                width: 100,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Icon(Icons.key),
                      Padding(
                        padding: EdgeInsets.only(top: 9),
                        child: Text('Anniversary'),
                      ),
                    ],
                  ),
                ),
              ),
        
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white),
                height: 80,
                width: 130,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Icon(Icons.handshake),
                      Padding(
                        padding: EdgeInsets.only(top: 9),
                        child: Text('Congratulations'),
                      ),
                    ],
                  ),
                ),
              ),
        
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white),
                height: 80,
                width: 90,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Icon(Icons.thumb_up_sharp),
                      Padding(
                        padding: EdgeInsets.only(top: 9),
                        child: Text('Thank You'),
                      ),
                    ],
                  ),
                ),
              ),
        
        ],
            );
  }
}