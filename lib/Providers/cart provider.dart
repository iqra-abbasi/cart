import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/cart model.dart';

class Cartproviders with ChangeNotifier {

  int count = 0;


  List<ProductList> products;
  Cartproviders(this.products); // Constructor


  void Increment(int index) {

        // Increment the count for the product at the specified index
        products[index].number++;
        notifyListeners();

  }

  void Decrement(int index) {
        // Decrement the count for the product at the specified index
        products[index].number--;
        notifyListeners();

  }


  int calculateSubtotal() {
    int subtotal = 0;
    for (var product in products) {
      subtotal += product.number * product.initialPrice;
    }
    return subtotal;
  }


}


