import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task/domain/models/models.dart';

part 'main_remote_entity.freezed.dart';
part 'main_remote_entity.g.dart';

@freezed
class MainRemoteEntity with _$MainRemoteEntity {
  factory MainRemoteEntity({
    required double temp,
    @JsonKey(name: 'temp_min') required double tempMin,
    @JsonKey(name: 'temp_max') required double tempMax,
    required int humidity,
  }) = _MainRemoteEntity;

  factory MainRemoteEntity.fromJson(Map<String, dynamic> json) =>
      _$MainRemoteEntityFromJson(json);
}

extension MainRemoteEntityExtension on MainRemoteEntity {
  Main toMain() => Main(
        temp: temp,
        tempMin: tempMin,
        tempMax: tempMax,
        humidity: humidity,
  );
}
