import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../domain/itd/entities/itd_note_model.dart';
import 'itd_note_firestore_dto.dart';

class ItdNoteFirestoreMapper {
  static ItdNote toDomain(ItdNoteFirestoreDto dto) {
    return ItdNote(
      id: dto.id,
      title: dto.title,
      situation: dto.situation.map((e) => e.toString()).toList(),
      autoThoughts: dto.autoThoughts.map((e) => e.toString()).toList(),
      emotions: dto.emotions.map((e) => e.toString()).toList(),
      reactions: dto.reactions.map((e) => e.toString()).toList(),
      response: dto.response.map((e) => e.toString()).toList(),
      dateTime: dto.dateTime.toDate(),
    );
  }

  static ItdNoteFirestoreDto fromDomain(ItdNote note) {
    return ItdNoteFirestoreDto(
        id: note.id,
        title: note.title,
        situation: note.situation,
        autoThoughts: note.autoThoughts,
        emotions: note.emotions,
        reactions: note.reactions,
        response: note.response,
        dateTime: Timestamp.fromDate(note.dateTime));
  }
}
