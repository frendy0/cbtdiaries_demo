import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void testMultiLineField(
    Finder multilineFinder, List<String> testValues, WidgetTester tester) {
  expect(multilineFinder, findsOneWidget);
  for (int i = 0; i < testValues.length; i++) {
    final oneFieldFinder = find
        .descendant(of: multilineFinder, matching: find.byType(TextField))
        .at(i);
    final textInsideFieldFinder =
        find.descendant(of: oneFieldFinder, matching: find.text(testValues[i]));
    expect(textInsideFieldFinder, findsOneWidget);
  }
}

Future enterTextMultiLineField(Finder multilineFinder, List<String> testValues,
    WidgetTester tester) async {
  expect(multilineFinder, findsOneWidget);
  final addButtonFinder = find.descendant(
      of: multilineFinder,
      matching: find.byKey(ValueKey('multiLineFieldAddNewLineButton')));
  await tester.ensureVisible(addButtonFinder);
  await tester.pumpAndSettle();

  for (int i = 0; i < testValues.length; i++) {
    if (i > 2) {
      await tester.tapAt(tester.getCenter(addButtonFinder));
      await tester.pumpAndSettle();
    }
    final oneFieldFinder = find
        .descendant(of: multilineFinder, matching: find.byType(TextField))
        .at(i);
    await tester.enterText(oneFieldFinder, testValues[i]);
  }
}
