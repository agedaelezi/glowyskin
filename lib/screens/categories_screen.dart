import 'package:flutter/material.dart';
import 'category_products_screen.dart';

class CategoriesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {
      'title': 'Skincare',
      'icon': Icons.face,
      'color': Colors.pink[100],
      'description': 'Find the perfect skincare routine for your skin type',
    },
    {
      'title': 'Hair Care',
      'icon': Icons.brush,
      'color': Colors.pink[200],
      'description': 'Discover products for healthy, beautiful hair',
    },
    {
      'title': 'Body Care',
      'icon': Icons.spa,
      'color': Colors.pink[300],
      'description': 'Pamper your body with luxurious care products',
    },
    {
      'title': 'Makeup',
      'icon': Icons.palette,
      'color': Colors.pink[400],
      'description': 'Enhance your natural beauty with our makeup collection',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: categories.length,
        itemBuilder: (ctx, i) => Card(
          elevation: 4,
          margin: EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => CategoryProductsScreen(
                    categoryTitle: categories[i]['title'],
                  ),
                ),
              );
            },
            leading: CircleAvatar(
              backgroundColor: categories[i]['color'],
              child: Icon(
                categories[i]['icon'],
                color: Colors.white,
              ),
            ),
            title: Text(
              categories[i]['title'],
              style: Theme.of(context).textTheme.titleLarge,
            ),
            subtitle: Text(categories[i]['description']),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ),
      ),
    );
  }
} 