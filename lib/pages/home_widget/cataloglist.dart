import 'package:catalogapp/pages/home_details_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/catalog.dart';
import '../../utils/widgets/theme.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.items[index];
          return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeDetailsPage(catalog: catalog),
                  ),
                );
              },
              child: CatalogItem(catalog: catalog));
        });
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: 10, horizontal: 4), // spacing between items
      padding: EdgeInsets.all(12), // inner spacing
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor, // same as background
        borderRadius: BorderRadius.circular(15),
        // border: Border.all(
        //   color: Colors.white30, // light border for separation
        //   width: 1,
        // ),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.05),
        //     blurRadius: 6,
        //     offset: Offset(0, 3),
        //   ),
        //],
      ),
      child: Row(
        children: [
          // Image section
          Container(
            width: MediaQuery.of(context).size.width * 0.25,
            height: 90,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(
                catalog.imageUrl,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(width: 16),
          // Text + button section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  catalog.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  catalog.desc,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${catalog.price}",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    ElevatedButton(
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
                        print("Buy pressed for ${catalog.name}");
                      },
                      child: Text(
                        "Add to Cart",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
