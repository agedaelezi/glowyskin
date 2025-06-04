import 'package:flutter/material.dart';
import '../widgets/product_grid.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Favorites'),
      ),
      body: ProductGrid(showFavorites: true),
    );
  }
} 