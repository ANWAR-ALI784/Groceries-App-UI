import 'package:catalogapp/models/catalog.dart';

class CartModel{
  // singleton class which create only time its object and we use it
  static final catModel=CartModel._internal();
  CartModel._internal();
  factory CartModel()=>catModel; // shows the item on added cart page

 // field catalog
  late CatalogModel _catalog;
  // list of ids on item
  final List<int>_itemsid=[];
  //GET METHOD
  CatalogModel get catalog => _catalog;
  //SET METHOD
  set catalog(CatalogModel newcatalog) {
    assert(newcatalog != null);
    _catalog = newcatalog;
  }
  // get item to cart
  List<Item> get items => _itemsid.map((id)=>_catalog.getById(id)).toList();
  // this methods calculate total price
  num get totalPrice =>
      items.fold(0,(total, current)=>total + current.price);
  // to add item
void addItem(item){
  _itemsid.add(item.id);
}
// item.id becuase we want get this by its id
// to remove item from
void removeItem(item){
  _itemsid.remove(item.id);
}


}