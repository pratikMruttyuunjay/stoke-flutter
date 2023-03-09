import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../dto/category_add.dart';
import '../../dto/category_list_dto.dart';
import '../batch/batch_repo.dart';
import '../category/category_repo.dart';
import 'add_repo.dart';

final batchAdd = FutureProvider<List<CategoryListData>?>((ref) async {
  final repo = ref.watch(addRepoProvider);

  final FormData loginData = FormData.fromMap({
    'action': 'categoryList',
  });

  List<CategoryListData>? categoryList = await repo.addBatch(credential: loginData);

  return categoryList;
});

final categoryAddController = FutureProvider<CategoryList?>((ref) async {

  final repo = ref.read(addRepoProvider);

  final FormData loginData = FormData.fromMap({
    'action': 'categoryList',
  });

  CategoryList? categoryList = await repo.addCategory(credential: loginData);

  if(categoryList != null){
    return categoryList;
  }
  return null;

});

final batchAddController = FutureProvider<CategoryList?>((ref) async {

  final repo = ref.read(addRepoProvider);

  final FormData loginData = FormData.fromMap({
    'action': 'categoryList',
  });

  CategoryList? categoryList = await repo.addCategory(credential: loginData);

  if(categoryList != null){
    return categoryList;
  }
  return null;

});
