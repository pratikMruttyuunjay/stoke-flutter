// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ProductAdd productAddFromJson(String str) => ProductAdd.fromJson(json.decode(str));

String productAddToJson(ProductAdd data) => json.encode(data.toJson());

class ProductAdd {
  ProductAdd({
    required this.message,
    required this.status,
    required this.data,
  });

  final String message;
  final String status;
  final ProductAddData data;

  factory ProductAdd.fromJson(Map<String, dynamic> json) => ProductAdd(
    message: json["message"],
    status: json["status"],
    data: ProductAddData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "data": data.toJson(),
  };
}

class ProductAddData {
  ProductAddData({
    required this.productId,
    required this.productTitle,
  });

  final int productId;
  final String productTitle;

  factory ProductAddData.fromJson(Map<String, dynamic> json) => ProductAddData(
    productId: json["productId"],
    productTitle: json["productTitle"],
  );

  Map<String, dynamic> toJson() => {
    "productId": productId,
    "productTitle": productTitle,
  };
}
