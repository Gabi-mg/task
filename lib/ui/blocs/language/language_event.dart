part of 'language_bloc.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();
}

class LanguageChanged extends LanguageEvent {
  const LanguageChanged(
    this.languageCode,
  );

  final String languageCode;

  @override
  List<Object?> get props => [languageCode];
}
