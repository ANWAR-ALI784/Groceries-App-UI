import 'dart:convert';

import 'package:catalogapp/models/catalog.dart';
import 'package:catalogapp/utils/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/widgets/item_widget.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    // TODO: implement initState
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
    // print(CatalogModel.items);
    setState(() {});
  }

  @override

  //widget is type of build function that return a widget
  // and build context is parameter
  Widget build(BuildContext context) {
    // final dummyList=List.generate(20, (index)=>CatalogModel.items[index % CatalogModel.items.length]);
    //final dummyList = CatalogModel.items;

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.green,

        title: const Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
            ?
            // ? ListView.builder(
            //     itemCount: CatalogModel.items.length, //CatalogModel.items
            //     itemBuilder: (context, index) {
            //       return ItemWidget(
            //           item: CatalogModel.items[index]); //CatalogModel.items
            //     },
            //   )
            GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final item = CatalogModel.items[index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: GridTile(
                        header: Text(item.name),
                          footer: Text(item.price.toString()),
                          child: Image.network(item.imageUrl)));
                },
                itemCount: CatalogModel.items.length,
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
