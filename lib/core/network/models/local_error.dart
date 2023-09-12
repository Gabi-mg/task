import 'package:task/core/network/models/result.dart';

class LocalError implements AppError {
  final String _error;

  LocalError(this._error);

  String get error => _error;
}
