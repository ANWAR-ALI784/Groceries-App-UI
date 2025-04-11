import 'package:flutter/material.dart';
class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(child: Text("login page",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.amber),textScaleFactor: 3.0,),
    ),
    );
  }
}
