import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_web/app/app.dart';
import 'package:portfolio_web/di/service_locator.dart';

void main() {
  testWidgets('portfolio home renders from mock data', (
    WidgetTester tester,
  ) async {
    setupDependencies();

    await tester.pumpWidget(const PortfolioWebApp());
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await tester.pumpAndSettle();

    expect(find.text('Personal Portfolio'), findsOneWidget);
    expect(find.text('Selected Projects'), findsOneWidget);
  });
}
