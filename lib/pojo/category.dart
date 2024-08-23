class Category {
  final String code;
  final String nameWithCode;
  final String? parentId;
  final String? parentName;
  final int typeId;
  final String typeName;
  final String? imgUrl;
  final bool isShowOnECom;
  final int displayOrder;
  final String? iconClassName;
  final bool isService;
  final bool isHighlighted;
  final String id;
  final String name;

  Category({
    required this.code,
    required this.nameWithCode,
    this.parentId,
    this.parentName,
    required this.typeId,
    required this.typeName,
    this.imgUrl,
    required this.isShowOnECom,
    required this.displayOrder,
    this.iconClassName,
    required this.isService,
    required this.isHighlighted,
    required this.id,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      code: json['code'] ?? '', // Default value if null
      nameWithCode: json['nameWithCode'] ?? '', // Default value if null
      parentId: json['parentId'] as String?, // Nullable
      parentName: json['parentName'] as String?, // Nullable
      typeId: json['typeId'] ?? 0, // Default value if null
      typeName: json['typeName'] ?? '', // Default value if null
      imgUrl: json['imgUrl'] as String?, // Nullable
      isShowOnECom: json['isShowOnECom'] ?? false, // Default value if null
      displayOrder: json['displayOrder'] ?? 0, // Default value if null
      iconClassName: json['iconClassName'] as String?, // Nullable
      isService: json['isService'] ?? false, // Default value if null
      isHighlighted: json['isHighlighted'] ?? false, // Default value if null
      id: json['id'] ?? '', // Default value if null
      name: json['name'] ?? '', // Default value if null
    );
  }
}
