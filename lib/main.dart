import 'package:catalogapp/pages/homepage.dart';
import 'package:catalogapp/pages/loginpage.dart';
import 'package:catalogapp/utils/routes.dart';
import 'package:catalogapp/utils/widgets/theme.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: true,
      // home: //const Homepage(),
     themeMode:ThemeMode.light,
     theme: MyTheme.LightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: "/home",
      routes: {
        // "/":(context ) => const Loginpage(),
        // "/login":(context) => const Loginpage(), best practise is this
        MyRoutes.loginRoute:(context)=> const Loginpage(),
        MyRoutes.homeRoute:(context)=> const Homepage(),
      },
    );
  }
}
