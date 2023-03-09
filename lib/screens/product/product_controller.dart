

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stoke/screens/product/product_repo.dart';

import '../../dto/category_list_dto.dart';

final productListController = FutureProvider((ref) async {

  final repo = ref.read(productProvider);

  final FormData loginData = FormData.fromMap({
    'action': 'categoryList',
  });

  List<CategoryListData>? categoryList = await repo.getProductList(credential: loginData);
  return categoryList;

});

final productUpdateController = FutureProvider((ref) async {

  final repo = ref.read(productProvider);

  final FormData loginData = FormData.fromMap({
    'action': 'categoryList',
  });

  CategoryList? categoryList = await repo.getProductUpdate(credential: loginData);
  return categoryList;

});