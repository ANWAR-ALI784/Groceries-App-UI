import 'package:catalogapp/utils/widgets/theme.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Center(
            child: Text(
          "Cart",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
      ),
      body: Column(
        children: [
          Expanded(
              child:
                  Padding(padding: EdgeInsets.all(32),
                      child: _CartList())),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}
class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          Text("\$9999",style: TextStyle(fontSize: 20,color: Theme.of(context).colorScheme.secondary),),
           SizedBox(width: 100,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).floatingActionButtonTheme.backgroundColor,
              // foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Buying not supported yet")),
              );

            },
            child: Text(
              "Add to Cart",
              style: TextStyle(color: Colors.white,fontSize: 12),
            ),
          ),

        ],
      ),
    );
  }
}class _CartList extends StatefulWidget {
  const _CartList({super.key});

  @override
  State<_CartList> createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: 5,
      itemBuilder: (context,index)=>ListTile(leading: Icon(Icons.done),trailing: Icon(Icons.remove_circle),title: Text("Item 1"),),);
  }
}


