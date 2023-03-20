import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stoke/dto/product/product_list.dart';
import 'package:stoke/dto/product/product_update.dart';

import '../../dio.dart';
import '../../dto/category/category_list_dto.dart';

abstract class ProductRepoAbstract {
  const ProductRepoAbstract();

  Future<List<ProductListData>?> getProductList({required FormData credential});
  Future<ProductUpdate?> getProductUpdate({required FormData credential});

}

final productProvider = Provider<ProductRepository>((ref){
  return ProductRepository(ref.watch(apiProvider));
});


class ProductRepository extends ProductRepoAbstract{

  const ProductRepository(this._dio);

  final API _dio;

  @override
  Future<List<ProductListData>> getProductList({required FormData credential}) async {
    try {
      final response = await _dio.getResponse.post('/', data: credential);
      print('ProductList: ${response.data}');
      if (response.statusCode == 200) {
        final batchAdd = productListFromJson(response.data);
        return batchAdd.data;
      } else {
        throw Exception('API call failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred while making API call: $e');
      throw e;
    }
  }

  @override
  Future<ProductUpdate> getProductUpdate({required FormData credential}) async {
    try {
      final response = await _dio.getResponse.post('/', data: credential);
      if (response.statusCode == 200) {
        final batchAdd = productUpdateFromJson(response.data);
        return batchAdd;
      } else {
        throw Exception('API call failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred while making API call: $e');
      throw e;
    }
  }


}