import 'package:flutter/material.dart';
import 'package:task/domain/models/models.dart';

class ForecastLayout extends StatelessWidget {
  const ForecastLayout({
    super.key,
    required this.forecast,
  });

  final Forecast forecast;

  @override
  Widget build(BuildContext context) {
    return Text('${forecast.list[0].main.temp}');
  }
}
