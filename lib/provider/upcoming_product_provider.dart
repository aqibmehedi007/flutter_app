import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../pojo/upcoming_product.dart';

class UpcomingProductProvider with ChangeNotifier {
  List<Product> _upcomingProducts = [];

  List<Product> get upcomingProducts => _upcomingProducts;

  Future<void> loadUpcomingProducts() async {
    final String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyTmFtZSI6IkFJVFNfREVWIiwiZW1haWwiOiJpbmZvQGFpdHNnZW5lc2lzLmNvbSIsInVzZXJJZCI6ImViYjA1MTNiLWI5ZTYtNDQ3ZC05ZGZhLWQ0MzQ3ZTAzN2U4NCIsInBob3RvVXJsIjoiIiwiaXNNdWx0aU9yZyI6ImZhbHNlIiwianRpIjoiYmM4M2U4MjQtNjdhMC00YjNhLTgxZTMtMDlkNjU5OTEwM2QyIiwib3JnYW5pemF0aW9uSWQiOiJjNDY3MzlkZi00MDZlLTQxNTctYTMxMS1iZTBkODZmNGJiZTMiLCJvcmdhbml6YXRpb25OYW1lIjoiQUlUUyBHZW5lc2lzIiwiZXhwIjoxNzI0NDk5MDg2LCJpc3MiOiJodHRwczovL2xvY2FsaG9zdDo3MDc1IiwiYXVkIjoiaHR0cDovL2xvY2FsaG9zdDo0MjAwIn0.Gu2BnQicqMdxz9pj8dWcv_qriFI0QTB6kokt-C5TyLI'; // Replace with your actual bearer token

    try {
      final response = await http.get(
        Uri.parse('https://devapi.xalorith.com/api/WsContent/GetUpcomingProducts'),
        headers: {
          'Authorization': 'Bearer $token', // Include the bearer token in the header
        },
      );

      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        print('Parsed Data: $data'); // Check the parsed data
        _upcomingProducts = data.map((item) => Product.fromJson(item)).toList();
        notifyListeners();
      } else {
        print('Failed to load upcoming products. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}

