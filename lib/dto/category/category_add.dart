// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

CategoryAdd categoryAddFromJson(String str) => CategoryAdd.fromJson(json.decode(str));

String categoryAddToJson(CategoryAdd data) => json.encode(data.toJson());

class CategoryAdd {
  CategoryAdd({
    required this.message,
    required this.status,
    required this.data,
  });

  final String message;
  final String status;
  final CategoryAddData data;

  factory CategoryAdd.fromJson(Map<String, dynamic> json) => CategoryAdd(
    message: json["message"],
    status: json["status"],
    data: CategoryAddData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "data": data.toJson(),
  };
}

class CategoryAddData {
  CategoryAddData({
    required this.categoryId,
    required this.categoryTitle,
  });

  final int categoryId;
  final String categoryTitle;

  factory CategoryAddData.fromJson(Map<String, dynamic> json) => CategoryAddData(
    categoryId: json["categoryId"],
    categoryTitle: json["categoryTitle"],
  );

  Map<String, dynamic> toJson() => {
    "categoryId": categoryId,
    "categoryTitle": categoryTitle,
  };
}

