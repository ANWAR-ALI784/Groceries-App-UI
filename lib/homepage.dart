import 'package:flutter/material.dart';
class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Container(
        child: Center(child: Text("welcome to  fyp project")),
      ),
      drawer: Drawer(backgroundColor: Colors.deepPurple,),
    );
  }
}
