import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/category_provider.dart';

class CategoryList extends StatelessWidget {
  final String baseImageUrl;

  CategoryList({required this.baseImageUrl});

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, provider, child) {
        final categories = provider.categories;

        return Container(
          height: 150, // Adjust height as needed
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              final imgUrl = category.imgUrl;
              final name = category.name;

              // Construct full image URL
              final fullImageUrl = imgUrl != null
                  ? '$baseImageUrl$imgUrl'
                  : 'https://via.placeholder.com/150'; // Placeholder image if no URL

              return Container(
                width: 100,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      imgUrl != null
                          ? Image.network(
                        fullImageUrl,
                        width: 80,
                        height: 80,
                      )
                          : Container(
                        width: 80,
                        height: 80,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 8),
                      Text(name),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
