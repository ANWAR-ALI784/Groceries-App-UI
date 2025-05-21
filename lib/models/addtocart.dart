import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cart.dart';
import 'catalog.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;

  const AddToCart({super.key, required this.catalog});


  @override
  State<AddToCart> createState() => AddToCartState();
}

class AddToCartState extends State<AddToCart> {
  final _cart=CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart=_cart.items.contains(widget.catalog) ?? false;
    return ElevatedButton(

      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context)
            .floatingActionButtonTheme
            .backgroundColor,
        // foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      onPressed: () {
        if(!isInCart) {
          isInCart = true;
          final _catalog = CatalogModel();
          // set the cart
          _cart.catalog = _catalog;
          _cart.addItem(widget.catalog);
          print("pressed ");

          setState(() {

          });
        }
        //print("Buy pressed for ${catalog.name}");
      },
      child: isInCart? Icon(Icons.done):
      Icon(CupertinoIcons.cart_badge_plus)
    );
  }
}