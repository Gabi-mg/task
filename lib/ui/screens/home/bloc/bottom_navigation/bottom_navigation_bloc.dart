import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(const BottomNavigationState()) {
    on<TabChanged>(_onTabChanged);
  }

  void _onTabChanged(
    TabChanged event,
    Emitter<BottomNavigationState> emit,
  ) {
    emit(
      state.copyWith(
        status: BottomNavigationStatus.tap,
        index: event.index,
      ),
    );
  }
}
