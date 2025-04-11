import 'package:flutter/material.dart';
class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assests/images/giftitem.png"),
            SizedBox(height: 20,),
              Text("login page",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.amber),textScaleFactor: 3.0,),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "UserName",
                hintText: " Enter Username",
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "passowrd",
                hintText: " Enter password",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: (){

              print("hiiii");
            },
                child: const Text("Login"),

            style: TextButton.styleFrom(foregroundColor: Colors.green,backgroundColor: Colors.amber),

            ),







          ],
        ),
      ),
    );
  }
}
