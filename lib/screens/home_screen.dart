import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';
import '../widgets/app_drawer.dart';
import '../widgets/product_grid.dart';
import '../widgets/category_grid.dart';
import 'cart_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GLOWYSKIN'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => CartScreen()),
              );
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome to GLOWYSKIN',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Discover your perfect skincare routine',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            Container(
              height: 120,
              child: CategoryGrid(),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Featured Products',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Container(
              height: 400,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ProductGrid(showFavorites: false),
            ),
          ],
        ),
      ),
    );
  }
} 