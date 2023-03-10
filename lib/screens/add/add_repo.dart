import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stoke/dto/batch/batch_add.dart';
import 'package:stoke/dto/product/product_add.dart';

import '../../dio.dart';
import '../../dto/category/category_add.dart';
import '../../dto/category/category_list_dto.dart';
import '../batch/batch_repo.dart';
import '../category/category_repo.dart';

abstract class AddRepoAbstract {

  const AddRepoAbstract();
  Future<ProductAdd?> addProduct({required FormData credential});
  Future<CategoryAdd?> addCategory({required FormData credential});
  Future<BatchAdd?> addBatch({required FormData credential});

}

final addRepoProvider = Provider<AddRepo>((ref)  {
  return AddRepo(ref.watch(apiProvider));
});

class AddRepo extends AddRepoAbstract {

  const AddRepo(this._dio);

  final API _dio;

  @override
  Future<BatchAdd?> addBatch({required FormData credential}) async {
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
  Future<CategoryAdd?> addCategory({required FormData credential}) async{
    try {
      final response = await _dio.getResponse.post('/', data: credential);
      if (response.statusCode == 200) {
        final categoryAdd = categoryAddFromJson(response.data);
        return categoryAdd;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  @override
  Future<ProductAdd?> addProduct({required FormData credential}) async {
    try {
      final response = await _dio.getResponse.post('/', data: credential);
      if (response.statusCode == 200) {
        final productAdd = productAddFromJson(response.data);
        return productAdd;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

}