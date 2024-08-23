import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class ImageSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200, // Adjust height as needed
      child: Swiper(
        itemBuilder: (context, index) {
          return Container(
            color: Colors.blue, // Replace with your product image or widget
          );
        },
        itemCount: 5, // Number of items
        autoplay: true,
        pagination: SwiperPagination(),
        control: SwiperControl(),
      ),
    );
  }
}
