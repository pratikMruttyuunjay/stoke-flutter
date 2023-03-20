import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stoke/dto/batch/batch_add.dart';
import 'package:stoke/dto/product/product_add.dart';

import '../../dto/category/category_add.dart';
import '../../dto/category/category_list_dto.dart';
import '../batch/batch_repo.dart';
import '../category/category_controller.dart';
import '../category/category_repo.dart';
import '../product/product_controller.dart';
import 'add_repo.dart';

abstract class AddState {}

class AddInit extends AddState {}
class AddLoading extends AddState {}
class AddLoaded extends AddState {
  final dynamic data;

  AddLoaded(this.data);
}
class AddError extends AddState {
  final dynamic data;
  AddError(this.data);
}

final addStateNotifierProvider =
    StateNotifierProvider<CategoryAddController, AddState>(
        (ref) => CategoryAddController());

class CategoryAddController extends StateNotifier<AddState> {
  CategoryAddController() : super(AddInit());

  void addCategory({required WidgetRef ref, required String title}) async {
    state = AddLoading();
    final repo = ref.read(addRepoProvider);

    final FormData categoryAddCred =
        FormData.fromMap({'action': 'categoryAdd', 'title': title});

    CategoryAdd? categoryAdd = await repo.addCategory(credential: categoryAddCred);
    if (categoryAdd.data.categoryTitle.isNotEmpty) {
      state = AddLoaded(categoryAdd);
      ref.refresh(categoryListController);
    } else {
      state = AddError(categoryAdd);
    }
  }

  void addProduct({
      required WidgetRef ref,
      required String title,
      required String? categoryId
  }) async {

    state = AddLoading();
    final repo = ref.read(addRepoProvider);
    final FormData productAddCred = FormData.fromMap(
        {'action': 'productAdd', 'category_id': categoryId, 'title': title});

    ProductAdd? productAdd = await repo.addProduct(credential: productAddCred);
    if (productAdd.data.productTitle.isNotEmpty) {
      state = AddLoaded(productAdd);
    } else {
      state = AddError(productAdd);
    }
  }

  void addBatch({
    required WidgetRef ref,
      required String title,
      required String quantity,
      required String? productId
  }) async {
    state = AddLoading();
    final repo = ref.watch(addRepoProvider);

    final FormData addBatchCred = FormData.fromMap({
      'action': 'batchAdd',
      'product_id': productId,
      'title': title,
      'qty': quantity
    });

    BatchAdd? addBatch = await repo.addBatch(credential: addBatchCred);
    if (addBatch.data.batchTitle.isNotEmpty) {
      print("productAdd isNotEmpty = ${addBatch.data.toString()}");
      state = AddLoaded(addBatch);
    } else {
      print("ProductAdd Loaded");
      state = AddError(addBatch);
    }
  }
}

final batchAddController = FutureProvider<BatchAdd?>((ref) async {
  final repo = ref.watch(addRepoProvider);

  final FormData addBatchCred = FormData.fromMap({
    'action': 'categoryList',
  });

  BatchAdd? addBatch = await repo.addBatch(credential: addBatchCred);

  return addBatch;
});

final productAddController = FutureProvider<ProductAdd?>((ref) async {
  final repo = ref.read(addRepoProvider);

  final FormData productAddCred = FormData.fromMap({
    'action': 'categoryList',
  });

  ProductAdd? productAdd = await repo.addProduct(credential: productAddCred);

  return productAdd;
});
