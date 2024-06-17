import 'package:cached_network_image/cached_network_image.dart';
import 'package:fern_n_petals/Routes/Route_Paths.dart';
import 'package:fern_n_petals/viewmodel/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SearchItemBoxShuffled extends StatefulWidget {
  final int i;

  SearchItemBoxShuffled({super.key, required this.i});

  @override
  State<SearchItemBoxShuffled> createState() => _SearchItemBoxShuffledState();
}

class _SearchItemBoxShuffledState extends State<SearchItemBoxShuffled> {
  String url = "https://brotherstreat.infinitmindsdigital.com/";

  final Image noImage = Image.asset(
    "assets/images/noimageplaceholder.png",
    height: 180,
    width: 180,
    fit: BoxFit.fill,
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, provider, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            clipBehavior: Clip.hardEdge,
            child: CachedNetworkImage(
              height: 120,
              width: 120,
              fit: BoxFit.fill,
              imageUrl: url +
                  provider.shuffledProduct!.data[widget.i].fileUrl.toString(),
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  SizedBox(
                      height: 10,
                      width: 10,
                      child: Center(
                          child: CircularProgressIndicator(
                        color: Color.fromARGB(255, 247, 247, 219),
                      ))),
              errorWidget: (context, url, error) => noImage,
            ),
          ),
          Text(
            provider.shuffledProduct!.data[widget.i].title.toString(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            provider.shuffledProduct!.data[widget.i].features.isEmpty
                ? "NOT AVAILABLE"
                : "₹${provider.shuffledProduct!.data[widget.i].features[0].onSalePrice.toString()}",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      );
    });
  }
}

class ItemList extends StatelessWidget {
  var val = 0;
  ItemList({super.key, required this.val});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future:
          Provider.of<ProductProvider>(context, listen: false).shuffleData(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else {
          return Consumer<ProductProvider>(builder: (context, provider, child) {
            return ListView.builder(
              itemCount: 9,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                int adjustedIndex =
                    index + val; // Adjust the index to start from 10
                return Container(
                  width: 130,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () => Navigator.of(context).pushNamed(
                        RoutePaths.ProductPage,
                        arguments:
                            provider.shuffledProduct?.data[adjustedIndex],
                      ),
                      child: SearchItemBoxShuffled(
                        i: adjustedIndex,
                      ),
                    ),
                  ),
                );
              },
            );
          });
        }
      },
    );
  }
}
