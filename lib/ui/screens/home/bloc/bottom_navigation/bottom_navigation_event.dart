part of 'bottom_navigation_bloc.dart';

abstract class BottomNavigationEvent extends Equatable {
  const BottomNavigationEvent();
}

class TabChanged extends BottomNavigationEvent {
  const TabChanged(this.index, this.locale);

  final int index;
  final String locale;

  @override
  List<Object?> get props => [index, locale];
}
