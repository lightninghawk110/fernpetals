import 'package:fern_n_petals/models/grid_argument.dart';
import 'package:fern_n_petals/screens/item_page.dart';
import 'package:fern_n_petals/viewmodel/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: Text(
            "My Cart",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        body: Stack(children: [
          ListView(children: <Widget>[
            SizedBox(
              height: 50,
              child: Image.asset(
                'assets/images/cart_status.png',
                height: 50,
                width: 200,
                fit: BoxFit.contain,
              ),
            ),
            Consumer<CartProvider>(builder: (context, value, child) {
              return SizedBox(
                height: 500,
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemCount: value.cartItems.length,
                  itemBuilder: (context, index) => CartItemCard(
                    i: index,
                    item_name: value.cartItems[index].item.name,
                    item_image: value.cartItems[index].item.imagelink,
                    item_price: value.cartItems[index].item.price,
                  ),
                  separatorBuilder: (BuildContext context, int index) {
                    return Div();
                  },
                ),
              );
            }),
            PriceDetails(),
          ]),
          Positioned(bottom: 0, child: CartButton())
        ]));
  }
}

class CartItemCard extends StatelessWidget {
  final String item_name;
  final String item_image;
  final String item_price;
  final int i;

  const CartItemCard(
      {super.key,
      required this.i,
      required this.item_name,
      required this.item_image,
      required this.item_price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            border: Border.all(color: Color.fromARGB(255, 85, 99, 66)),
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                    Color.fromARGB(255, 201, 217, 179),
                    Color.fromARGB(255, 251, 252, 250)
                  ])),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Icon(Icons.location_on_outlined),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "Patna, Bihar",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(
                      item_image,
                      height: 100,
                      width: 100,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            item_name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            item_price,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                border: Border.all(color: Colors.grey)),
                            width: 90,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Consumer<CartProvider>(
                                      builder: (context, value, child) {
                                    if (value.cartItems[i].quantity <= 1) {
                                      return InkWell(
                                        onTap: () {
                                          value.deleteToCart(i);
                                        },
                                        child: Icon(
                                          Icons.delete_outline,
                                          color: Color.fromARGB(
                                              255, 154, 173, 127),
                                        ),
                                      );
                                    } else {
                                      return InkWell(
                                        onTap: () {
                                          value.reduce(GridArguments(item_name,
                                              item_image, item_price));
                                        },
                                        child: Icon(
                                          Icons.remove,
                                          color: Color.fromARGB(
                                              255, 154, 173, 127),
                                        ),
                                      );
                                    }
                                  }),
                                  Consumer<CartProvider>(
                                      builder: (context, value, child) {
                                    return Text(
                                      value.cartItems[i].quantity.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                              255, 154, 173, 127)),
                                    );
                                  }),
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color:
                                            Color.fromARGB(255, 201, 217, 179),
                                      ),
                                      child: Consumer<CartProvider>(
                                          builder: (context, value, child) {
                                        return InkWell(
                                          onTap: () {
                                            value.addToCart(GridArguments(
                                                item_name,
                                                item_image,
                                                item_price));
                                          },
                                          child: Icon(
                                            Icons.add,
                                            color: Color.fromARGB(
                                                255, 154, 173, 127),
                                          ),
                                        );
                                      }),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.date_range,
                        size: 18,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                          "6th May, 09:00 am - 09:00 pm" + '\n' + "Courier ₹49")
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PriceDetails extends StatelessWidget {
  bool val = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.card_giftcard_outlined),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "fnpCash",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("Remaining Balance: ₹ 0"),
                      ],
                    ),
                  ],
                ),
                Checkbox(value: val, onChanged: (value) => {}),
              ],
            ),
            Text(
              "Price Details",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Total Product Price",
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 13),
                ),
                Text("₹2174")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Delivery Charges",
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 13),
                ),
                Text(
                  "₹249",
                  style: TextStyle(color: Colors.green),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Convenience Charge",
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 13),
                ),
                Text("₹59")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Final Amount",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Text(
                  "₹2174",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Color.fromARGB(255, 130, 139, 121),
        ),
        height: 60,
        width: 390,
        child: TextButton(
          onPressed: () {},
          child: Center(
            child: Text(
              "Proceed",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
