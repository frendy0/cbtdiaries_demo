import '../enums/processing_note_status.dart';

class ProcessingNote {
  final String message;
  final ProcessingNoteStatus status;

  ProcessingNote({required this.message, required this.status});
}
