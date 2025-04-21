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
  final _forKey=GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_forKey.currentState?.validate() ?? false) {
      setState(() {
        changeButton = true;
      });

      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);

      setState(() {
        changeButton = false;
      });
    }
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          child: Form(
            key: _forKey,
            child: Column(
              children: [
                Image.asset("assets/images/giftitem.png"),
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter your name";
                      }
                      return null;
                    },

                  onChanged: (value) {
                    Name = value;
                    setState(() {});
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "passowrd",
                    hintText: " Enter password",
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "password is must";

                    }
                   else if (value.length<8){
                      return "at least 8 character is must";
                    }
                    else
                      value=null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () => moveToHome(context),

                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    height: 50,
                    width: changeButton ? 50 : 150,
                    alignment: Alignment.center,
                    child: changeButton
                        ? Icon(
                            Icons.done,
                            color: Colors.white,
                          )
                        : Text("LogIn"),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(changeButton ? 50 : 8),
                        color: Colors.deepPurple),
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
      ),
    );
  }
}
