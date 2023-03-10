import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stoke/dio.dart';
import 'package:stoke/dto/add_qty.dart';
import 'package:stoke/dto/batch/batch_list.dart';
import 'package:stoke/dto/batch/batch_update.dart';
import 'package:stoke/dto/category/category_list_dto.dart';
import 'package:stoke/dto/minus_qty.dart';
import 'package:stoke/screens/batch/batch_repo.dart';

final batchListController = FutureProvider<List<BatchListData>?>((ref) async {
  final repo = ref.watch(batchRepoProvider);

  final FormData batchListCred = FormData.fromMap({
    'action': 'categoryList',
  });

  BatchList? batchList = await repo.getBatchList(credential: batchListCred);

  return batchList?.data;
});

final batchAddQtyController = FutureProvider<AddQtyData?>((ref) async {
  final repo = ref.watch(batchRepoProvider);

  final FormData addQtyCred = FormData.fromMap({
    'action': 'categoryList',
  });

  AddQty? batchAddQty = await repo.getBatchAddQty(credential: addQtyCred);

  return batchAddQty?.data;
});

final batchMinusQtyController = FutureProvider<MinusQtyData?>((ref) async {
  final repo = ref.watch(batchRepoProvider);

  final FormData minusQtyCred = FormData.fromMap({
    'action': 'categoryList',
  });

  MinusQty? batchMinusQty = await repo.getBatchMinusQty(credential: minusQtyCred);

  return batchMinusQty?.data;
});

final batchUpdateController = FutureProvider<BatchUpdateData?>((ref) async {
  final repo = ref.watch(batchRepoProvider);

  final FormData batchUpdateCred = FormData.fromMap({
    'action': 'categoryList',
  });

  BatchUpdate? batchUpdate = await repo.getBatchUpdate(credential: batchUpdateCred);

  return batchUpdate?.data;
});
