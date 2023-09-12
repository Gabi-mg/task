import 'package:flutter/material.dart';

extension LocaleBuildContext on BuildContext {
  Locale get locale => Localizations.localeOf(this);
}
