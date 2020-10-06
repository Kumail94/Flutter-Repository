import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/http_exception.dart';
import './product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
        id: '1001',
        title: 'Sute',
        description: 'Made in USA',
        price: 5000,
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR8Na5hugn3q9l0GtS8OW2PmFL90VPA8NYfTQ&usqp=CAU'),
    Product(
        id: '1002',
        title: 'Yellow Shirt',
        description: 'Made in UAE',
        price: 2500,
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRPJgHkd3PcMwE-3AOo5UlOXVhmotFg4SI9Ww&usqp=CAU'),
    Product(
        id: '1003',
        title: 'Jeans',
        description: 'Made in Thiland',
        price: 2000,
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ02CGQfcD29rruZ4gBFs6QLvRXbql7vzPaPA&usqp=CAU'),
    Product(
        id: '1004',
        title: 'Shalwar Kameez',
        description: 'Made in Pakistan',
        price: 3000,
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS2okeegYmymA7EbfL4a2ItG71qF8dxF3_aDw&usqp=CAU'),
  ];

  // var showFavoratesOnly = false;
  final String authToken;
  final String userId;
  Products(this.authToken, this.userId, this._items);

  List<Product> get items {
    // if (showFavoratesOnly) {
    //   return _items.where((element) => element.isFavourate).toList();
    // }
    return [..._items];
  }

  Future<void> fetechAndSetProducts([bool filterByUser = false]) async {
    final filterString =
        filterByUser ? 'orderBy="creatorId"&equalTo="$userId"' : '';
    var url =
        "https://shopapplication-a7ec0.firebaseio.com/productdata.json?auth=$authToken&$filterString";
    try {
      final response = await http.get(url);
      final extracedData = json.decode(response.body) as Map<String, dynamic>;
      if (extracedData == null) {
        return;
      }
      url =
          'https://shopapplication-a7ec0.firebaseio.com/userfavourite/$userId.json?auth=$authToken';
      final favourateResponse = await http.get(url);
      final favourateData = json.decode(favourateResponse.body);
      final List<Product> loadedProducts = [];
      extracedData.forEach(
        (productId, productData) {
          loadedProducts.add(Product(
            id: productId,
            title: productData['title'],
            description: productData['description'],
            price: productData['price'],
            isFavourate: favourateData == null
                ? false
                : favourateData[productId] ?? false,
            imageUrl: productData['imagUrl'],
          ));
        },
      );
      _items = loadedProducts;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<void> addProducts(Product product) async {
    final url =
        "https://shopapplication-a7ec0.firebaseio.com/productdata.json?auth=$authToken";
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'title': product.title,
          'description': product.description,
          'price': product.price,
          'imageUrl': product.imageUrl,
          'creatorId': userId,
        }),
      );
      final newProduct = Product(
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
        id: json.decode(response.body)['name'],
      );
      _items.add(newProduct);
      notifyListeners();
    } catch (error) {}
  }

  List<Product> get favItems {
    return _items.where((element) => element.isFavourate).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  // void addProducts(Product product) {
  //   final newProducts = Product(
  //     title: product.title,
  //     description: product.description,
  //     price: product.price,
  //     imageUrl: product.imageUrl,
  //     id: DateTime.now().toString(),
  //   );
  //   _items.add(newProducts);

  //   notifyListeners();
  // }

  Future<void> updateProducts(String id, Product newProduct) async {
    final productIndex = _items.indexWhere((element) => element.id == id);
    if (productIndex != null) {
      final url =
          "https://shopapplication-a7ec0.firebaseio.com/productdata/$id.json?auth=$authToken";
      await http.patch(url,
          body: json.encode({
            'title': newProduct.title,
            'description': newProduct.description,
            'price': newProduct.price,
            'imageUrl': newProduct.imageUrl
          }));
      _items[productIndex] = newProduct;
      notifyListeners();
    } else {
      print('There is no product in the list');
    }
  }

  Future<void> deleteProducts(String id) async {
    final url =
        'https://shopapplication-a7ec0.firebaseio.com/productdata/$id.json?auth=$authToken';
    final existingProductIndex =
        _items.indexWhere((element) => element.id == id);
    var existingProduct = _items[existingProductIndex];
    _items.removeAt(existingProductIndex);
    notifyListeners();
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      _items.insert(existingProductIndex, existingProduct);
      notifyListeners();
      throw HttpException('Could not delete a product!');
    }
    existingProduct = null;
  }

  // showFavourateOnly() {
  //   showFavoratesOnly = true;
  //   notifyListeners();
  // }

  // showAll() {
  //   showFavoratesOnly = false;
  //   notifyListeners();
  // }

}
