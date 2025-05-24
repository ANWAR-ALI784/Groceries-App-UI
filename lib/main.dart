import 'package:catalogapp/models/catalog-provider.dart';
import 'package:catalogapp/pages/cart_page.dart';
import 'package:catalogapp/pages/homepage.dart';
import 'package:catalogapp/pages/loginpage.dart';
import 'package:catalogapp/utils/routes.dart';
import 'package:catalogapp/utils/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>Mystore())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system, // 🌙 Adapts to system theme
        theme: MyTheme.LightTheme(context),
        darkTheme: MyTheme.darkTheme(context),
        initialRoute: MyRoutes.homeRoute, // change to loginRoute if needed
        routes: {
          MyRoutes.loginRoute: (context) => const Loginpage(),
          MyRoutes.homeRoute: (context) => const Homepage(),
          MyRoutes.CartPage: (context) => const CartPage(),
        },
      ),
    );
  }
}
