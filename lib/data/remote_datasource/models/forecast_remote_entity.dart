import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task/data/remote_datasource/models/models.dart';
import 'package:task/domain/models/models.dart';

part 'forecast_remote_entity.freezed.dart';
part 'forecast_remote_entity.g.dart';

@freezed
class ForecastRemoteEntity with _$ForecastRemoteEntity {
  factory ForecastRemoteEntity({
    required List<ListItemRemoteEntity> list,
  }) = _ForecastRemoteEntity;

  factory ForecastRemoteEntity.fromJson(Map<String, dynamic> json) =>
      _$ForecastRemoteEntityFromJson(json);
}

extension ForecastRemoteEntityExtension on ForecastRemoteEntity {
  Forecast toForecast() => Forecast(
        list: list.map((e) => e.toListItem()).toList(),
  );
}
