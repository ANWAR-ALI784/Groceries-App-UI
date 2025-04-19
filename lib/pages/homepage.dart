import 'package:catalogapp/models/catalog.dart';
import 'package:catalogapp/utils/widgets/drawer.dart';
import 'package:flutter/material.dart';

import '../utils/widgets/item_widget.dart';
class Homepage extends StatelessWidget {
  const Homepage({super.key});


  @override
  //widget is type of build function that return a widget
  // and build context is parameter
  Widget build(BuildContext context) {
    final dummyList=List.generate(20, (index)=>CatalogModel.items[index % CatalogModel.items.length]);
    //final dummyList = CatalogModel.items;

    return Scaffold(
      appBar: AppBar(


        // backgroundColor: Colors.green,


        title: const Text("Catalog App"),

      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(itemCount: dummyList.length, //CatalogModel.items
        itemBuilder: (context,index){
          return ItemWidget(item:dummyList[index]); //CatalogModel.items
        },),
      ),
      drawer: const MyDrawer(),
    );
  }
}
