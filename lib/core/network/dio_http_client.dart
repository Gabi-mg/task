import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';

class DioClient {
  static final Dio _dio = Dio();
  static List<Interceptor>? interceptors;

  void addInterceptors(List<Interceptor> interceptors) {
    _dio
      ..options.connectTimeout = const Duration(minutes: 1)
      ..options.receiveTimeout = const Duration(minutes: 1)
      ..httpClientAdapter
      ..options.headers = {'Content-Type': 'application/json'};
    if (interceptors.isNotEmpty) {
      _dio.interceptors.addAll(interceptors);
    }
    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(
          responseBody: true,
          error: true,
          requestHeader: true,
          responseHeader: true,
          request: true,
          requestBody: true));
    }
  }

  void addBadCertificateCallBack() {
    (_dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      HttpClient httpClient = HttpClient();
      httpClient.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return httpClient;
    };
  }

  /// Get Dio instance
  Dio getDio() {
    return _dio;
  }
}
