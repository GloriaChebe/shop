import 'package:flutter/material.dart';
import 'package:shoppy/models/product.dart'; // Import the Product class

class CartProvider with ChangeNotifier {
  List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;

  void addToCart(Product product) {
    _cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cartItems.remove(product);
    notifyListeners();
  }

  double get totalPrice {
    return _cartItems.fold(0.0, (total, current) => total + current.price);
  }
}
