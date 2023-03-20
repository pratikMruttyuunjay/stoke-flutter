import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stoke/dio.dart';
import 'package:stoke/dto/category/category_list_dto.dart';

import '../../dto/category/category_add.dart';
import '../../dto/category/category_update.dart';

abstract class CategoryRepoAbstract {
  Future<List<CategoryListData>> getCategoryList(
      {required FormData credential});

  Future<CategoryAdd?> addCategory({required FormData credential});

  Future<CategoryUpdate?> updateCategory({required FormData credential});
}

final categoryProvider = Provider<CategoryRepository>((ref) {
  return CategoryRepository();
});

class CategoryRepository extends CategoryRepoAbstract {
  final _dio = API();

  @override
  Future<CategoryUpdate> updateCategory({required FormData credential}) async {
    try {
      final CategoryUpdate categoryUpdate;
      final response = await _dio.getResponse.post('/', data: credential);
      if (response.statusCode == 200) {
        categoryUpdate = categoryUpdateFromJson(response.data);
        return categoryUpdate;
      } else {
        throw Exception('API call failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred while making API call: $e');
      throw e;
    }
  }

  @override
  Future<List<CategoryListData>> getCategoryList(
      {required FormData credential}) async {
    List<CategoryListData> categoryList = [];
    try {
      final response = await _dio.getResponse.post('/', data: credential);
      if (response.statusCode == 200) {
        categoryList = categoryListFromJson(response.data).data;
        return categoryList;
      }else {
        throw Exception('API call failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred while making API call: $e');
      throw e;
    }
  }

  @override
  Future<CategoryAdd?> addCategory({required FormData credential}) async {
    try {
      final CategoryAdd categoryAdd;
      final response = await _dio.getResponse.post('/', data: credential);
      if (response.statusCode == 200) {
        categoryAdd = categoryAddFromJson(response.data);
        return categoryAdd;
      } else {
        throw Exception('API call failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred while making API call: $e');
      throw e;
    }
  }
}
