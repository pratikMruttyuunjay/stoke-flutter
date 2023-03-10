// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

BatchUpdate batchUpdateFromJson(String str) => BatchUpdate.fromJson(json.decode(str));

String batchUpdateToJson(BatchUpdate data) => json.encode(data.toJson());

class BatchUpdate {
  BatchUpdate({
    required this.message,
    required this.status,
    required this.data,
  });

  final String message;
  final String status;
  final BatchUpdateData data;

  factory BatchUpdate.fromJson(Map<String, dynamic> json) => BatchUpdate(
    message: json["message"],
    status: json["status"],
    data: BatchUpdateData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "data": data.toJson(),
  };
}

class BatchUpdateData {
  BatchUpdateData({
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

  factory BatchUpdateData.fromJson(Map<String, dynamic> json) => BatchUpdateData(
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
