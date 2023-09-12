import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task/domain/models/models.dart';

part 'weather_remote_entity.freezed.dart';
part 'weather_remote_entity.g.dart';

@freezed
class WeatherRemoteEntity with _$WeatherRemoteEntity {
  factory WeatherRemoteEntity({
    required int id,
    required String main,
    required String description,
    required String icon,
  }) = _WeatherRemoteEntity;

  factory WeatherRemoteEntity.fromJson(Map<String, dynamic> json) =>
      _$WeatherRemoteEntityFromJson(json);
}

extension WeatherRemoteEntityExtension on WeatherRemoteEntity {
  Weather toWeather() => Weather(
        id: id,
        main: main,
        description: description,
        icon: icon,
  );
}
