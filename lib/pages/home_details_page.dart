import 'package:catalogapp/pages/home_widget/cataloglist.dart';
import 'package:catalogapp/utils/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
import '../models/addtocart.dart';
import '../models/catalog.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailsPage({super.key, required this.catalog})
      : assert(catalog != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),

      bottomNavigationBar:   Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "\$${catalog.price}",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w500,fontSize: 28,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child:AddToCart(catalog: catalog)
          )
          
        ],
      ),
      body: SafeArea(top: true,

        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: ClipPath(
                clipper: ArcClipper(),
                child: Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 300,
                    color: Colors.blueAccent,
                    child: Image.network(
                      catalog.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              catalog.name,
             style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.secondary,),
            ),
            const SizedBox(height: 8),
            Text(
              catalog.desc,
              style: TextStyle(fontSize: 18,color: MyTheme.greyColor,)
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                loremIpsum(words: 40),style: TextStyle(color: MyTheme.greyColor),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

// 🎨 Arc Clipper
class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 30);
    path.quadraticBezierTo(
        size.width/2 , size.height, size.width, size.height -30);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}





