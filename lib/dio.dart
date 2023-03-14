import 'package:dio/dio.dart';
import 'package:flutter_pretty_dio_logger/flutter_pretty_dio_logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final apiProvider = Provider((ref) => API());

class API {
  final _dio = Dio();

  Dio get getResponse => _dio;

  API() {
    // _dio.options.baseUrl = 'https://stokemobile.hardikgiridevelopment.com';
    _dio.options.baseUrl = 'https://stoke.mruttyuunjay.com/';
    _dio.interceptors.add(PrettyDioLogger());
  }
}
