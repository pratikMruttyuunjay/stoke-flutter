import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stoke/dio.dart';
import 'package:stoke/dto/category_list_dto.dart';
import 'package:stoke/screens/batch/batch_repo.dart';

final batchList = FutureProvider<List<CategoryListData>?>((ref) async {
  final repo = ref.watch(batchRepoProvider);

  final FormData loginData = FormData.fromMap({
    'action': 'categoryList',
  });

  CategoryList? categoryList = await repo.getBatchList(credential: loginData);

  return categoryList?.data;
});

final batchAddQty = FutureProvider<List<CategoryListData>?>((ref) async {
  final repo = ref.watch(batchRepoProvider);

  final FormData loginData = FormData.fromMap({
    'action': 'categoryList',
  });

  CategoryList? categoryList = await repo.getBatchAddQty(credential: loginData);

  return categoryList?.data;
});

final batchMinusQty = FutureProvider<List<CategoryListData>?>((ref) async {
  final repo = ref.watch(batchRepoProvider);

  final FormData loginData = FormData.fromMap({
    'action': 'categoryList',
  });

  CategoryList? categoryList = await repo.getBatchMinusQty(credential: loginData);

  return categoryList?.data;
});

final batchUpdate = FutureProvider<List<CategoryListData>?>((ref) async {
  final repo = ref.watch(batchRepoProvider);

  final FormData loginData = FormData.fromMap({
    'action': 'categoryList',
  });

  CategoryList? categoryList = await repo.getBatchUpdate(credential: loginData);

  return categoryList?.data;
});
