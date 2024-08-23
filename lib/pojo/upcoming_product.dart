import 'dart:convert';

// Define the Product model class
class Product {
  final String id;
  final String title;
  final String? categoryId;
  final String? categoryName;
  final String? subCategoryId;
  final String? subCategoryName;
  final int displayOrder;
  final String? shortDescription;
  final String? description;
  final DateTime operationDate;
  final String? contentUrl;
  final String photoUrls;
  final String? videoUrls;
  final String createdById;
  final String createdByName;
  final String createdByEmail;
  final bool isPublished;
  final String websiteId;
  final String websiteName;

  Product({
    required this.id,
    required this.title,
    this.categoryId,
    this.categoryName,
    this.subCategoryId,
    this.subCategoryName,
    required this.displayOrder,
    this.shortDescription,
    this.description,
    required this.operationDate,
    this.contentUrl,
    required this.photoUrls,
    this.videoUrls,
    required this.createdById,
    required this.createdByName,
    required this.createdByEmail,
    required this.isPublished,
    required this.websiteId,
    required this.websiteName,
  });

  // Factory method to create a Product instance from JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      categoryId: json['categoryId'],
      categoryName: json['categoryName'],
      subCategoryId: json['subCategoryId'],
      subCategoryName: json['subCategoryName'],
      displayOrder: json['displayOrder'],
      shortDescription: json['shortDescription'],
      description: json['description'],
      operationDate: DateTime.parse(json['operationDate']),
      contentUrl: json['contentUrl'],
      photoUrls: json['photoUrls'],
      videoUrls: json['videoUrls'],
      createdById: json['createdById'],
      createdByName: json['createdByName'],
      createdByEmail: json['createdByEmail'],
      isPublished: json['isPublished'],
      websiteId: json['websiteId'],
      websiteName: json['websiteName'],
    );
  }

  // Method to convert a Product instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'categoryId': categoryId,
      'categoryName': categoryName,
      'subCategoryId': subCategoryId,
      'subCategoryName': subCategoryName,
      'displayOrder': displayOrder,
      'shortDescription': shortDescription,
      'description': description,
      'operationDate': operationDate.toIso8601String(),
      'contentUrl': contentUrl,
      'photoUrls': photoUrls,
      'videoUrls': videoUrls,
      'createdById': createdById,
      'createdByName': createdByName,
      'createdByEmail': createdByEmail,
      'isPublished': isPublished,
      'websiteId': websiteId,
      'websiteName': websiteName,
    };
  }
}

// Function to parse JSON response into a list of Product objects
List<Product> parseProducts(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Product>((json) => Product.fromJson(json)).toList();
}
