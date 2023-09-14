import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class TestHelper {
  static Widget mountSingleWidget(Widget w) {
    return MaterialApp(
      title: 'Task',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('en', ''),
      supportedLocales: const [
        Locale('en', ''), //English
      ],
      home: Scaffold(
        appBar: AppBar(),
        body: w,
      ),
    );
  }
}
