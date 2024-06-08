// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fern_n_petals/Routes/Route_Paths.dart';
import 'package:fern_n_petals/viewmodel/product_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final searchvalue = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 224, 224, 204),
      ),
      body: SingleChildScrollView(
        child: Consumer<ProductProvider>(builder: (context, provider, child) {
          return Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 12.0),
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color.fromARGB(255, 212, 212, 212).withOpacity(.2)),
                child: TextField(
                    controller: searchvalue,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            provider.search(
                                provider.originalproduct!.data, searchvalue.text);
                          },
                        ),
                        hintText: "What are you looking for?",
                        border: InputBorder.none,
                        iconColor: Colors.brown)),
              ),
              SearchList(searchValue: searchvalue.text)
            ],
          );
        }),
      ),
    );
  }
}

class SearchList extends StatelessWidget {
  String searchValue;
  SearchList({
    Key? key,
    required this.searchValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, provider, child) {
      return searchValue=="" ? SizedBox(height: 0,): GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: provider.product?.data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 4,
            mainAxisExtent: 240),
        padding: EdgeInsets.all(8.0),
        itemBuilder: (context, index) {
          return Container(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () => Navigator.of(context).pushNamed(
                    RoutePaths.ProductPage,
                    arguments: provider.product?.data[index]),
              child: SearchItemBox(
                searchValue: searchValue,
                i: index,
              ),
            ),
          ));
        },
      );
    });
  }
}

class SearchItemBox extends StatelessWidget {
  final String searchValue;
  SearchItemBox({super.key, required this.i, required this.searchValue});
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
    return Consumer<ProductProvider>(
        builder: (context, provider, child, {listen = true}) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            clipBehavior: Clip.hardEdge,
            child: CachedNetworkImage(
              height: 180,
              width: 180,
              fit: BoxFit.fill,
              imageUrl: url + provider.product!.data[i].fileUrl.toString(),
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
            provider.product!.data[i].title.toString(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            provider.product!.data[i].features.isEmpty
                ? "NOT AVAILABLE"
                : "₹${provider.product!.data[i].features[0].onSalePrice.toString()}",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      );
    });
  }
}
