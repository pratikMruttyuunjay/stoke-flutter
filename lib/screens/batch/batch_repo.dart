import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stoke/dio.dart';
import 'package:stoke/dto/add_qty.dart';
import 'package:stoke/dto/batch/batch_add.dart';
import 'package:stoke/dto/category/category_list_dto.dart';
import 'package:stoke/dto/minus_qty.dart';

import '../../dto/batch/batch_list.dart';
import '../../dto/batch/batch_update.dart';

abstract class BatchRepoAbstract {
  const BatchRepoAbstract();

  Future<BatchList?> getBatchList({required FormData credential});

  Future<AddQty?> getBatchAddQty({required FormData credential});

  Future<MinusQty?> getBatchMinusQty({required FormData credential});

  Future<BatchUpdate?> getBatchUpdate({required FormData credential});
}

final batchRepoProvider = Provider<BatchRepo>((ref) {
  return BatchRepo(ref.watch(apiProvider));
});

class BatchRepo extends BatchRepoAbstract {
  const BatchRepo(this._dio);

  final API _dio;

  @override
  Future<BatchAdd?> getBatchAdd({required FormData credential}) async {
    try {
      final response = await _dio.getResponse.post('/', data: credential);
      if (response.statusCode == 200) {
        final batchAdd = batchAddFromJson(response.data);
        return batchAdd;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  @override
  Future<AddQty?> getBatchAddQty({required FormData credential}) async {
    try {
      final response = await _dio.getResponse.post('/', data: credential);
      if (response.statusCode == 200) {
        final batchAdd = addQtyFromJson(response.data);
        return batchAdd;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  @override
  Future<BatchList?> getBatchList({required FormData credential}) async {
    try {
      final response = await _dio.getResponse.post('/', data: credential);
      if (response.statusCode == 200) {
        final batchAdd = batchListFromJson(response.data);
        return batchAdd;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  @override
  Future<MinusQty?> getBatchMinusQty({required FormData credential}) async {
    try {
      final response = await _dio.getResponse.post('/', data: credential);
      if (response.statusCode == 200) {
        final batchAdd = minusQtyFromJson(response.data);
        return batchAdd;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  @override
  Future<BatchUpdate?> getBatchUpdate({required FormData credential}) async {
    try {
      final response = await _dio.getResponse.post('/', data: credential);
      if (response.statusCode == 200) {
        final batchAdd = batchUpdateFromJson(response.data);
        return batchAdd;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
