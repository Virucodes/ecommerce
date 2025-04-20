import 'dart:convert';
import 'package:ecommerce/models/cartItem.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:isar/isar.dart';
import '../models/product.dart';

class Shop extends ChangeNotifier {
  late Isar _isar;

  List<Product> _shop = [];
  List<Product> _cart = [];
  


  bool _isLoading = true;
  bool get isLoading => _isLoading;

  List<Product> get shop => _shop;
  List<Product> get cart => _cart;

  Shop() {
    _initIsar();
  }

  Future<void> _initIsar() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar =
        await Isar.open([ProductSchema, CartItemSchema], directory: dir.path);
    await loadProductsFromLocal();
    await loadCartFromDB();
    await fetchProducts();
  }

  Future<void> loadProductsFromLocal() async {
    _isLoading = true;
    notifyListeners();

    _shop = await _isar.products.where().findAll();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> updateProduct(Product updatedProduct, int index) async {
  if (index >= 0 && index < _shop.length) {
    _shop[index] = updatedProduct;

    await _isar.writeTxn(() async {
      await _isar.products.put(updatedProduct);
    });

    notifyListeners();
  }
}


  Future<void> addNewProduct(Product product) async {
  _shop.add(product);

  await _isar.writeTxn(() async {
    await _isar.products.put(product);
  });

  notifyListeners();
}


  Future<void> fetchProducts() async {
    final url = Uri.parse('https://fakestoreapi.com/products');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        final products = data
            .map((item) => Product.create(
                  name: item['title'],
                  price: double.tryParse(item['price'].toString()) ?? 0.0,
                  description: item['description'],
                  image: item['image'],
                  category: item['category'],
                ))
            .toList();

        // Update Isar products only (not cart)
        await _isar.writeTxn(() async {
          await _isar.products.clear();
          await _isar.products.putAll(products);
        });

        _shop = products;
        notifyListeners();
      } else {
        print('Failed to fetch products: ${response.statusCode}');
      }
    } catch (e) {
      print('API Error: $e');
    }
  }

  Future<void> loadCartFromDB() async {
    final cartItems = await _isar.cartItems.where().findAll();
    _cart = cartItems.map((e) => e.toProduct()).toList();
    notifyListeners();
  }

  Future<void> addToCart(Product item) async {
    _cart.add(item);
    await _isar.writeTxn(() => _isar.cartItems.put(CartItem.fromProduct(item)));
    notifyListeners();
  }

  Future<void> removeFromCart(Product item) async {
    _cart.removeWhere((product) => product.name == item.name);
    final items =
        await _isar.cartItems.filter().nameEqualTo(item.name).findAll();
    await _isar.writeTxn(() async {
      for (var i in items) {
        await _isar.cartItems.delete(i.id);
      }
    });
    notifyListeners();
  }
}
