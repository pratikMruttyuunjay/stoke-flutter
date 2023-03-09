import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../dio.dart';
import '../../dto/category_add.dart';
import '../../dto/category_list_dto.dart';
import '../batch/batch_repo.dart';
import '../category/category_repo.dart';

abstract class AddRepoAbstract {

  const AddRepoAbstract();
  Future<CategoryList?> addProduct({required FormData credential});
  Future<CategoryList?> addCategory({required FormData credential});
  Future<List<CategoryListData>?> addBatch({required FormData credential});

}

final addRepoProvider = Provider<AddRepo>((ref)  {
  return AddRepo(ref.watch(apiProvider));
});

class AddRepo extends AddRepoAbstract {

  const AddRepo(this._dio);

  final API _dio;

  @override
  Future<List<CategoryListData>?> addBatch({required FormData credential}) async {
    try {
      final response = await _dio.getResponse.post('/', data: credential);
      if (response.statusCode == 200) {
        final batchAdd = categoryListFromJson(response.data);
        return batchAdd.data;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  @override
  Future<CategoryList?> addCategory({required FormData credential}) async{
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
  Future<CategoryList?> addProduct({required FormData credential}) async {
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