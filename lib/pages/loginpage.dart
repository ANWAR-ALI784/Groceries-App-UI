import 'package:catalogapp/utils/routes.dart';
import 'package:flutter/material.dart';
class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 32),
          child: Column(
            children: [
              Image.asset("assests/images/giftitem.png"),
              const SizedBox(height: 20,),
                const Text("login page",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.amber),textScaleFactor: 2.0,),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "UserName",
                  hintText: " Enter Username",
                ),
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(

                  labelText: "passowrd",
                  hintText: " Enter password",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: (){

    debugPrint("Login button pressed");
    Navigator.pushNamed(context, MyRoutes.homeRoute);
    },

    child: const Text("Login"),

              style: TextButton.styleFrom(foregroundColor: Colors.green,backgroundColor: Colors.amber,minimumSize: const Size(150, 40)),

              ),







            ],
          ),
        ),
      ),
    );
  }
}
