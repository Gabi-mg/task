import 'package:freezed_annotation/freezed_annotation.dart';

part 'main.freezed.dart';

@freezed
class Main with _$Main {
  factory Main({
    required double temp,
    required double tempMin,
    required double tempMax,
    required int humidity,
  }) = _Main;
}
