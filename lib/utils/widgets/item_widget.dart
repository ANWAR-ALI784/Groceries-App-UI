import 'package:flutter/material.dart';

import '../../models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({super.key, required this.item}) : assert(item != null);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.red,
      elevation: 0.0,
      color: Colors.lightGreen,
      borderOnForeground: true,
      child: ListTile(
        onTap: () {
          print("${item.name} pressed");
        },
        leading: SizedBox(
            height: 40, width: 40, child: Image.network(item.imageUrl)),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$${item.price}",
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.deepPurple),
        ),
      ),
    );
  }
}
