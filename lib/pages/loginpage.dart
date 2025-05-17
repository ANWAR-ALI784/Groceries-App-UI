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
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(// for validation
            key: _forKey,
            child: Column(
              children: [
                Image.asset("assets/images/giftitem.png",fit:BoxFit.cover ,),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Login Page $Name",
                  style:  TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.secondary),
                  textScaleFactor: 1.5,
                ),
                TextFormField(
                  style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                  decoration:  InputDecoration(
                    labelText: "UserName",
                    labelStyle: TextStyle(color: Theme.of(context).canvasColor),
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
                  style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                  obscureText: true,
                  decoration:  InputDecoration(
                    labelText: "password",
                    hintText: " Enter password",
                    labelStyle: TextStyle(color: Theme.of(context).canvasColor),
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
                        : Text("LogIn",style: TextStyle(color:Theme.of(context).colorScheme.secondary ),),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(changeButton ? 50 : 8),
                        color: Theme.of(context).floatingActionButtonTheme.backgroundColor,
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
      ),
    );
  }
}
