import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductList {
  String image;
  String productName;
  int initialPrice;
  String decrement;
  String increment;
  int number; // Added number field to track quantity

  ProductList({
    required this.image,
    required this.initialPrice,
    required this.productName,
    required this.decrement,
    required this.increment,
    this.number = 0, // Default number to zero
  });
}
