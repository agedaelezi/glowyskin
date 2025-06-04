import 'package:flutter/material.dart';
import '../screens/category_products_screen.dart';

class CategoryGrid extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {
      'title': 'Skincare',
      'icon': Icons.face,
      'color': Colors.pink[100],
    },
    {
      'title': 'Hair Care',
      'icon': Icons.brush,
      'color': Colors.pink[200],
    },
    {
      'title': 'Body Care',
      'icon': Icons.spa,
      'color': Colors.pink[300],
    },
    {
      'title': 'Makeup',
      'icon': Icons.palette,
      'color': Colors.pink[400],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (ctx, i) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => CategoryProductsScreen(
                  categoryTitle: categories[i]['title'],
                ),
              ),
            );
          },
          child: Container(
            width: 100,
            decoration: BoxDecoration(
              color: categories[i]['color'],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  categories[i]['icon'],
                  size: 40,
                  color: Colors.white,
                ),
                SizedBox(height: 8),
                Text(
                  categories[i]['title'],
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 