import 'package:cbtdiaries_demo/domain/itd/entities/itd_note_model.dart';

List<ItdNote> generateTestItdNotesList(int length, {String prefix = ''}) =>
    List.generate(
        length,
        (i) => ItdNote(
            situation:
                List.generate(5, (j) => "Situation:$j for note: $prefix#$i"),
            autoThoughts:
                List.generate(5, (j) => "Thought:$j for note: $prefix#$i"),
            emotions:
                List.generate(5, (j) => "Emotion:$j for note: $prefix#$i"),
            reactions:
                List.generate(5, (j) => "Reaction:$j for note: $prefix#$i"),
            response:
                List.generate(5, (j) => "Response:$j for note: $prefix#$i"),
            dateTime: DateTime.now().subtract(Duration(days: i)),
            title: 'This is test Title $prefix#$i',
            id: '${prefix}testid$i'));

ItdNote generateTestItdNote({String? id}) => ItdNote(
    situation: List.generate(5, (j) => "Test Situation:$j"),
    autoThoughts: List.generate(5, (j) => "Test Thought:$j"),
    emotions: List.generate(5, (j) => "Test Emotion:$j"),
    reactions: List.generate(5, (j) => "Test Reaction:$j"),
    response: List.generate(5, (j) => "Test Response:$j"),
    dateTime: DateTime(2022, 2, 14),
    title: "Test Title",
    id: id ?? "tmp123");
