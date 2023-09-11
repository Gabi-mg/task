part of 'bottom_navigation_bloc.dart';

enum BottomNavigationStatus { initial, tap }

extension BottomNavigationStatusX on BottomNavigationStatus {
  bool get isInitial => this == BottomNavigationStatus.initial;
  bool get isTap => this == BottomNavigationStatus.tap;
}

class BottomNavigationState extends Equatable {
  const BottomNavigationState({
    this.status = BottomNavigationStatus.initial,
    this.index = 0,
  });

  final BottomNavigationStatus status;
  final int index;

  @override
  List<Object> get props => [status, index];

  BottomNavigationState copyWith({
    BottomNavigationStatus? status,
    int? index,
  }) {
    return BottomNavigationState(
      status: status ?? this.status,
      index: index ?? this.index,
    );
  }
}
