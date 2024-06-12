import 'dart:math';

import 'package:fern_n_petals/Routes/Route_Paths.dart';
import 'package:fern_n_petals/screens/itemsearch_page.dart';
import 'package:fern_n_petals/screens/search_page.dart';
import 'package:fern_n_petals/viewmodel/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemList extends StatelessWidget {
  int i = Random().nextInt(180);
  ItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, provider, child) {
      return FutureBuilder(
          future: Provider.of<ProductProvider>(context, listen: false)
              .shuffleData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: 9,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 130,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: InkWell(
                          onTap: () => Navigator.of(context).pushNamed(
                              RoutePaths.ProductPage,
                              arguments: provider.product?.data[index]),
                          child: SearchItemBox(
                            imageheight: 120,
                            imagewidth: 120,
                            searchValue: "",
                            i: Random().nextInt(180),
                          ),
                        ),
                      ),
                    );
                  });
            }
          });
    });
  }
}
