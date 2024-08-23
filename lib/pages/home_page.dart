import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/category_provider.dart';
import '../provider/upcoming_product_provider.dart';
import '../widgets/image_slider.dart';
import '../widgets/product_list.dart';
import '../widgets/category_list.dart';


class HomePage extends StatelessWidget {
  final String baseImageUrl = 'https://devapi.xalorith.com'; // Replace with your base image URL

  @override
  Widget build(BuildContext context) {
    // Call loadCategories and loadUpcomingProducts when HomePage is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CategoryProvider>(context, listen: false).loadCategories();
      Provider.of<UpcomingProductProvider>(context, listen: false).loadUpcomingProducts();
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('HOME'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Handle menu button press
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search Bar
          SearchBar(),
          // Product Slider
          ImageSlider(),
          // Category List
          CategoryList(baseImageUrl: baseImageUrl),
          // Products List
          ProductsList(),
        ],
      ),
    );
  }
}
