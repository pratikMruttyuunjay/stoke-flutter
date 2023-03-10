import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stoke/dio.dart';
import 'package:stoke/dto/category/category_list_dto.dart';

import '../../dto/category/category_add.dart';
import '../../dto/category/category_update.dart';

abstract class CategoryRepoAbstract {

  Future<List<CategoryListData>> getCategoryList({required FormData credential});

  Future<CategoryAdd?> addCategory(
      {required FormData credential});

  Future<CategoryUpdate?> updateCategory(
      {required FormData credential});
}

final categoryProvider = Provider<CategoryRepository>((ref) {
  return CategoryRepository();
});


class CategoryRepository extends CategoryRepoAbstract {
  final _dio = API();

  @override
  Future<CategoryUpdate?> updateCategory(
      {required FormData credential}) async {

    try {
      final CategoryUpdate categoryUpdate;
      final response = await _dio.getResponse.post('/', data: credential);
      if (response.statusCode == 200) {
        categoryUpdate = categoryUpdateFromJson(response.data);
        return categoryUpdate;
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }

  }

  @override
  Future<List<CategoryListData>> getCategoryList(
      {required FormData credential}) async {
    List<CategoryListData> categoryList = [];
    try {
      final response = await _dio.getResponse.post('/', data: credential);
      // log('LoginRepo: ${response.data as String}');
      if (response.statusCode == 200) {
        // final resp = jsonDecode(response.data);
        categoryList = categoryListFromJson(response.data).data;
      }
      return categoryList;
    } catch (e) {
      print(e.toString());
      return [];
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
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }

  }
}
