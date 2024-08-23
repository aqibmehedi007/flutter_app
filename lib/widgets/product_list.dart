import 'package:flutter/material.dart';

class ProductsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 10, // Placeholder count
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Product $index'),
              subtitle: Text('Product description $index'),
              leading: Icon(Icons.shopping_cart),
            );
          },
        ),
      ),
    );
  }
}
