import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task/domain/models/models.dart';

part 'list_item.freezed.dart';

@freezed
class ListItem with _$ListItem {
  factory ListItem({
    required int dt,
    required Main main,
    required List<Weather> weather,
  }) = _ListItem;
}
