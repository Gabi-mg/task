import 'package:flutter/material.dart';
import 'package:task/domain/models/models.dart';
import 'package:task/ui/widgets/widgets.dart';

class ForecastLayout extends StatelessWidget {
  const ForecastLayout({
    super.key,
    required this.forecast,
  });

  final Forecast forecast;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: forecast.list.length,
      itemBuilder: (_, index) {
        final list = forecast.list[index];
        return ForecastItem(item: list);
      },
    );
  }
}
