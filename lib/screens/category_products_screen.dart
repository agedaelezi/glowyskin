import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';
import '../widgets/product_item.dart';

class CategoryProductsScreen extends StatelessWidget {
  final String categoryTitle;

  CategoryProductsScreen({required this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context);
    final categoryProducts = productsData.getProductsByCategory(categoryTitle);

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: categoryProducts.isEmpty
          ? Center(
              child: Text('No products found in this category.'),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: categoryProducts.length,
              itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                value: categoryProducts[i],
                child: ProductItem(),
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 3 / 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
            ),
    );
  }
}