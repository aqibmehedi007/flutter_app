import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://devapi.xalorith.com/api/ProductCategory/GetSelectListItems?typeId=1';
  final String bearerToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyTmFtZSI6IkFJVFNfREVWIiwiZW1haWwiOiJpbmZvQGFpdHNnZW5lc2lzLmNvbSIsInVzZXJJZCI6ImViYjA1MTNiLWI5ZTYtNDQ3ZC05ZGZhLWQ0MzQ3ZTAzN2U4NCIsInBob3RvVXJsIjoiIiwiaXNNdWx0aU9yZyI6ImZhbHNlIiwianRpIjoiYmM4M2U4MjQtNjdhMC00YjNhLTgxZTMtMDlkNjU5OTEwM2QyIiwib3JnYW5pemF0aW9uSWQiOiJjNDY3MzlkZi00MDZlLTQxNTctYTMxMS1iZTBkODZmNGJiZTMiLCJvcmdhbml6YXRpb25OYW1lIjoiQUlUUyBHZW5lc2lzIiwiZXhwIjoxNzI0NDk5MDg2LCJpc3MiOiJodHRwczovL2xvY2FsaG9zdDo3MDc1IiwiYXVkIjoiaHR0cDovL2xvY2FsaG9zdDo0MjAwIn0.Gu2BnQicqMdxz9pj8dWcv_qriFI0QTB6kokt-C5TyLI'; // Replace with your actual token

  Future<List<dynamic>> loadCategories() async {
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        'Authorization': 'Bearer $bearerToken',
        'Content-Type': 'application/json'
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
