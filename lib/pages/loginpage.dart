import 'package:catalogapp/utils/routes.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  String Name = "";
  bool changeButton = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          child: Column(
            children: [
              Image.asset("assests/images/giftitem.png"),
              const SizedBox(
                height: 20,
              ),
              Text(
                "login page $Name",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.amber),
                textScaleFactor: 1.5,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "UserName",
                  hintText: " Enter Username",
                ),
                onChanged: (value){
                  Name=value;
                  setState(() {

                  });

                },
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
              InkWell(
                onTap: () async {
                  changeButton=true;
                  setState(()  {

                  });
                  await Future.delayed(Duration(seconds: 1));
                  Navigator.pushNamed(context, MyRoutes.homeRoute);
                },
                child: AnimatedContainer(duration: Duration(seconds: 1),
                  height:50,
                  width:  changeButton ? 50:150,
                  alignment: Alignment.center,

                  child:changeButton?Icon(Icons.done,color: Colors.white,) :Text("LogIn"),

                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(changeButton?50:8),

                    color: Colors.deepPurple
                  ),
                ),
              ),

              // ElevatedButton(
              //   onPressed: () {
              //     debugPrint("Login button pressed");
              //     Navigator.pushNamed(context, MyRoutes.homeRoute);
              //   },
              //   child: const Text("Login"),
              //   style: TextButton.styleFrom(
              //       foregroundColor: Colors.green,
              //       backgroundColor: Colors.amber,
              //       minimumSize: const Size(150, 40)),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
