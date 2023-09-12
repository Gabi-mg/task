part of 'bottom_navigation_bloc.dart';

enum BottomNavigationStatus { initial, loading, error, success }

extension BottomNavigationStatusX on BottomNavigationStatus {
  bool get isInitial => this == BottomNavigationStatus.initial;
  bool get isLoading => this == BottomNavigationStatus.loading;
  bool get isError => this == BottomNavigationStatus.error;
  bool get isSuccess => this == BottomNavigationStatus.success;
}

class BottomNavigationState extends Equatable {
  const BottomNavigationState({
    this.status = BottomNavigationStatus.initial,
    this.index = 3,
    this.forecast = Forecast.empty,
  });

  final BottomNavigationStatus status;
  final int index;
  final Forecast forecast;

  @override
  List<Object> get props => [status, index, forecast];

  BottomNavigationState copyWith({
    BottomNavigationStatus? status,
    int? index,
    Forecast? forecast,
  }) {
    return BottomNavigationState(
      status: status ?? this.status,
      index: index ?? this.index,
      forecast: forecast ?? this.forecast,
    );
  }
}
