import 'package:flutter/material.dart';

List<Map<String, String>> itemData = [
  {
    "name": "Sweet Memories Pink",
    "link": "assets/images/gifthamper_1.png",
  },
  {
    "name": "Love for PastelCarnation",
    "link": "assets/images/gifthamper_2.png",
  },
  {
    "name": "Sweet Avalanche Elegant",
    "link": "assets/images/gifthamper_3.png",
  },
  {
    "name": "Mixed Roses Romantic",
    "link": "assets/images/gifthamper_4.png",
  },
  {
    "name": "Royal Orchid & Daisy Embrace",
    "link": "assets/images/gifthamper_5.png",
  },
  {
    "name": "Personalized Gift Anniversary",
    "link": "assets/images/grid_personalized1.png",
  },
  {"name": "Pretty in Pink Cake", "link": "assets/images/grid_flower2.png"},
  {"name": "Lovely Gift Hampers", "link": "assets/images/grid_gift2.png"},
  {
    "name": "Anniversary Magic Photos",
    "link": "assets/images/grid_anniversary1.png"
  },
];

class item_list2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemData.length,
        itemBuilder: (context, index) {
          String? imageName = itemData[index]['name'];
          String? imageUrl = itemData[index]['link'];
          return Padding(
            padding: const EdgeInsets.all(6.0),
            child: SizedBox(
              width: 130,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    child: Card(
                      elevation: 0,
                      child: Image.asset(
                        imageUrl!,
                        height: 120,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Text(
                    imageName!,
                    style: TextStyle(fontSize: 15),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(' ₹1449', style: TextStyle(fontSize: 15)),
                ],
              ),
            ),
          );
        });
  }
}
