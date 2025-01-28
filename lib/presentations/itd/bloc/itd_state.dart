import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import '../../../core/models/processing_note.dart';
import '../../../domain/itd/entities/itd_note_model.dart';

part 'itd_state.freezed.dart';

abstract class ItdContentStateInterface {
  List<ItdNote> get notes;

  bool get hasMoreResults;

  Map<String, ProcessingNote> get processingNotes;
}

@freezed
class ItdState with _$ItdState {
  const ItdState._();

  const factory ItdState.initial() = _Initial;

  const factory ItdState.generalLoading() = _GeneralLoading;

  const factory ItdState.generalError({
    required String error,
    String? errorMessage,
  }) = _GeneralError;

  @Implements<ItdContentStateInterface>()
  const factory ItdState.contentLoaded({
    required List<ItdNote> notes,
    required bool hasMoreResults,
    required Map<String, ProcessingNote> processingNotes,
  }) = _ContentLoaded;

  @Implements<ItdContentStateInterface>()
  const factory ItdState.loadingNextPage({
    required List<ItdNote> notes,
    required bool hasMoreResults,
    required Map<String, ProcessingNote> processingNotes,
  }) = _LoadingNextPage;

  @Implements<ItdContentStateInterface>()
  const factory ItdState.processingMutation({
    required List<ItdNote> notes,
    required bool hasMoreResults,
    required Map<String, ProcessingNote> processingNotes,
  }) = _LoadingMutation;

  @Implements<ItdContentStateInterface>()
  const factory ItdState.mutationResult({
    required List<ItdNote> notes,
    required bool hasMoreResults,
    required Map<String, ProcessingNote> processingNotes,
    required ProcessingNote result,
  }) = _MutationResult;

  bool get isContentState => map(
      contentLoaded: (_) => true,
      loadingNextPage: (_) => true,
      processingMutation: (_) => true,
      mutationResult: (_) => true,
      initial: (_) => false,
      generalLoading: (_) => false,
      generalError: (_) => false);

  bool get isEditAllowed => map(
      contentLoaded: (_) => true,
      loadingNextPage: (_) => false,
      processingMutation: (_) => true,
      mutationResult: (_) => true,
      initial: (_) => false,
      generalLoading: (_) => false,
      generalError: (_) => false);
}

extension ItdStateExtension on ItdState {
  ItdContentStateInterface? get asContentState {
    return maybeMap<ItdContentStateInterface?>(
      contentLoaded: (s) => s,
      processingMutation: (s) => s,
      mutationResult: (s) => s,
      orElse: () => null,
    );
  }
}
