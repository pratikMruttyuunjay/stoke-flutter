import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stoke/dio.dart';
import 'package:stoke/dto/category_list_dto.dart';

import '../../dto/category_update.dart';

abstract class BatchRepoAbstract {
  const BatchRepoAbstract();

  Future<CategoryList?> getBatchList({required FormData credential});

  Future<CategoryList?> getBatchAddQty({required FormData credential});

  Future<CategoryList?> getBatchMinusQty({required FormData credential});

  Future<CategoryList?> getBatchUpdate({required FormData credential});
}

final batchRepoProvider = Provider<BatchRepo>((ref) {
  return BatchRepo(ref.watch(apiProvider));
});

class BatchRepo extends BatchRepoAbstract {
  const BatchRepo(this._dio);

  final API _dio;

  @override
  Future<CategoryList?> getBatchAdd({required FormData credential}) async {
    try {
      final response = await _dio.getResponse.post('/', data: credential);
      if (response.statusCode == 200) {
        final batchAdd = categoryListFromJson(response.data);
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
  Future<CategoryList?> getBatchAddQty({required FormData credential}) async {
    try {
      final response = await _dio.getResponse.post('/', data: credential);
      if (response.statusCode == 200) {
        final batchAdd = categoryListFromJson(response.data);
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
  Future<CategoryList?> getBatchList({required FormData credential}) async {
    try {
      final response = await _dio.getResponse.post('/', data: credential);
      if (response.statusCode == 200) {
        final batchAdd = categoryListFromJson(response.data);
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
  Future<CategoryList?> getBatchMinusQty({required FormData credential}) async {
    try {
      final response = await _dio.getResponse.post('/', data: credential);
      if (response.statusCode == 200) {
        final batchAdd = categoryListFromJson(response.data);
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
  Future<CategoryList?> getBatchUpdate({required FormData credential}) async {
    try {
      final response = await _dio.getResponse.post('/', data: credential);
      if (response.statusCode == 200) {
        final batchAdd = categoryListFromJson(response.data);
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
