import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/domain/models/models.dart';
import 'package:task/domain/usecases/usecases.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  final OpenWeather _openWeather;

  BottomNavigationBloc(this._openWeather)
      : super(const BottomNavigationState()) {
    on<TabChanged>(_onTabChanged);
  }

  void _onTabChanged(
    TabChanged event,
    Emitter<BottomNavigationState> emit,
  ) async {
    emit(state.copyWith(status: BottomNavigationStatus.loading));

    double lat = 51.50928768483664;
    double lon = -0.13894392288012386;
    switch (event.index) {
      case 0:
        lat = 51.50928768483664;
        lon = -0.13894392288012386;
        break;
      case 1:
        lat = 43.65447813264801;
        lon = -79.37891753054616;
        break;
      case 2:
        lat = 1.3558660882546987;
        lon = 103.8840919660724;
        break;
    }

    if (event.index == 3) {
      emit(
        state.copyWith(
          status: BottomNavigationStatus.success,
          index: event.index,
        ),
      );
    } else {
      final result = await _openWeather.getForecast(
        event.locale,
        lat,
        lon,
      );

      result.when(
        failure: (error) {
          emit(state.copyWith(status: BottomNavigationStatus.error));
        },
        success: (forecast) {
          emit(
            state.copyWith(
              status: BottomNavigationStatus.success,
              forecast: forecast,
              index: event.index,
            ),
          );
        },
      );
    }
  }
}
