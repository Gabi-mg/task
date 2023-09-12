import 'package:dio/dio.dart';

class QueriesInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final queries = <String, dynamic>{};

    queries['appid'] = '41b9dd62530492ad1cb7446197bdb8f4';
    queries['units'] = 'metric';

    options.queryParameters.addAll(queries);
    return super.onRequest(options, handler);
  }
}
