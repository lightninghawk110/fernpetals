
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fern_n_petals/viewmodel/like_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishlistEmpty extends StatelessWidget {
  WishlistEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavouriteProvider>(builder: (context, provider, child) {
        return Scaffold(
            appBar: AppBar(
              titleSpacing: 0,
              title: Text(
                "Favorites",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            body: provider.likedItems.isEmpty ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/empty_cart.png',
                    height: 200,
                    width: 200,
                  ),
                  Text(
                    " Let's Fill it up, shall we ",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ):FavouriteItems()
            
            
            
            );
      }
    );
  }
}

class FavouriteItems extends StatelessWidget {
  const FavouriteItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavouriteProvider>(builder: (context, provider, child) {
      return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: provider.likedItems.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 4,
            mainAxisExtent: 240),
        padding: EdgeInsets.all(8.0), // padding around the grid
        // total number of items
        itemBuilder: (context, index) {
          return Container(
              child: FavouriteItemBox(
            i: index,
          ));
        },
      );
    });
  }

}

class FavouriteItemBox extends StatelessWidget {
  FavouriteItemBox({super.key, required this.i});
var i = 0;
String url = "https://brotherstreat.infinitmindsdigital.com/";
final Image noImage = Image.asset(
    "assets/images/noimageplaceholder.png",
    height: 180,
    width: 180,
    fit: BoxFit.fill,
  );
  @override
  Widget build(BuildContext context) {
    return Consumer<FavouriteProvider>(
        builder: (context, favouriteprovider, child, {listen = true}) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10)),
            clipBehavior: Clip.hardEdge,
            child: CachedNetworkImage(
              height: 180,
              width: 180,
              fit: BoxFit.fill,
              imageUrl: url +
                  favouriteprovider.likedItems[i].fileUrl.toString(),
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(),
              errorWidget: (context, url, error) => noImage,
            ),
          ),
          Text(
            favouriteprovider.likedItems[i].title.toString(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            favouriteprovider.likedItems[i].features.length == 0
                ? "NOT AVAILABLE"
                : "₹${favouriteprovider.likedItems[i].features[0].onSalePrice.toString()}",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            "Earliest Delivery : Today",
            style: TextStyle(color: Colors.blue, fontSize: 12),
          ),
        ],
      );
    });
  }
}
  
