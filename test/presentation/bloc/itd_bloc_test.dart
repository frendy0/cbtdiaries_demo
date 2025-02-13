import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:cbtdiaries_demo/core/enums/processing_note_status.dart';
import 'package:cbtdiaries_demo/core/models/processing_note.dart';
import 'package:cbtdiaries_demo/domain/itd/entities/itd_note_model.dart';
import 'package:cbtdiaries_demo/domain/shared/entities/database_result.dart';
import 'package:cbtdiaries_demo/domain/shared/entities/paged_database_result.dart';
import 'package:cbtdiaries_demo/presentations/itd/bloc/itd_bloc.dart';
import 'package:cbtdiaries_demo/presentations/itd/bloc/itd_event.dart';
import 'package:cbtdiaries_demo/presentations/itd/bloc/itd_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mocks.mocks.dart';
import '../itd_generators.dart';

void main() {
  group('ItdBloc tests', () {
    late MockItdRepository mockItdRepository;
    late MockUserRepository mockUserRepository;
    late List<ItdNote> testNotes;
    late Random random;

    setUp(() {
      mockItdRepository = MockItdRepository();
      mockUserRepository = MockUserRepository();
      random = Random();
      when(mockUserRepository.onUserChanges).thenAnswer((_) => Stream.empty());
      testNotes = generateTestItdNotesList(12);
      when(mockItdRepository.nextItdPage()).thenAnswer((_) async =>
          PagedDatabaseResult.success(data: testNotes, hasMoreResults: true));
    });

    group("Testing ITD Bloc notes loading", () {
      blocTest<ItdBloc, ItdState>(
        'Testing bloc initializing',
        build: () {
          return ItdBloc(
              itdRepository: mockItdRepository,
              userRepository: mockUserRepository);
        },
        expect: () => [
          ItdState.generalLoading(),
          ItdState.contentLoaded(
              notes: testNotes, hasMoreResults: true, processingNotes: {})
        ],
        verify: (_) {
          verify(mockItdRepository.nextItdPage()).called(1);
        },
      );
      blocTest<ItdBloc, ItdState>(
        'Testing bloc next page event',
        build: () {
          return ItdBloc(
              itdRepository: mockItdRepository,
              userRepository: mockUserRepository);
        },
        act: (bloc) => bloc.add(ItdNextPageEvent()),
        skip: 2,
        expect: () => [
          ItdState.loadingNextPage(
              notes: testNotes, hasMoreResults: true, processingNotes: {}),
          isA<ItdState>().having(
              (s) =>
                  s.maybeMap(contentLoaded: (p) => p.notes, orElse: () => null),
              "New notes list",
              hasLength(testNotes.length * 2))
        ],
        verify: (_) {
          verify(mockItdRepository.nextItdPage()).called(2);
        },
      );
      blocTest<ItdBloc, ItdState>(
        'Testing bloc next page event with error thrown',
        build: () {
          final futuresQueue = <Future<PagedDatabaseResult<List<ItdNote>>>>[
            Future.value(PagedDatabaseResult.success(
                data: testNotes, hasMoreResults: true)),
            Future.value(PagedDatabaseResult.failure(
                error: "error",
                errorMessage: "This is error",
                hasMoreResults: true)),
          ];

          when(mockItdRepository.nextItdPage(limit: anyNamed("limit")))
              .thenAnswer((_) async => futuresQueue.removeAt(0));

          return ItdBloc(
              itdRepository: mockItdRepository,
              userRepository: mockUserRepository);
        },
        act: (bloc) => bloc.add(ItdNextPageEvent()),
        skip: 2,
        expect: () => [
          ItdState.loadingNextPage(
              notes: testNotes, hasMoreResults: true, processingNotes: {}),
          isA<ItdState>()
              .having(
                  (s) => s.maybeMap(
                      mutationResult: (p) => p.notes, orElse: () => null),
                  "Final state notes list is still same",
                  hasLength(testNotes.length))
              .having(
                  (s) => s.maybeMap(
                      mutationResult: (p) => p.result.status,
                      orElse: () => null),
                  "Final state contains an error",
                  ProcessingNoteStatus.error)
        ],
        verify: (_) {
          verify(mockItdRepository.nextItdPage()).called(2);
        },
      );
    });

    group("Testing ITD Bloc add note events", () {
      late ItdNote testNote;
      late ItdNote testServerNote;

      setUp(() {
        testNote = generateTestItdNote();
        testServerNote = testNote.copyWith(id: "server123");
      });

      blocTest<ItdBloc, ItdState>(
        'Testing bloc add note event',
        build: () {
          when(mockItdRepository.addItdNote(any)).thenAnswer(
              (_) async => DatabaseResult.success(data: testServerNote));

          return ItdBloc(
              itdRepository: mockItdRepository,
              userRepository: mockUserRepository);
        },
        act: (bloc) => bloc.add(ItdAddNoteEvent(itdNote: testNote)),
        skip: 2,
        expect: () => [
          isA<ItdState>()
              .having(
                  (s) => s.maybeMap(
                      processingMutation: (p) => p.notes, orElse: () => null),
                  "New temp note has been added to the list (Processing state)",
                  contains(testNote))
              .having(
                  (s) => s.maybeMap(
                      processingMutation: (p) =>
                          p.processingNotes[testNote.id]!.status,
                      orElse: () => null),
                  "New temp note has been moved into loading state (Processing State)",
                  ProcessingNoteStatus.loading),
          isA<ItdState>()
              .having(
                  (s) => s.maybeMap(
                      mutationResult: (p) => p.notes, orElse: () => null),
                  "Final state contains new server note",
                  contains(testServerNote))
              .having(
                  (s) => s.maybeMap(
                      mutationResult: (p) => p.notes, orElse: () => null),
                  "Final state does not contain temp note used for optimistic UI",
                  isNot(contains(testNote)))
              .having(
                  (s) => s.maybeMap(
                      mutationResult: (p) => p.result.status,
                      orElse: () => null),
                  "Final state contains result",
                  ProcessingNoteStatus.still)
        ],
        verify: (_) {
          verify(mockItdRepository.addItdNote(any)).called(1);
        },
      );

      blocTest<ItdBloc, ItdState>(
        'Testing bloc add note event with error thrown',
        build: () {
          when(mockItdRepository.addItdNote(any)).thenAnswer((_) async =>
              DatabaseResult.failure(
                  error: "database-error", errorMessage: "There is an error"));

          return ItdBloc(
              itdRepository: mockItdRepository,
              userRepository: mockUserRepository);
        },
        act: (bloc) => bloc.add(ItdAddNoteEvent(itdNote: testNote)),
        skip: 2,
        expect: () => [
          isA<ItdState>()
              .having(
                  (s) => s.maybeMap(
                      processingMutation: (p) => p.notes, orElse: () => null),
                  "New temp note has been added to the list (Processing state)",
                  contains(testNote))
              .having(
                  (s) => s.maybeMap(
                      processingMutation: (p) =>
                          p.processingNotes[testNote.id]!.status,
                      orElse: () => null),
                  "New temp note has been moved into loading state (Processing State)",
                  ProcessingNoteStatus.loading),
          isA<ItdState>()
              .having(
                  (s) => s.maybeMap(
                      mutationResult: (p) => p.notes, orElse: () => null),
                  "Final state still contains new temp note (optimistic UI)",
                  contains(testNote))
              .having(
                  (s) => s.maybeMap(
                      mutationResult: (p) =>
                          p.processingNotes[testNote.id]!.status,
                      orElse: () => null),
                  "New temp note has been moved into error state",
                  ProcessingNoteStatus.error)
              .having(
                  (s) => s.maybeMap(
                      mutationResult: (p) => p.result.status,
                      orElse: () => null),
                  "Final state contains result with an error",
                  ProcessingNoteStatus.error)
        ],
        verify: (_) {
          verify(mockItdRepository.addItdNote(any)).called(1);
        },
      );
    });

    group("Testing ITD Bloc update note events", () {
      late int noteForUpdateIndex;
      late ItdNote noteForUpdate;
      late ItdNote updatedNote;
      late ItdNote updatedServerNote;

      setUp(() {
        noteForUpdateIndex = random.nextInt(testNotes.length);
        noteForUpdate = testNotes[noteForUpdateIndex];
        updatedNote = noteForUpdate.copyWith(title: "Title updated");
        updatedServerNote = updatedNote.copyWith(id: "serverUpdated123");
      });

      blocTest<ItdBloc, ItdState>(
        'Testing bloc update note event',
        build: () {
          when(mockItdRepository.updateItdNote(any)).thenAnswer(
              (_) async => DatabaseResult.success(data: updatedServerNote));

          return ItdBloc(
              itdRepository: mockItdRepository,
              userRepository: mockUserRepository);
        },
        act: (bloc) => bloc.add(ItdUpdateNoteEvent(itdNote: updatedNote)),
        skip: 2,
        expect: () => [
          isA<ItdState>()
              .having(
                  (s) => s.maybeMap(
                      processingMutation: (p) => p.notes[noteForUpdateIndex],
                      orElse: () => null),
                  "Updated note has replaced the original note in the list (Processing State)",
                  updatedNote)
              .having(
                  (s) => s.maybeMap(
                      processingMutation: (p) =>
                          p.processingNotes[updatedNote.id]!.status,
                      orElse: () => null),
                  "Updating note has been moved into loading state (Processing State)",
                  ProcessingNoteStatus.loading),
          isA<ItdState>()
              .having(
                  (s) => s.maybeMap(
                      mutationResult: (p) => p.notes[noteForUpdateIndex],
                      orElse: () => null),
                  "Final state contains new server note",
                  updatedServerNote)
              .having(
                  (s) => s.maybeMap(
                      mutationResult: (p) => p.notes, orElse: () => null),
                  "Final state does not contain updated temp note",
                  isNot(contains(updatedNote)))
              .having(
                  (s) => s.maybeMap(
                      mutationResult: (p) => p.notes, orElse: () => null),
                  "Final state does not contain the old note",
                  isNot(contains(noteForUpdate)))
              .having(
                  (s) => s.maybeMap(
                      mutationResult: (p) => p.result.status,
                      orElse: () => null),
                  "Final state contains result",
                  ProcessingNoteStatus.still),
        ],
        verify: (_) {
          verify(mockItdRepository.updateItdNote(any)).called(1);
        },
      );
      blocTest<ItdBloc, ItdState>(
        'Testing bloc update note event with an error thrown',
        build: () {
          when(mockItdRepository.updateItdNote(any)).thenAnswer((_) async =>
              DatabaseResult.failure(
                  error: "database-error", errorMessage: "There is an error"));

          return ItdBloc(
              itdRepository: mockItdRepository,
              userRepository: mockUserRepository);
        },
        act: (bloc) => bloc.add(ItdUpdateNoteEvent(itdNote: updatedNote)),
        skip: 2,
        expect: () => [
          isA<ItdState>()
              .having(
                  (s) => s.maybeMap(
                      processingMutation: (p) => p.notes[noteForUpdateIndex],
                      orElse: () => null),
                  "Updated note has replaced the original note in the list (Processing State)",
                  updatedNote)
              .having(
                  (s) => s.maybeMap(
                      processingMutation: (p) =>
                          p.processingNotes[updatedNote.id]!.status,
                      orElse: () => null),
                  "Updating note has been moved into loading state (Processing State)",
                  ProcessingNoteStatus.loading),
          isA<ItdState>()
              .having(
                  (s) => s.maybeMap(
                      mutationResult: (p) => p.notes[noteForUpdateIndex],
                      orElse: () => null),
                  "Final state still contains updated note",
                  updatedNote)
              .having(
                  (s) => s.maybeMap(
                      mutationResult: (p) => p.notes, orElse: () => null),
                  "Final state does not contain the old note",
                  isNot(contains(noteForUpdate)))
              .having(
                  (s) => s.maybeMap(
                      mutationResult: (p) =>
                          p.processingNotes[updatedNote.id]!.status,
                      orElse: () => null),
                  "Updated note has been moved into error state",
                  ProcessingNoteStatus.error)
              .having(
                  (s) => s.maybeMap(
                      mutationResult: (p) => p.result.status,
                      orElse: () => null),
                  "Final state contains result",
                  ProcessingNoteStatus.error),
        ],
        verify: (_) {
          verify(mockItdRepository.updateItdNote(any)).called(1);
        },
      );
    });

    group("Testing ITD Bloc delete note events", () {
      late int noteForDeleteIndex;
      late ItdNote noteForDelete;

      setUp(() {
        noteForDeleteIndex = random.nextInt(testNotes.length);
        noteForDelete = testNotes[noteForDeleteIndex];
      });

      blocTest<ItdBloc, ItdState>(
        'Testing bloc delete note event',
        build: () {
          when(mockItdRepository.removeItdNote(any))
              .thenAnswer((_) async => DatabaseResult.success(data: true));

          return ItdBloc(
              itdRepository: mockItdRepository,
              userRepository: mockUserRepository);
        },
        act: (bloc) => bloc.add(ItdDeleteNoteEvent(itdNote: noteForDelete)),
        skip: 2,
        expect: () => [
          isA<ItdState>()
              .having(
                  (s) => s.maybeMap(
                      processingMutation: (p) => p.notes, orElse: () => null),
                  "Removing note is still in the list (Processing state)",
                  contains(noteForDelete))
              .having(
                  (s) => s.maybeMap(
                      processingMutation: (p) =>
                          p.processingNotes[noteForDelete.id]!.status,
                      orElse: () => null),
                  "Removing note has been moved into loading state (Processing State)",
                  ProcessingNoteStatus.loading),
          isA<ItdState>()
              .having(
                  (s) => s.maybeMap(
                      mutationResult: (p) => p.notes, orElse: () => null),
                  "Final state does not contain removed note",
                  isNot(contains(noteForDelete)))
              .having(
                  (s) => s.maybeMap(
                      mutationResult: (p) => p.notes, orElse: () => null),
                  "Final state list is shorter",
                  hasLength(testNotes.length - 1))
              .having(
                  (s) => s.maybeMap(
                      mutationResult: (p) => p.result.status,
                      orElse: () => null),
                  "Final state contains result",
                  ProcessingNoteStatus.still)
        ],
        verify: (_) {
          verify(mockItdRepository.removeItdNote(any)).called(1);
        },
      );

      blocTest<ItdBloc, ItdState>(
        'Testing bloc delete note event with an error thrown',
        build: () {
          when(mockItdRepository.removeItdNote(any)).thenAnswer((_) async =>
              DatabaseResult.failure(
                  error: "database-error", errorMessage: "There is an error"));

          return ItdBloc(
              itdRepository: mockItdRepository,
              userRepository: mockUserRepository);
        },
        act: (bloc) => bloc.add(ItdDeleteNoteEvent(itdNote: noteForDelete)),
        skip: 2,
        expect: () => [
          isA<ItdState>()
              .having(
                  (s) => s.maybeMap(
                      processingMutation: (p) => p.notes, orElse: () => null),
                  "Removing note is still in the list (Processing state)",
                  contains(noteForDelete))
              .having(
                  (s) => s.maybeMap(
                      processingMutation: (p) =>
                          p.processingNotes[noteForDelete.id]!.status,
                      orElse: () => null),
                  "Removing note has been moved into loading state (Processing State)",
                  ProcessingNoteStatus.loading),
          isA<ItdState>()
              .having(
                  (s) => s.maybeMap(
                      mutationResult: (p) => p.notes, orElse: () => null),
                  "Final state contains removed note",
                  contains(noteForDelete))
              .having(
                  (s) => s.maybeMap(
                      mutationResult: (p) => p.notes, orElse: () => null),
                  "Final state list is still same (Nothing was removed)",
                  hasLength(testNotes.length))
              .having(
                  (s) => s.maybeMap(
                      mutationResult: (p) =>
                          p.processingNotes[noteForDelete.id]!.status,
                      orElse: () => null),
                  "Note for remove has been moved into error state",
                  ProcessingNoteStatus.error)
              .having(
                  (s) => s.maybeMap(
                      mutationResult: (p) => p.result.status,
                      orElse: () => null),
                  "Final state contains result with an error",
                  ProcessingNoteStatus.error)
        ],
        verify: (_) {
          verify(mockItdRepository.removeItdNote(any)).called(1);
        },
      );
    });
  });
}
