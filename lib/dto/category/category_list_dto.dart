// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

CategoryList categoryListFromJson(String str) => CategoryList.fromJson(json.decode(str));

String categoryListToJson(CategoryList data) => json.encode(data.toJson());

class CategoryList {
  CategoryList({
    required this.message,
    required this.status,
    required this.data,
  });

  final String message;
  final String status;
  final List<CategoryListData> data;

  factory CategoryList.fromJson(Map<String, dynamic> json) => CategoryList(
    message: json["message"],
    status: json["status"],
    data: List<CategoryListData>.from(json["data"].map((x) => CategoryListData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class CategoryListData {
  CategoryListData({
    required this.id,
    required this.title,
    required this.totalProduct,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String title;
  final String totalProduct;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory CategoryListData.fromJson(Map<String, dynamic> json) => CategoryListData(
    id: json["id"],
    title: json["title"],
    totalProduct: json["total_product"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "total_product": totalProduct,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
