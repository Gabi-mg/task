import 'package:task/core/network/models/result.dart';
import 'package:task/domain/models/models.dart';
import 'package:task/domain/repository/repository.dart';

class OpenWeather {
  final RepositoryContract _repository;

  OpenWeather(this._repository);

  Future<Result<Forecast>> getForecast(
    String lang,
    double lat,
    double lon,
  ) async {
    return await _repository.getForecast(lang, lat, lon);
  }
}
