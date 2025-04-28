import 'dart:convert';

import 'package:catalogapp/models/catalog.dart';
import 'package:catalogapp/utils/widgets/drawer.dart';
import 'package:catalogapp/utils/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

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
    final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final decodeData = jsonDecode(catalogJson);
    var productData = decodeData["products"];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.Bulish,
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
                Center(child: CircularProgressIndicator()),
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Catalog App",
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
        Text(
          "Trending Products",
          style: TextStyle(color: Colors.grey, fontSize: 20),
        )
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.items[index];
          return CatalogItem(catalog: catalog);
        });
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    // Custom caption style
    TextStyle captionStyle = GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.grey, // You can change this color as needed
    );

    return Container(
      height: 150,
      padding: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(color: Colors.white54, shape: BoxShape.rectangle),
      child: Card(
        color: Colors.white,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.3,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: MyTheme.Bulish,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(catalog.imageUrl),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    catalog.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: MyTheme.CreamColor),
                  ),
                  Text(
                    catalog.desc,
                    style: captionStyle, // Apply custom caption style here
                  ),
                  OverflowBar(


                    alignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\$${catalog.price}".toString()),
                      ElevatedButton(
                        autofocus: true,


                         style: ElevatedButton.styleFrom(
                           padding: EdgeInsets.symmetric(horizontal: 16),
                          backgroundColor: Colors.deepPurple, // Set the button background color
                        //   shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.zero, // Make the button rectangular
                        //   ),
                         ),
                        onPressed: () {
                          print("Button Pressed\ ${catalog.name}");
                        },
                        child: Text("Buy",style: TextStyle(color: Colors.white),),
                      ),
                    ],

                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
