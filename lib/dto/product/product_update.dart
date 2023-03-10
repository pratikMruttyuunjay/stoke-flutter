// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ProductUpdate productUpdateFromJson(String str) => ProductUpdate.fromJson(json.decode(str));

String productUpdateToJson(ProductUpdate data) => json.encode(data.toJson());

class ProductUpdate {
  ProductUpdate({
    required this.message,
    required this.status,
    required this.data,
  });

  final String message;
  final String status;
  final ProductUpdateData data;

  factory ProductUpdate.fromJson(Map<String, dynamic> json) => ProductUpdate(
    message: json["message"],
    status: json["status"],
    data: ProductUpdateData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "data": data.toJson(),
  };
}

class ProductUpdateData {
  ProductUpdateData({
    required this.id,
    required this.title,
    required this.updatedAt,
    required this.createdAt,
    required this.categoryId,
    required this.status,
  });

  final String id;
  final String title;
  final String updatedAt;
  final String createdAt;
  final String categoryId;
  final String status;

  factory ProductUpdateData.fromJson(Map<String, dynamic> json) => ProductUpdateData(
    id: json["id"],
    title: json["title"],
    updatedAt: json["updated_at"],
    createdAt: json["created_at"],
    categoryId: json["category_id"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "updated_at": updatedAt,
    "created_at": createdAt,
    "category_id": categoryId,
    "status": status,
  };
}
