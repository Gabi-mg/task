import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:task/common/constants.dart';
import 'package:task/core/extension/localizations.dart';
import 'package:task/ui/blocs/language/language_bloc.dart';
import 'package:task/ui/screens/home/bloc/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:task/ui/screens/home/forecast_layout.dart';
import 'package:task/ui/screens/home/form_layout.dart';
import 'package:task/ui/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<BottomNavigationBloc>(),
      child: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (context, stateNav) {
          return BlocBuilder<LanguageBloc, LanguageState>(
            builder: (context, stateLang) {
              String lang = languageCodeEn;
              Image image = Image.asset('assets/icons/united-kingdom.png');

              if (stateLang.languageCode == languageCodeEn) {
                lang = languageCodeEs;
                image = Image.asset('assets/icons/spain.png');
              }

              return Scaffold(
                appBar: AppBar(
                  title: Text(context.localizations.app_name),
                  actions: [
                    IconButton(
                      onPressed: () {
                        context.read<LanguageBloc>().add(
                              LanguageChanged(lang),
                            );
                        context.read<BottomNavigationBloc>().add(
                              TabChanged(
                                stateNav.index,
                                lang,
                              ),
                            );
                      },
                      icon: image,
                    ),
                  ],
                ),
                body: const _Body(),
                bottomNavigationBar: const _CustomBottomNavigation(),
              );
            },
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
        switch (state.status) {
          case BottomNavigationStatus.initial:
            return const FormLayout();
          case BottomNavigationStatus.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case BottomNavigationStatus.error:
            return const Center(
              child: Text('Error'),
            );
          case BottomNavigationStatus.success:
            if (state.index == 3) {
              return const FormLayout();
            } else {
              return ForecastLayout(forecast: state.forecast);
            }
        }
      },
    );
  }
}
