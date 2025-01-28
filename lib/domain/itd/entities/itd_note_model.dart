class ItdNote {
  final String id;
  final List<String> situation;
  final List<String> autoThoughts;
  final List<String> emotions;
  final List<String> reactions;
  final List<String> response;
  final String title;
  final DateTime dateTime;

  ItdNote(
      {required this.situation,
      required this.autoThoughts,
      required this.emotions,
      required this.reactions,
      required this.response,
      required this.dateTime,
      required this.title,
      required this.id});

  ItdNote copyWith({
    String? id,
    List<String>? situation,
    List<String>? autoThoughts,
    List<String>? emotions,
    List<String>? reactions,
    List<String>? response,
    String? title,
    DateTime? dateTime,
  }) {
    return ItdNote(
      id: id ?? this.id,
      situation: situation ?? List.from(this.situation),
      autoThoughts: autoThoughts ?? List.from(this.autoThoughts),
      emotions: emotions ?? List.from(this.emotions),
      reactions: reactions ?? List.from(this.reactions),
      response: response ?? List.from(this.response),
      title: title ?? this.title,
      dateTime: dateTime ?? this.dateTime,
    );
  }
}
