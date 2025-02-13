import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../core/enums/note_operation.dart';
import '../../../core/enums/processing_note_status.dart';
import '../../../core/models/processing_note.dart';
import '../../../domain/authentication/repositories/user_repository.dart';
import '../../../domain/itd/entities/itd_note_model.dart';
import '../../../domain/itd/repositories/itd_repository.dart';
import '../../../domain/shared/enums/database_result_enum.dart';
import 'itd_event.dart';
import 'itd_state.dart';

class ItdBloc extends Bloc<ItdEvent, ItdState> {
  final ItdRepository _itdRepository;
  final UserRepository _userRepository;
  late StreamSubscription _userSubscription;

  ItdBloc({ItdRepository? itdRepository, UserRepository? userRepository})
      : _itdRepository = itdRepository ?? GetIt.I<ItdRepository>(),
        _userRepository = userRepository ?? GetIt.I<UserRepository>(),
        super(ItdState.initial()) {
    on<ItdInitializeEvent>(_onInitialize);
    on<ItdNextPageEvent>(_onNextPage);
    on<ItdUserChangedEvent>(_onUserChangedPage);
    on<ItdAddNoteEvent>((event, emit) => _handleNoteOperation(
        emit: emit, note: event.itdNote, operation: NoteOperation.add));
    on<ItdDeleteNoteEvent>((event, emit) => _handleNoteOperation(
        emit: emit, note: event.itdNote, operation: NoteOperation.remove));
    on<ItdUpdateNoteEvent>((event, emit) => _handleNoteOperation(
        emit: emit, note: event.itdNote, operation: NoteOperation.update));

    _userSubscription = _userRepository.onUserChanges
        .listen((user) => add(ItdUserChangedEvent(user: user)));
    add(ItdInitializeEvent());
  }

  Future<void> _onInitialize(
      ItdInitializeEvent event, Emitter<ItdState> emit) async {
    emit(ItdState.generalLoading());
    _itdRepository.resetPagination();
    final notesResult = await _itdRepository.nextItdPage();

    if (notesResult.status == DatabaseResultStatus.success) {
      emit(ItdState.contentLoaded(
          notes: notesResult.data!,
          hasMoreResults: notesResult.hasMoreResults,
          processingNotes: {}));
    } else {
      emit(ItdState.generalError(
          error: notesResult.error!, errorMessage: notesResult.errorMessage));
    }
  }

  void _onUserChangedPage(ItdUserChangedEvent event, Emitter<ItdState> emit) =>
      _onInitialize(ItdInitializeEvent(), emit);

  Future<void> _onNextPage(
      ItdNextPageEvent event, Emitter<ItdState> emit) async {
    var contentState = state.asContentState;
    if (contentState == null || !state.isEditAllowed) {
      debugPrint('Next page is not allowed at this state');
      return;
    }

    if (!contentState.hasMoreResults) return;

    var currentNotes = contentState.notes;
    emit(ItdState.loadingNextPage(
        notes: currentNotes,
        hasMoreResults: contentState.hasMoreResults,
        processingNotes: contentState.processingNotes));
    final notesResult = await _itdRepository.nextItdPage();

    if (notesResult.status == DatabaseResultStatus.success) {
      emit(ItdState.contentLoaded(
          notes: List<ItdNote>.from(currentNotes)..addAll(notesResult.data!),
          hasMoreResults: notesResult.hasMoreResults,
          processingNotes: contentState.processingNotes));
    } else {
      emit(ItdState.mutationResult(
          notes: currentNotes,
          result: ProcessingNote(
              message: "There was an error loading notes",
              status: ProcessingNoteStatus.error),
          hasMoreResults: contentState.hasMoreResults,
          processingNotes: contentState.processingNotes));
    }
  }

  Future<void> _handleNoteOperation(
      {required Emitter<ItdState> emit,
      required ItdNote note,
      required NoteOperation operation}) async {
    var contentState = state.asContentState;
    if (contentState == null || !state.isEditAllowed) {
      debugPrint('Edit is not allowed at this state');
      return;
    }

    var processingNote = contentState.processingNotes[note.id];
    if (processingNote != null &&
        processingNote.status == ProcessingNoteStatus.loading) {
      return;
    }
    var loadingList = List<ItdNote>.from(contentState.notes);

    String message;

    switch (operation) {
      case NoteOperation.update:
        var currentIndex =
            contentState.notes.indexWhere((element) => element.id == note.id);
        if (currentIndex != -1) loadingList[currentIndex] = note;
        message = 'Updating';
        break;
      case NoteOperation.add:
        loadingList.insert(0, note);
        message = 'Adding';
        break;
      case NoteOperation.remove:
        message = 'Removing';
        break;
    }

    var processingNotes = _copyProcessingNotes();
    processingNotes[note.id] =
        ProcessingNote(message: message, status: ProcessingNoteStatus.loading);

    emit(ItdState.processingMutation(
        notes: loadingList,
        hasMoreResults: contentState.hasMoreResults,
        processingNotes: processingNotes));

    switch (operation) {
      case NoteOperation.update:
        await _handleUpdateOperation(emit, note, contentState, loadingList);
        break;
      case NoteOperation.add:
        await _handleAddOperation(emit, note, contentState, loadingList);
        break;
      case NoteOperation.remove:
        await _handleDeleteOperation(emit, note, contentState, loadingList);
        break;
    }
  }

  Map<String, ProcessingNote> _copyProcessingNotes() {
    var currentState = state.asContentState;
    return currentState == null ? {} : Map.from(currentState.processingNotes);
  }

  Future<void> _handleAddOperation(Emitter<ItdState> emit, ItdNote note,
      ItdContentStateInterface contentState, List<ItdNote> loadingList) async {
    var result = await _itdRepository.addItdNote(note);
    ProcessingNote processingNote;
    List<ItdNote> finalList;
    var processingNotes = _copyProcessingNotes();
    if (result.status == DatabaseResultStatus.success && result.data != null) {
      //Removing processingNote with temp id
      processingNotes.remove(note.id);
      //Adding processingNote with permanent server id
      processingNote = ProcessingNote(
          message: "Successfully added", status: ProcessingNoteStatus.still);
      //Adding note from server to the previous list
      finalList = List<ItdNote>.from(contentState.notes)
        ..insert(0, result.data!);
    } else {
      processingNote = ProcessingNote(
          message: "There was an error adding the entry",
          status: ProcessingNoteStatus.error);
      finalList = loadingList;
    }
    processingNotes[result.data?.id ?? note.id] = processingNote;

    emit(ItdState.mutationResult(
        notes: finalList,
        processingNotes: processingNotes,
        result: processingNote,
        hasMoreResults: contentState.hasMoreResults));
  }

  Future<void> _handleUpdateOperation(Emitter<ItdState> emit, ItdNote note,
      ItdContentStateInterface contentState, List<ItdNote> loadingList) async {
    var result = await _itdRepository.updateItdNote(note);
    ProcessingNote processingNote;
    List<ItdNote> finalList;
    if (result.status == DatabaseResultStatus.success && result.data != null) {
      processingNote = ProcessingNote(
          message: "Successfully updated", status: ProcessingNoteStatus.still);
      finalList = List<ItdNote>.from(contentState.notes);
      var currentIndex =
          contentState.notes.indexWhere((element) => element.id == note.id);
      if (currentIndex != -1) finalList[currentIndex] = result.data!;
    } else {
      processingNote = ProcessingNote(
          message: "There was an error updating the entry",
          status: ProcessingNoteStatus.error);
      finalList = loadingList;
    }
    var processingNotes = _copyProcessingNotes();
    processingNotes[note.id] = processingNote;

    emit(ItdState.mutationResult(
        notes: finalList,
        processingNotes: processingNotes,
        result: processingNote,
        hasMoreResults: contentState.hasMoreResults));
  }

  Future<void> _handleDeleteOperation(Emitter<ItdState> emit, ItdNote note,
      ItdContentStateInterface contentState, List<ItdNote> loadingList) async {
    var result = await _itdRepository.removeItdNote(note);
    ProcessingNote processingNote;
    List<ItdNote> finalList;
    var processingNotes = _copyProcessingNotes();
    if (result.status == DatabaseResultStatus.success) {
      processingNotes.remove(note.id);
      //We remove it from processingNotes Map because the note was removed and we will pass processingNote to the state for notification only
      processingNote = ProcessingNote(
          message: "Successfully removed", status: ProcessingNoteStatus.still);
      finalList = List<ItdNote>.from(contentState.notes)
        ..removeWhere((element) => element.id == note.id);
    } else {
      processingNote = ProcessingNote(
          message: "There was an error removing the entry",
          status: ProcessingNoteStatus.error);
      processingNotes[note.id] = processingNote;
      finalList = loadingList;
    }

    emit(ItdState.mutationResult(
        notes: finalList,
        processingNotes: processingNotes,
        result: processingNote,
        hasMoreResults: contentState.hasMoreResults));
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
