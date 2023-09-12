import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task/data/remote_datasource/models/models.dart';
import 'package:task/domain/models/models.dart';

part 'list_item_remote_entity.freezed.dart';
part 'list_item_remote_entity.g.dart';

@freezed
class ListItemRemoteEntity with _$ListItemRemoteEntity {
  factory ListItemRemoteEntity({
    required int dt,
    required MainRemoteEntity main,
    required List<WeatherRemoteEntity> weather,
  }) = _ListItemRemoteEntity;

  factory ListItemRemoteEntity.fromJson(Map<String, dynamic> json) =>
      _$ListItemRemoteEntityFromJson(json);
}

extension ListItemRemoteEntityExtension on ListItemRemoteEntity {
  ListItem toListItem() => ListItem(
        dt: dt,
        main: main.toMain(),
        weather: weather.map((e) => e.toWeather()).toList(),
  );
}
