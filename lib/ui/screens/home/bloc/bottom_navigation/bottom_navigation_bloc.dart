import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/domain/models/models.dart';
import 'package:task/domain/usecases/usecases.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  final OpenWeather _openWeather;
  final Geolocation _geolocation;

  BottomNavigationBloc(
    this._openWeather,
    this._geolocation,
  ) : super(const BottomNavigationState()) {
    on<TabChanged>(_onTabChanged);
  }

  void _onTabChanged(
    TabChanged event,
    Emitter<BottomNavigationState> emit,
  ) async {
    emit(state.copyWith(status: BottomNavigationStatus.loading));

    if (event.index == 3) {
      emit(
        state.copyWith(
          status: BottomNavigationStatus.success,
          index: event.index,
        ),
      );
    } else {
      final location = _geolocation.getLocation(event.index);

      final result = await _openWeather.getForecast(
        event.locale,
        location.lat,
        location.lon,
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
