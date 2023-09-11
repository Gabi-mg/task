import 'package:flutter/material.dart';

extension ColorSchemeBuildContext on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}
