class Item {
  final int id;
  final String name;
  final String desc;
  final String color;
  final String imageUrl;
  final num price;

  Item({
    required this.id,
    required this.name,
    required this.desc,
    required this.color,
    required this.imageUrl,
    required this.price,
  });
  //decode data from map to json
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
        id: map["id"],
        name: map["name"],
        desc: map["desc"],
        color: map["color"],
        imageUrl: map["imageUrl"],
        price: map["price"]);
  }
  // endcode data to map
  toMap() {
    return {
      "id": id,
      "name": name,
      "desc": desc,
      "color": color,
      "imageUrl": imageUrl,
      "price": price
    };
  }
}

//object class
class CatalogModel {
  static List<Item> items = [
    // Item(
    //   id: 1,
    //   name: "Mobile",
    //   desc: "This is a good mobile phone.",
    //   price: 999,
    //   color: "Red",
    //   imageUrl: "https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=600",
    // ),
    // Item(
    //   id: 2,
    //   name: "Headphones",
    //   desc: "Noise cancelling headphones.",
    //   price: 199,
    //   color: "Black",
    //   imageUrl: "https://images.pexels.com/photos/3394663/pexels-photo-3394663.jpeg?auto=compress&cs=tinysrgb&w=600",
    // ),
  ];
  // get item by ID method
   Item getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);
// get item by ID method
  Item getByPosition(int pos)=>items[pos];
}
