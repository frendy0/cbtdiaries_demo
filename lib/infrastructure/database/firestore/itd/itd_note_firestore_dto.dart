import 'package:cloud_firestore/cloud_firestore.dart';

class ItdNoteFirestoreDto {
  final String id;
  final String title;
  final List situation;
  final List autoThoughts;
  final List emotions;
  final List reactions;
  final List response;
  final Timestamp dateTime;

  ItdNoteFirestoreDto(
      {required this.situation,
      required this.autoThoughts,
      required this.emotions,
      required this.reactions,
      required this.response,
      required this.dateTime,
      required this.title,
      required this.id});

  factory ItdNoteFirestoreDto.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ItdNoteFirestoreDto(
      id: doc.id,
      title: data['title'],
      situation: data['situation'] as List,
      autoThoughts: data['auto_thoughts'] as List,
      emotions: data['emotions'] as List,
      reactions: data['reactions'] as List,
      response: data['response'] as List,
      dateTime: data['date_time'] as Timestamp,
    );
  }

  Map<String, dynamic> toJson() => {
        "situation": situation,
        "auto_thoughts": autoThoughts,
        "emotions": emotions,
        "reactions": reactions,
        "response": response,
        "date_time": dateTime,
        "title": title
      };
}
