import 'package:cbtdiaries_demo/domain/itd/entities/itd_note_model.dart';
import 'package:cbtdiaries_demo/presentations/itd/screens/itd_upsert_screen.dart';
import 'package:cbtdiaries_demo/presentations/shared/widgets/select_datetime_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

import '../itd_generators.dart';
import '../widgets/multi_line_field_methods.dart';

void main() {
  testWidgets("Upsert note screen loader test", (WidgetTester tester) async {
    final testNote = generateTestItdNote();

    await tester.pumpWidget(MaterialApp(home: ItdAddScreen(itdNote: testNote)));
    await tester
        .pump(const Duration(seconds: 1)); //Accordion has opening animation
    await tester.pumpAndSettle();

    final titleFieldFinder = find.byKey(ValueKey('titleTextField'));
    final titleTextFinder = find.descendant(
      of: titleFieldFinder,
      matching: find.text(testNote.title),
    );
    expect(titleTextFinder, findsOneWidget);
    debugPrint("Title found");

    final selectDateTimeWidget =
        tester.widget<SelectDateTimeWidget>(find.byType(SelectDateTimeWidget));
    final dateTimeTextFinder = find.text(
        DateFormat(selectDateTimeWidget.dateFormat).format(testNote.dateTime));
    expect(dateTimeTextFinder, findsOneWidget);
    debugPrint("DateTime found");

    testMultiLineField(
        find.byKey(ValueKey('situationTextField')), testNote.situation, tester);
    debugPrint("Situation found");
    testMultiLineField(find.byKey(ValueKey('thoughtsTextField')),
        testNote.autoThoughts, tester);
    debugPrint("Thoughts found");
    testMultiLineField(
        find.byKey(ValueKey('emotionsTextField')), testNote.emotions, tester);
    debugPrint("Emotions found");
    testMultiLineField(
        find.byKey(ValueKey('reactionsTextField')), testNote.reactions, tester);
    debugPrint("Reactions found");
    testMultiLineField(
        find.byKey(ValueKey('responseTextField')), testNote.response, tester);
    debugPrint("Response found");
  });
}
