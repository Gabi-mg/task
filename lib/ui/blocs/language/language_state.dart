part of 'language_bloc.dart';

enum LanguageStatus { initial, change, error, success }

extension LanguageStatusX on LanguageStatus {
  bool get isInitial => this == LanguageStatus.initial;
  bool get isChange => this == LanguageStatus.change;
}

class LanguageState extends Equatable {
  const LanguageState({
    this.status = LanguageStatus.initial,
    this.languageCode = 'en',
  });

  final LanguageStatus status;
  final String languageCode;

  @override
  List<Object> get props => [status, languageCode];

  LanguageState copyWith({
    LanguageStatus? status,
    String? languageCode,
  }) {
    return LanguageState(
      status: status ?? this.status,
      languageCode: languageCode ?? this.languageCode,
    );
  }
}
