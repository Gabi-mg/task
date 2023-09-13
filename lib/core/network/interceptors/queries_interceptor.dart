import 'package:dio/dio.dart';

class QueriesInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final queries = <String, dynamic>{};

    queries['appid'] = '4cd25cba967fc4dba7b391d7891bed34';
    queries['units'] = 'metric';

    options.queryParameters.addAll(queries);
    return super.onRequest(options, handler);
  }
}
