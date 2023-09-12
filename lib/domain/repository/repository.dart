import 'package:task/core/network/models/result.dart';
import 'package:task/domain/models/models.dart';

abstract class RepositoryContract {
  Future<Result<Forecast>> getForecast(
    String lang,
    double lat,
    double lon,
  );
}
