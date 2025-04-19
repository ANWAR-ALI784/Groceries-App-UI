class Item {
  final int id;
  final String name;
  final String desc;
  final String color;
  final String image;
  final num price;

  Item({
    required this.id,
    required this.name,
    required this.desc,
    required this.color,
    required this.image,
    required this.price,
  });
}
//object class
class CatalogModel {
  static final List<Item> items = [
    Item(
      id: 1,
      name: "Mobile",
      desc: "This is a good mobile phone.",
      price: 999,
      color: "Red",
      image: "https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=600",
    ),
    Item(
      id: 2,
      name: "Headphones",
      desc: "Noise cancelling headphones.",
      price: 199,
      color: "Black",
      image: "https://images.pexels.com/photos/3394663/pexels-photo-3394663.jpeg?auto=compress&cs=tinysrgb&w=600",
    ),
    Item(
      id: 3,
      name: "Smart Watch",
      desc: "Water-resistant smartwatch.",
      price: 149,
      color: "Blue",
      image: "https://images.pexels.com/photos/267394/pexels-photo-267394.jpeg?auto=compress&cs=tinysrgb&w=600",
    ),
    Item(
      id: 4,
      name: "Laptop",
      desc: "High-performance laptop.",
      price: 1299,
      color: "Silver",
      image: "https://images.pexels.com/photos/18105/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=600",
    ),
    Item(
      id: 5,
      name: "Camera",
      desc: "DSLR camera for photography.",
      price: 799,
      color: "Black",
      image: "https://images.pexels.com/photos/51383/camera-lens-digital-camera-slr-camera-51383.jpeg?auto=compress&cs=tinysrgb&w=600",
    ),
  ];
}
