import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';
import 'package:task/data/remote_datasource/models/models.dart';

part 'api.g.dart';

@RestApi()
abstract class Api {
  factory Api(Dio dio, {String? baseUrl}) = _Api;

  @GET('/data/2.5/forecast')
  Future<ForecastRemoteEntity> getForecast(
    @Query('lang') String lang,
    @Query('lat') double lat,
    @Query('lon') double long,
  );
}
