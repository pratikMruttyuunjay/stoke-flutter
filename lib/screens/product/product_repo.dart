import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../dio.dart';
import '../../dto/category_list_dto.dart';

abstract class ProductRepoAbstract {
  const ProductRepoAbstract();

  Future<List<CategoryListData>?> getProductList({required FormData credential});
  Future<CategoryList?> getProductUpdate({required FormData credential});

}

final productProvider = Provider<ProductRepository>((ref){
  return ProductRepository(ref.watch(apiProvider));
});


class ProductRepository extends ProductRepoAbstract{

  const ProductRepository(this._dio);

  final API _dio;

  @override
  Future<List<CategoryListData>?> getProductList({required FormData credential}) async {
    try {
      final response = await _dio.getResponse.post('/', data: credential);
      if (response.statusCode == 200) {
        final batchAdd = categoryListFromJson(response.data);
        return batchAdd.data;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  @override
  Future<CategoryList?> getProductUpdate({required FormData credential}) async {
    try {
      final response = await _dio.getResponse.post('/', data: credential);
      if (response.statusCode == 200) {
        final batchAdd = categoryListFromJson(response.data);
        return batchAdd;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }


}