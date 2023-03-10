// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

AddQty addQtyFromJson(String str) => AddQty.fromJson(json.decode(str));

String addQtyToJson(AddQty data) => json.encode(data.toJson());

class AddQty {
  AddQty({
    required this.message,
    required this.status,
    required this.data,
  });

  final String message;
  final String status;
  final AddQtyData data;

  factory AddQty.fromJson(Map<String, dynamic> json) => AddQty(
    message: json["message"],
    status: json["status"],
    data: AddQtyData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "data": data.toJson(),
  };
}

class AddQtyData {
  AddQtyData({
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

  factory AddQtyData.fromJson(Map<String, dynamic> json) => AddQtyData(
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
