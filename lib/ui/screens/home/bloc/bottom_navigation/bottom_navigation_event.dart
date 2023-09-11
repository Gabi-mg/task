part of 'bottom_navigation_bloc.dart';

abstract class BottomNavigationEvent extends Equatable {
  const BottomNavigationEvent();
}

class TabChanged extends BottomNavigationEvent {
  const TabChanged(this.index);

  final int index;

  @override
  List<Object?> get props => [index];
}
