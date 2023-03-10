// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

MinusQty minusQtyFromJson(String str) => MinusQty.fromJson(json.decode(str));

String minusQtyToJson(MinusQty data) => json.encode(data.toJson());

class MinusQty {
  MinusQty({
    required this.message,
    required this.status,
    required this.data,
  });

  final String message;
  final String status;
  final MinusQtyData data;

  factory MinusQty.fromJson(Map<String, dynamic> json) => MinusQty(
    message: json["message"],
    status: json["status"],
    data: MinusQtyData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "data": data.toJson(),
  };
}

class MinusQtyData {
  MinusQtyData({
    required this.createdAt,
    required this.id,
    required this.productId,
    required this.qty,
    required this.status,
    required this.title,
    required this.updatedAt,
  });

  final String createdAt;
  final String id;
  final String productId;
  final String qty;
  final String status;
  final String title;
  final String updatedAt;

  factory MinusQtyData.fromJson(Map<String, dynamic> json) => MinusQtyData(
    createdAt: json["created_at"],
    id: json["id"],
    productId: json["product_id"],
    qty: json["qty"],
    status: json["status"],
    title: json["title"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "created_at": createdAt,
    "id": id,
    "product_id": productId,
    "qty": qty,
    "status": status,
    "title": title,
    "updated_at": updatedAt,
  };
}
