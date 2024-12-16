import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'package:tasky_todo/core/helpers/local_storage_helper.dart';
import 'package:tasky_todo/core/networking/services/api_constants.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioHeaders();
       debugPrint(
        '[USER Token] ====> ${LocalStorageHelper.read(ApiConstants.accessToken) ?? 'NULL TOKEN'}',
      );
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioHeaders() async {
    dio?.options.headers = {
      'Accept': 'application/json',
      'Authorization':
          'Bearer ${await LocalStorageHelper.read(ApiConstants.accessToken)}',
    };
  }

  static void setToken(String token) async {
    dio?.options.headers = {'Authorization': 'Bearer $token'};
  }

  static void addDioInterceptor() {
    // dio?.interceptors.add();
    dio?.interceptors.add(
      PrettyDioLogger(
        request: false,
        compact: false,
      ),
    );
  }
}
