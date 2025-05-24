import 'package:flutter/material.dart';
import 'cart.dart';
import 'catalog.dart';

class Mystore extends ChangeNotifier {
  late CatalogModel _catalog;
  late CartModel _cart;

  Mystore() {
    _catalog = CatalogModel();
    _cart = CartModel();
    _cart.catalog = _catalog;
  }
  // get method
  CatalogModel get catalog => _catalog;
  CartModel get cart => _cart;

  void addItemToCart(Item item) {
    _cart.addItem(item);
    notifyListeners();
  }

  void removeItemFromCart(Item item) {
    _cart.removeItem(item);
    notifyListeners();
  }
}
