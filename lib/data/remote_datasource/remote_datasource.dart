import 'package:task/data/remote_datasource/api/api.dart';
import 'package:task/data/remote_datasource/models/models.dart';

abstract class RemoteDataSourceContract {
  Future<ForecastRemoteEntity> getForecast(
    String lang,
    double lat,
    double long,
  );
}

class RemoteDataSource implements RemoteDataSourceContract {
  final Api api;

  RemoteDataSource({required this.api});

  @override
  Future<ForecastRemoteEntity> getForecast(
    String lang,
    double lat,
    double long,
  ) async {
    return await api.getForecast(lang, lat, long);
  }
}
