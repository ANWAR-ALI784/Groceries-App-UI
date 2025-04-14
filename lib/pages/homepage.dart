import 'package:catalogapp/utils/widgets/drawer.dart';
import 'package:flutter/material.dart';
class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  //widget is type of build function that return a widget
  // and build context is parameter
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(


        backgroundColor: Colors.green,


        title: const Text("Catalog App"),

      ),

      body: Container(
        child: const Center(child: Text("welcome to  fyp project")),
      ),
      drawer: const MyDrawer(),
    );
  }
}
