import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stoke/dio.dart';
import 'package:stoke/dto/add_qty.dart';
import 'package:stoke/dto/batch/batch_list.dart';
import 'package:stoke/dto/batch/batch_update.dart';
import 'package:stoke/dto/category/category_list_dto.dart';
import 'package:stoke/dto/minus_qty.dart';
import 'package:stoke/screens/batch/batch_repo.dart';

final batchListController = FutureProvider.autoDispose.family<List<BatchListData>,String>((ref,productId) async {
  final repo = ref.watch(batchRepoProvider);

  final FormData batchListCred = FormData.fromMap({
    "action":"batchList",
    "product_id":productId
  });

  List<BatchListData>? batchList = await repo.getBatchList(credential: batchListCred);
  return batchList;
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

abstract class BatchUpdateState {}
class BatchUpdateInit extends BatchUpdateState {}
class BatchUpdateLoading extends BatchUpdateState {}
class BatchUpdateLoaded extends BatchUpdateState {
  final BatchUpdate updateData;

  BatchUpdateLoaded(this.updateData);
}
class BatchUpdateError extends BatchUpdateState {
  final BatchUpdate errorData;

  BatchUpdateError(this.errorData);
}

final batchUpdateStateProvider =
StateNotifierProvider.autoDispose<BatchUpdateNotifier, BatchUpdateState>((ref) {
  return BatchUpdateNotifier();
});

class BatchUpdateNotifier extends StateNotifier<BatchUpdateState> {
  BatchUpdateNotifier() : super(BatchUpdateInit());

  // final WidgetRef ref;

  void update({
        required WidgetRef ref,
        required String batchId,
        required String title
  }) async {
    state = BatchUpdateLoading();
    print("title = $title");
    final repo = ref.read(batchRepoProvider);
    final FormData productUpdateCred = FormData.fromMap({
      'action': 'batchUpdate',
      'batch_id': batchId,
      'status': '1',
      'title': title
    });

    BatchUpdate batchUpdate = await repo.getBatchUpdate(credential: productUpdateCred);
    print(batchUpdate);
    if (batchUpdate.data.title.isNotEmpty) {
      state = BatchUpdateLoaded(batchUpdate);
    } else {
      state = BatchUpdateError(batchUpdate);
    }
  }
}
