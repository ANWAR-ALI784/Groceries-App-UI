import 'package:catalogapp/utils/widgets/theme.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Center(child: Text("Cart",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
      ),
    );
  }
}
