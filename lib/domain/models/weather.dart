import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.freezed.dart';

@freezed
class Weather with _$Weather {
  factory Weather({
    required int id,
    required String main,
    required String description,
    required String icon,
  }) = _Weather;
}
