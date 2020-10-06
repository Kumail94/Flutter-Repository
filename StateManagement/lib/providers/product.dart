import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavourate;

  Product(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.price,
      @required this.imageUrl,
      this.isFavourate = false});

  void _setFarValue(bool newValue) {
    isFavourate = newValue;
    notifyListeners();
  }

  Future<void> toggleFavorateScreen(String token, String userId) async {
    final oldStatus = isFavourate;
    this.isFavourate = !this.isFavourate;
    notifyListeners();
    final url =
        'https://shopapplication-a7ec0.firebaseio.com/userfavourite/$userId/$id.json?auth=$token';
    try {
      final response = await http.patch(
        url,
        body: json.encode({'isFavourate': isFavourate}),
      );
      if (response.statusCode >= 400) {
        _setFarValue(oldStatus);
      }
    } catch (error) {
      _setFarValue(oldStatus);
    }
  }
}
