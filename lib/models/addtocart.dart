import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart.dart';
import 'catalog.dart';
import 'catalog-provider.dart'; // For Mystore

class AddToCart extends StatelessWidget {
  final Item catalog;

  const AddToCart({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    final store=context.watch<Mystore>();
    final cart= store.cart;

    bool isInCart = cart.items.contains(catalog);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context)
            .floatingActionButtonTheme
            .backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      onPressed: () {
        if (!isInCart) {
          store.addItemToCart(catalog);

        }
      },
      child: isInCart
          ? const Icon(Icons.done)
          : const Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
