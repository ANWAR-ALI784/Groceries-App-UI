import 'package:flutter/material.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(


      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
          accountName: Text("anwar"),
        accountEmail: Text("anwraali39@gmaiol.com"),
        currentAccountPicture: CircleAvatar(
          backgroundImage: NetworkImage("https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=600")
        ),
            ),
            ListTile(
              onTap:(){},
              leading: Icon(Icons.home,color: Colors.white,),
              title: Text("Home",style: TextStyle(color: Colors.white),),
            ),
            const ListTile(
              leading: Icon(Icons.person,color: Colors.white,),
              title: Text("Account",style: TextStyle(color: Colors.white),),
            ),
            const ListTile(
              leading: Icon(Icons.settings,color: Colors.white,),
              title: Text("Settings",style: TextStyle(color: Colors.white),),
            ),


          ],

        ),
      ),

    );
  }
}
