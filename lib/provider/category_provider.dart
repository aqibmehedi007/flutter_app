import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../pojo/category.dart';

class CategoryProvider with ChangeNotifier {
  List<Category> _categories = [];

  List<Category> get categories => _categories;

  Future<void> loadCategories() async {
    final uri = Uri.parse('https://devapi.xalorith.com/api/ProductCategory/GetSelectListItems?typeId=1');
    final token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyTmFtZSI6IkFJVFNfREVWIiwiZW1haWwiOiJpbmZvQGFpdHNnZW5lc2lzLmNvbSIsInVzZXJJZCI6ImViYjA1MTNiLWI5ZTYtNDQ3ZC05ZGZhLWQ0MzQ3ZTAzN2U4NCIsInBob3RvVXJsIjoiIiwiaXNNdWx0aU9yZyI6ImZhbHNlIiwianRpIjoiMDUyZDg4NDYtYzhiZi00MTcwLWI2YjYtMDgzNjJhMWVhNjM5Iiwib3JnYW5pemF0aW9uSWQiOiJjNDY3MzlkZi00MDZlLTQxNTctYTMxMS1iZTBkODZmNGJiZTMiLCJvcmdhbml6YXRpb25OYW1lIjoiQUlUUyBHZW5lc2lzIiwiZXhwIjoxNzI0NTA5OTIxLCJpc3MiOiJodHRwczovL2xvY2FsaG9zdDo3MDc1IiwiYXVkIjoiaHR0cDovL2xvY2FsaG9zdDo0MjAwIn0.hI6ln5-0eLjiOPw_1PXkB5P_oAtaw7DS4B7HSw2BKYk'; // Replace with your actual token

    try {
      final response = await http.get(
        uri,
        headers: {
          'Authorization': 'Bearer $token', // Make sure to include 'Bearer'
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        print('Response data: $data'); // Debugging statement
        _categories = data.map((item) => Category.fromJson(item)).toList();
        notifyListeners();
      } else {
        print('Failed to load categories. Status code: ${response.statusCode}'); // Debugging statement
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      print('Error occurred: $e'); // Debugging statement
      throw Exception('Error occurred while loading categories');
    }
  }
}
