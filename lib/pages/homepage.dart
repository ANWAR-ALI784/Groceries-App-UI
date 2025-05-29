import 'dart:convert';
import 'package:badges/badges.dart' as badges;

import 'package:catalogapp/models/catalog.dart';
import 'package:catalogapp/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../models/catalog-provider.dart';
import 'home_widget/catalogeader.dart';
import 'home_widget/cataloglist.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodeData = jsonDecode(catalogJson);
    var productData = decodeData["products"];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return

// Inside your Scaffold
    Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      floatingActionButton: Builder(
        builder: (context) {
          final store = context.watch<Mystore>();
          final cart = store.cart;

          return badges.Badge(
            position: badges.BadgePosition.topEnd(top: -8, end: -8),
            badgeContent: Text(
              '${cart.items.length}', // ✅ Dynamic cart item count
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            badgeStyle: badges.BadgeStyle(
              badgeColor: Colors.red,
              padding: EdgeInsets.all(6),
            ),
            child: FloatingActionButton(
              onPressed: () => Navigator.pushNamed(context, MyRoutes.CartPage),
              backgroundColor: Theme.of(context)
                  .floatingActionButtonTheme
                  .backgroundColor,
              child: Icon(
                CupertinoIcons.cart,
                color: Colors.white,
                size: 30,
              ),
            ),
          );
        },
      ),





      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                Expanded(child: CatalogList())
              else
                Expanded(child: Center(child: CircularProgressIndicator())),
            ],
          ),
        ),
      ),
    );
  }
}
