import 'package:accordion/accordion.dart';
import 'package:cbtdiaries_demo/domain/itd/entities/itd_note_model.dart';
import 'package:cbtdiaries_demo/presentations/itd/bloc/itd_bloc.dart';
import 'package:cbtdiaries_demo/presentations/itd/bloc/itd_event.dart';
import 'package:cbtdiaries_demo/presentations/itd/screens/itd_upsert_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../mocks.mocks.dart';
import '../widgets/multi_line_field_methods.dart';

void main() {
  testWidgets("Upsert note screen save test", (WidgetTester tester) async {
    final mockBloc = MockItdBloc();

    final testNote = ItdNote(
        situation: List.generate(5, (i) => "Test Situation ${i + 1}"),
        autoThoughts: List.generate(5, (i) => "Test Thought ${i + 1}"),
        emotions: List.generate(5, (i) => "Test Emotion ${i + 1}"),
        reactions: List.generate(5, (i) => "Test Reaction ${i + 1}"),
        response: List.generate(5, (i) => "Test Response ${i + 1}"),
        dateTime: DateTime(2022, 2, 14),
        title: 'My test title',
        id: '1234567890');

    await tester.pumpWidget(MaterialApp(
        home: BlocProvider<ItdBloc>(
            create: (_) => mockBloc, child: ItdAddScreen())));
    await tester
        .pump(const Duration(seconds: 1)); //Accordion has opening animation
    await tester.pumpAndSettle();

    final titleFieldFinder = find.byKey(ValueKey('titleTextField'));
    await tester.enterText(titleFieldFinder, testNote.title);


    await enterTextMultiLineField(
        find.byKey(ValueKey('situationTextField')), testNote.situation, tester);
    await openAccordionSection(2, tester);
    await enterTextMultiLineField(find.byKey(ValueKey('thoughtsTextField')),
        testNote.autoThoughts, tester);
    await openAccordionSection(3, tester);
    await enterTextMultiLineField(
        find.byKey(ValueKey('emotionsTextField')), testNote.emotions, tester);
    await openAccordionSection(4, tester);
    await enterTextMultiLineField(
        find.byKey(ValueKey('reactionsTextField')), testNote.reactions, tester);
    await openAccordionSection(5, tester);
    await enterTextMultiLineField(
        find.byKey(ValueKey('responseTextField')), testNote.response, tester);

    final saveButtonFinder = find.byKey(ValueKey('itdUpsertScreenSaveButton'));

    await tester.tap(saveButtonFinder);
    await tester.pump();
    final verifyResult = verify(mockBloc.add(captureAny))..called(1);

    final captured = verifyResult.captured;
    final event = captured.first as ItdAddNoteEvent;

    expect(event.itdNote.title, equals(testNote.title),
        reason: 'Title does not match');
    expect(event.itdNote.situation, equals(testNote.situation),
        reason: 'situation does not match');
    expect(event.itdNote.autoThoughts, equals(testNote.autoThoughts),
        reason: 'autoThoughts do not match');
    expect(event.itdNote.emotions, equals(testNote.emotions),
        reason: 'emotions do not match');
    expect(event.itdNote.reactions, equals(testNote.reactions),
        reason: 'reactions do not match');
    expect(event.itdNote.response, equals(testNote.response),
        reason: 'response does not match');
  });
}

Future openAccordionSection(int sectionIndex, WidgetTester tester) async {
  final sectionFinder = find.byType(AccordionSection).at(sectionIndex);

  final sectionWidget = tester.widget<AccordionSection>(sectionFinder);
  final headerFinder = find.byWidget(sectionWidget.header);

  await tester.ensureVisible(headerFinder);
  await tester.pumpAndSettle();
  await tester.tapAt(tester.getCenter(headerFinder));
  await tester.pumpAndSettle();
}
