

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stoke/dto/product/product_list.dart';
import 'package:stoke/dto/product/product_update.dart';
import 'package:stoke/screens/product/product_repo.dart';

import '../../dto/category/category_list_dto.dart';

final productListController = FutureProvider<List<ProductListData>?>((ref) async {

  final repo = ref.read(productProvider);

  final FormData productListCred = FormData.fromMap({
    'action': 'categoryList',
  });

  List<ProductListData>? productList = await repo.getProductList(credential: productListCred);
  return productList;

});

final productUpdateController = FutureProvider<ProductUpdate?>((ref) async {

  final repo = ref.read(productProvider);

  final FormData productUpdateCred = FormData.fromMap({
    'action': 'categoryList',
  });

  ProductUpdate? productUpdate = await repo.getProductUpdate(credential: productUpdateCred);
  return productUpdate;

});