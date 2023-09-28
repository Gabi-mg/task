import 'package:dio/dio.dart';

class QueriesInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final queries = <String, dynamic>{};

    queries['appid'] = '2467c7b264a58c8e6b11fd6ff95f546b';
    queries['units'] = 'metric';

    options.queryParameters.addAll(queries);
    return super.onRequest(options, handler);
  }
}
