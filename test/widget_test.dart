import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:explore_countries_app/src/repositories/country_repository.dart';
import 'package:explore_countries_app/src/services/graphql_service.dart';

import 'package:explore_countries_app/main.dart';

void main() {
  final client = GraphqlService.initClient().value;
  final repo = CountryRepository(client: client);
  testWidgets('Run smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp(
      repository: repo,
    ));
  });

  testWidgets('Check indicators', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp(
      repository: repo,
    ));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Display country names', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp(
      repository: repo,
    ));
    await tester.pumpAndSettle();

    expect(find.text('Nigeria'), findsOneWidget);
  });
}
