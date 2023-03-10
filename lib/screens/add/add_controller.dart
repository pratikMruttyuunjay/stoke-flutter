import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stoke/dto/batch/batch_add.dart';
import 'package:stoke/dto/product/product_add.dart';

import '../../dto/category/category_add.dart';
import '../../dto/category/category_list_dto.dart';
import '../batch/batch_repo.dart';
import '../category/category_repo.dart';
import 'add_repo.dart';

final batchAddController = FutureProvider<BatchAdd?>((ref) async {
  final repo = ref.watch(addRepoProvider);

  final FormData addBatchCred = FormData.fromMap({
    'action': 'categoryList',
  });

  BatchAdd? addBatch = await repo.addBatch(credential: addBatchCred);

  return addBatch;
});

final categoryAddController = FutureProvider<CategoryAdd?>((ref) async {

  final repo = ref.read(addRepoProvider);

  final FormData categoryAddCred = FormData.fromMap({
    'action': 'categoryList',
  });

  CategoryAdd? categoryAdd = await repo.addCategory(credential: categoryAddCred);

  return categoryAdd;

});

final productAddController = FutureProvider<ProductAdd?>((ref) async {

  final repo = ref.read(addRepoProvider);

  final FormData productAddCred = FormData.fromMap({
    'action': 'categoryList',
  });

  ProductAdd? productAdd = await repo.addProduct(credential: productAddCred);

  return productAdd;

});
