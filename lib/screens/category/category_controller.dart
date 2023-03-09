import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stoke/dto/category_add.dart';
import 'package:stoke/dto/category_update.dart';
import 'package:stoke/screens/category/category_repo.dart';
import 'package:stoke/dto/category_list_dto.dart';

final categoryListController = FutureProvider<List<CategoryListData>>((ref) async {

  final repo = ref.read(categoryProvider);

  final FormData loginData = FormData.fromMap({
    'action': 'categoryList',
  });

  List<CategoryListData> categoryList = await repo.getCategoryList(credential: loginData);
  return categoryList;

});

final categoryUpdateController = FutureProvider<CategoryUpdate?>((ref) async {

  final repo = ref.read(categoryProvider);

  final FormData loginData = FormData.fromMap({
    'action': 'categoryList',
  });

  CategoryUpdate? categoryUpdate = await repo.updateCategory(credential: loginData);

  if(categoryUpdate != null){
    return categoryUpdate;
  }
  return null;

});

