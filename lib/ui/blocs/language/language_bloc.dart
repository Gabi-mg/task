import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(const LanguageState()) {
    on<LanguageChanged>(_onLanguajeChanged);
  }

  void _onLanguajeChanged(
    LanguageChanged event,
    Emitter<LanguageState> emit,
  ) {
    emit(
      state.copyWith(
        status: LanguageStatus.change,
        languageCode: event.languageCode,
      ),
    );
  }
}
