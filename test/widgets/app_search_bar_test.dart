import 'package:docnews/widgets/app_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App search bar', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: AppSearchBar(
            title: "News",
          ),
        ),
      ),
    ));

    expect(find.text('News'), findsOneWidget);

    await tester.tap(find.byKey(Key('searchButton')));
    await tester.pump();

    expect(find.text('News'), findsNothing);
    expect(find.text('Search'), findsOneWidget);
    expect(find.text('Search for anything'), findsOneWidget);

    await tester.tap(find.byKey(Key('clearButton')));
    await tester.pump();

    expect(find.text('News'), findsOneWidget);
  });
}
