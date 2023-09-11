import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/extension/color_scheme.dart';
import 'package:task/core/extension/localizations.dart';
import 'package:task/ui/screens/home/bloc/bottom_navigation/bottom_navigation_bloc.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/london-bridge.png',
            width: 30,
            height: 30,
          ),
          label: context.localizations.london,
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/toronto.png',
            width: 30,
            height: 30,
          ),
          label: context.localizations.toronto,
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/marina-bay-sands.png',
            width: 30,
            height: 30,
          ),
          label: context.localizations.singapore,
        ),
      ],
      selectedItemColor: context.colorScheme.primary,
      currentIndex: currentIndex,
      onTap: (index) {
        context.read<BottomNavigationBloc>().add(TabChanged(index));
      },
    );
  }
}
