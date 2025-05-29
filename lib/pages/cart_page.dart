import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/catalog-provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Center(
            child: Text(
          "Cart",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(padding: EdgeInsets.all(32), child: _CartList())),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Mystore>().cart;

    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "\$${cart.totalPrice}",
            style: TextStyle(
              fontSize: 20,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          SizedBox(width: 100),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
              Theme.of(context).floatingActionButtonTheme.backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Buying not supported yet")),
              );
            },
            child: Text(
              "Buy",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}




class _CartList extends StatelessWidget {
  const _CartList({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.watch<Mystore>();
    final cart = store.cart;

    return cart.items.isEmpty
        ? Center(
      child: Text(
        "Nothing TO sHOW",
        style: TextStyle(fontSize: 20),
      ),
    )
        : ListView.builder(
      itemCount: cart.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: Icon(Icons.remove_circle),
        onTap: () {
          // to remove item
          store.removeItemFromCart(cart.items[index]);
        },
        title: Text("\$${cart.items[index].name}"),
      ),
    );
  }
}




