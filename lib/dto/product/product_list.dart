// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

// To parse this JSON data, do
//
//     final productList = productListFromJson(jsonString);

import 'dart:convert';

ProductList productListFromJson(String str) => ProductList.fromJson(json.decode(str));

String productListToJson(ProductList data) => json.encode(data.toJson());

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
    required this.totalProduct,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String title;
  final dynamic totalProduct;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory ProductListData.fromJson(Map<String, dynamic> json) => ProductListData(
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

