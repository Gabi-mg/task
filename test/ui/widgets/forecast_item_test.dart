import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:task/ui/widgets/widgets.dart';

import '../../helpers/mocks/domain_mock.dart';
import '../../helpers/test_helper.dart';

void main() {
  final itemMock = DomainMock.listItemMock();

  testWidgets(
    'Renders successfully',
    (WidgetTester tester) async {
      await mockNetworkImages(
        () async => tester.pumpWidget(
          TestHelper.mountSingleWidget(
            ForecastItem(item: itemMock),
          ),
        ),
      );

      expect(find.byType(ForecastItem), findsOneWidget);

      expect(find.byType(FadeInImage), findsOneWidget);

      expect(find.text('${itemMock.main.humidity}% RH'), findsOneWidget);
    },
  );
}
