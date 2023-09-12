import 'package:task/core/network/models/network_error.dart';
import 'package:task/core/network/models/result.dart';
import 'package:task/data/remote_datasource/models/forecast_remote_entity.dart';
import 'package:task/data/remote_datasource/remote_datasource.dart';
import 'package:task/domain/models/models.dart';
import 'package:task/domain/repository/repository.dart';

class Repository implements RepositoryContract {
  final RemoteDataSourceContract remoteDataSource;

  Repository({
    required this.remoteDataSource,
  });

  @override
  Future<Result<Forecast>> getForecast(
    String lang,
    double lat,
    double lon,
  ) async {
    try {
      final result = await remoteDataSource.getForecast(lang, lat, lon);

      final forecast = result.toForecast();

      return Result.success(forecast);
    } catch (error) {
      return Result.failure(error: NetworkError.getException(error));
    }
  }
}
