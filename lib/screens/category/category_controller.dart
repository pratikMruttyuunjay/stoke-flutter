import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stoke/dto/category/category_add.dart';
import 'package:stoke/dto/category/category_update.dart';
import 'package:stoke/screens/category/category_repo.dart';
import 'package:stoke/dto/category/category_list_dto.dart';

final categoryListController = FutureProvider<List<CategoryListData>>((ref) async {

  final repo = ref.read(categoryProvider);

  final FormData categoryListCred = FormData.fromMap({
    'action': 'categoryList',
  });

  List<CategoryListData> categoryList = await repo.getCategoryList(credential: categoryListCred);
  return categoryList;

});

final categoryUpdateController = FutureProvider<CategoryUpdate?>((ref) async {

  final repo = ref.read(categoryProvider);

  final FormData categoryUpdateCred = FormData.fromMap({
    'action': 'categoryList',
  });

  CategoryUpdate? categoryUpdate = await repo.updateCategory(credential: categoryUpdateCred);
  return categoryUpdate;

});

