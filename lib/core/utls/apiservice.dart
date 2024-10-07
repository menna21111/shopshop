import 'dart:developer';

import 'package:dio/dio.dart';

class Apiservice {
  //wraper as method
  final _baseUrl = 'https://student.valuxapps.com/api/';
  final Dio _dio;
  Apiservice(this._dio);
  Future<Map<String, dynamic>> get(
      {required String endpoint, Options? options}) async {
    //الليراجع من الداتا ماب
    var response = await _dio.get('https://student.valuxapps.com/api/$endpoint',
        options: options);
    print(response.data);
    // log(response.data);
    return response.data;
  }

  Future<Map<String, dynamic>> post(
      {required String endpoint,
      Object? data,
      Map<String, dynamic>? queryParameters,
      Options? options}) async {
    var response = await _dio.post(
      '$_baseUrl$endpoint',
      data: data,
      options: options,
    );
    print(response.data);

    log('response of post come');
    return response.data;
  }

  Future<Map<String, dynamic>> delete(
      {required String endpoint,
      Object? data,
      Map<String, dynamic>? queryParameters,
      Options? options}) async {
    var response = await _dio.delete(
      '$_baseUrl$endpoint',
      data: data,
      options: options,
    );
    print(response.data);

    log('response of delete come');
    return response.data;
  }

  Future<Map<String, dynamic>> put(
      {required String endpoint,
      Object? data,
      Map<String, dynamic>? queryParameters,
      Options? options}) async {
    var response = await _dio.put(
      '$_baseUrl$endpoint',
      data: data,
      options: options,
    );
    print(response.data);

    log('response of put come');
    return response.data;
  }
}
