// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

CategoryUpdate categoryUpdateFromJson(String str) => CategoryUpdate.fromJson(json.decode(str));

String categoryUpdateToJson(CategoryUpdate data) => json.encode(data.toJson());

class CategoryUpdate {
  CategoryUpdate({
    required this.message,
    required this.status,
    required this.data,
  });

  final String message;
  final String status;
  final CategoryUpdateData data;

  factory CategoryUpdate.fromJson(Map<String, dynamic> json) => CategoryUpdate(
    message: json["message"],
    status: json["status"],
    data: CategoryUpdateData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "data": data.toJson(),
  };
}

class CategoryUpdateData {
  CategoryUpdateData({
    required this.id,
    required this.title,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String title;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory CategoryUpdateData.fromJson(Map<String, dynamic> json) => CategoryUpdateData(
    id: json["id"],
    title: json["title"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
