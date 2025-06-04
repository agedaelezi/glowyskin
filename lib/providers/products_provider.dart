import 'package:flutter/foundation.dart';
import '../models/product.dart';

class ProductsProvider with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      name: 'Hydrating Face Cream',
      description: 'A lightweight, fast-absorbing face cream that provides 24-hour hydration.',
      price: 29.99,
      imageUrl: 'assets/images/face_cream.jpg',
      category: 'Skincare',
    ),
    Product(
      id: 'p2', 
      name: 'Nourishing Shampoo',
      description: 'Gentle cleansing shampoo enriched with natural oils for healthy hair.',
      price: 24.99,
      imageUrl: 'assets/images/shampoo.jpg',
      category: 'Hair Care',
    ),
    Product(
      id: 'p3',
      name: 'Vitamin C Serum',
      description: 'Brightening serum that helps fade dark spots and improve skin texture.',
      price: 34.99,
      imageUrl: 'assets/images/serum.jpg',
      category: 'Skincare',
    ),
    Product(
      id: 'p4',
      name: 'Hair Conditioner',
      description: 'Deep conditioning treatment that repairs and strengthens damaged hair.',
      price: 22.99,
      imageUrl: 'assets/images/conditioner.jpg',
      category: 'Hair Care',
    ),
    Product(
      id: 'p5',
      name: 'Body Lotion',
      description: 'Rich moisturizing lotion with shea butter for all-day hydration.',
      price: 19.99,
      imageUrl: 'assets/images/body_lotion.jpg',
      category: 'Body Care',
    ),
    Product(
      id: 'p6',
      name: 'Facial Toner',
      description: 'Alcohol-free toner that balances skin pH and removes impurities.',
      price: 18.99,
      imageUrl: 'assets/images/toner.jpg',
      category: 'Skincare',
    ),
    Product(
      id: 'p7',
      name: 'Hair Oil',
      description: 'Nourishing oil blend that tames frizz and adds shine to hair.',
      price: 27.99,
      imageUrl: 'assets/images/hair_oil.jpg',
      category: 'Hair Care',
    ),
    Product(
      id: 'p8',
      name: 'Body Scrub',
      description: 'Exfoliating scrub with natural ingredients for smooth, glowing skin.',
      price: 23.99,
      imageUrl: 'assets/images/body_scrub.jpg',
      category: 'Body Care',
    ),
  ];

  List<Product> get items => [..._items];
  
  List<Product> get favorites => _items.where((item) => item.isFavorite).toList();

  List<Product> getProductsByCategory(String category) {
    return _items.where((product) => product.category == category).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((product) => product.id == id);
  }

  void toggleFavorite(String productId) {
    final product = findById(productId);
    product.toggleFavorite();
    notifyListeners();
  }

  List<Product> searchProducts(String query) {
    return _items.where((product) => 
      product.name.toLowerCase().contains(query.toLowerCase()) ||
      product.description.toLowerCase().contains(query.toLowerCase())
    ).toList();
  }
} 