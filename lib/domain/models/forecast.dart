import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task/domain/models/models.dart';

part 'forecast.freezed.dart';

@freezed
class Forecast with _$Forecast {
  const factory Forecast({
    required List<ListItem> list,
  }) = _Forecast;

  /// An empty Forecast
  static const Forecast empty = Forecast(
    list: [],
  );
}
