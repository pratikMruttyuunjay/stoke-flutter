import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stoke/dto/product/product_list.dart';
import 'package:stoke/dto/product/product_update.dart';
import 'package:stoke/screens/product/product_repo.dart';

import '../../dto/category/category_list_dto.dart';

final productListController = FutureProvider.autoDispose.family<List<ProductListData>, String>((ref, categoryId) async {
  final repo = ref.read(productProvider);

  final FormData productListCred = FormData.fromMap({
    "action": "productList",
    "status": "1",
    "category_id": categoryId,
  });

  List<ProductListData> productList = await repo.getProductList(credential: productListCred);
  if (productList.isNotEmpty) {
    return productList;
  }
  return [];
});


abstract class ProductUpdateState {}
class ProductUpdateInit extends ProductUpdateState {}
class ProductUpdateLoading extends ProductUpdateState {}
class ProductUpdateLoaded extends ProductUpdateState {
  final ProductUpdate updateData;

  ProductUpdateLoaded(this.updateData);
}
class ProductUpdateError extends ProductUpdateState {
  final ProductUpdate errorData;

  ProductUpdateError(this.errorData);
}

final productUpdateStateProvider =
    StateNotifierProvider.autoDispose<ProductUpdateNotifier, ProductUpdateState>((ref) {
  return ProductUpdateNotifier();
});

class ProductUpdateNotifier extends StateNotifier<ProductUpdateState> {
  ProductUpdateNotifier() : super(ProductUpdateInit());

  // final WidgetRef ref;

  void update({
      required WidgetRef ref,
      required String productId,
      required String title
  }) async {
    state = ProductUpdateLoading();
    print("title = $title");
    final repo = ref.read(productProvider);
    final FormData productUpdateCred = FormData.fromMap({
      'action': 'productUpdate',
      'product_id': productId,
      'status': '1',
      'title': title
    });

    ProductUpdate? productUpdate = await repo.getProductUpdate(credential: productUpdateCred);
    if (productUpdate.data.title.isNotEmpty) {
      state = ProductUpdateLoaded(productUpdate);
    } else {
      state = ProductUpdateError(productUpdate);
    }
  }
}
