// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ProductList productListFromJson(String str) => ProductList.fromJson(json.decode(str));

String welcomeListToJson(ProductList data) => json.encode(data.toJson());

class ProductList {
  ProductList({
    required this.message,
    required this.status,
    required this.data,
  });

  final String message;
  final String status;
  final List<ProductListData> data;

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
    message: json["message"],
    status: json["status"],
    data: List<ProductListData>.from(json["data"].map((x) => ProductListData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class ProductListData {
  ProductListData({
    required this.id,
    required this.title,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.totalProduct,
  });

  final String id;
  final String title;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String totalProduct;

  factory ProductListData.fromJson(Map<String, dynamic> json) => ProductListData(
    id: json["id"],
    title: json["title"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    totalProduct: json["total_product"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "total_product": totalProduct,
  };
}
