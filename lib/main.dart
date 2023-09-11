import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:task/common/constants.dart';
import 'package:task/core/di/app_di.dart' as di;
import 'package:task/core/theme/app_theme.dart';
import 'package:task/routes.dart';
import 'package:task/ui/blocs/language/language_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});

  final GoRouter _router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    routes: allAppRoutes,
    initialLocation: '/',
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<LanguageBloc>(),
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          return MaterialApp.router(
            theme: AppTheme.themeData(),
            debugShowCheckedModeBanner: false,
            routeInformationProvider: _router.routeInformationProvider,
            routeInformationParser: _router.routeInformationParser,
            routerDelegate: _router.routerDelegate,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: Locale(state.languageCode, ''),
            supportedLocales: const [
              Locale(languageCodeEn, ''), //English
              Locale(languageCodeEs, ''), //Spanish
            ],
            title: 'Task',
          );
        },
      ),
    );
  }
}
