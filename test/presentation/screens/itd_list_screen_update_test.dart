import 'package:cbtdiaries_demo/domain/itd/entities/itd_note_model.dart';
import 'package:cbtdiaries_demo/domain/shared/entities/database_result.dart';
import 'package:cbtdiaries_demo/domain/shared/entities/paged_database_result.dart';
import 'package:cbtdiaries_demo/presentations/itd/bloc/itd_bloc.dart';
import 'package:cbtdiaries_demo/presentations/itd/bloc/itd_event.dart';
import 'package:cbtdiaries_demo/presentations/itd/bloc/itd_state.dart';
import 'package:cbtdiaries_demo/presentations/itd/screens/itd_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mocks.mocks.dart';
import '../itd_generators.dart';

void main() {
  testWidgets("ITD List Screen elements upsert test",
      (WidgetTester tester) async {
    final mockItdRepository = MockItdRepository();
    final mockUserRepository = MockUserRepository();
    when(mockUserRepository.onUserChanges).thenAnswer((_) => Stream.empty());

    final itdBloc = ItdBloc(
        itdRepository: mockItdRepository, userRepository: mockUserRepository);
    final testList = generateTestItdNotesList(8);

    when(mockItdRepository.nextItdPage(limit: anyNamed("limit")))
        .thenAnswer((_) async => PagedDatabaseResult.success(data: testList));

    await tester.pumpWidget(MaterialApp(
      home: BlocProvider(create: (ctx) => itdBloc, child: ItdListScreen()),
    ));
    await tester.pumpAndSettle();

    final newTestNote = generateTestItdNote();
    final newTestServerNote =
        newTestNote.copyWith(id: "server123", title: "2New Note");
    when(mockItdRepository.addItdNote(any)).thenAnswer((_) async {
      await Future.delayed(Duration(milliseconds: 200));
      return DatabaseResult<ItdNote>.success(data: newTestServerNote);
    });
    itdBloc.add(ItdAddNoteEvent(itdNote: newTestNote));
    await tester.pump();
    await tester.pump();
    //loading screen
    final optimisticNoteFinder = find.byKey(ValueKey(newTestNote.id));
    final newServerNote = find.byKey(ValueKey(newTestServerNote.id));
    expect(
        find.descendant(
            of: optimisticNoteFinder,
            matching: find.byType(CircularProgressIndicator)),
        findsOneWidget);
    expect(optimisticNoteFinder, findsOneWidget);
    expect(newServerNote, findsNothing);

    await tester.pumpAndSettle();
    //final screen
    verify(mockItdRepository.addItdNote(any)).called(1);

    expect(optimisticNoteFinder, findsNothing);
    expect(newServerNote, findsOneWidget);
  });
}
