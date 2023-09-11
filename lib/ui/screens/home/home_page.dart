import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:task/common/constants.dart';
import 'package:task/core/extension/localizations.dart';
import 'package:task/ui/blocs/language/language_bloc.dart';
import 'package:task/ui/screens/home/bloc/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:task/ui/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<BottomNavigationBloc>(),
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          String lang = languageCodeEn;
          Image image = Image.asset('assets/icons/united-kingdom.png');

          if (state.languageCode == languageCodeEn) {
            lang = languageCodeEs;
            image = Image.asset('assets/icons/spain.png');
          }

          return Scaffold(
            appBar: AppBar(
              title: Text(context.localizations.app_name),
              actions: [
                IconButton(
                  onPressed: () => context.read<LanguageBloc>().add(
                        LanguageChanged(lang),
                      ),
                  icon: image,
                ),
              ],
            ),
            body: const _Body(),
            bottomNavigationBar: const _CustomBottomNavigation(),
          );
        },
      ),
    );
  }
}

class _CustomBottomNavigation extends StatelessWidget {
  const _CustomBottomNavigation();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: (context, state) {
        return CustomBottomNavigation(
          currentIndex: state.index,
        );
      },
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: (context, state) {
        String text = '';
        switch (state.index) {
          case 0:
            text = 'lOndond';
          case 1:
            text = 'toronto';
          case 2:
            text = 'singapur';
          default:
            text = 'lOndond';
        }
        return Text(text);
      },
    );
  }
}
