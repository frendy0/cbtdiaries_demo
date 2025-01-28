import 'package:flutter/cupertino.dart';

import '../../../core/utils/id_generator.dart';
import '../../../domain/itd/entities/itd_note_model.dart';

class ItdController {
  TextEditingController titleController;
  List<TextEditingController> situationControllers;
  List<TextEditingController> autoThoughtsControllers;
  List<TextEditingController> emotionsControllers;
  List<TextEditingController> reactionsControllers;
  List<TextEditingController> responseControllers;
  DateTime dateTime;
  String id;

  ItdController.fromModel(ItdNote itd)
      : situationControllers =
            itd.situation.map((a) => TextEditingController(text: a)).toList(),
        autoThoughtsControllers = itd.autoThoughts
            .map((a) => TextEditingController(text: a))
            .toList(),
        emotionsControllers =
            itd.emotions.map((a) => TextEditingController(text: a)).toList(),
        reactionsControllers =
            itd.reactions.map((a) => TextEditingController(text: a)).toList(),
        responseControllers =
            itd.response.map((a) => TextEditingController(text: a)).toList(),
        titleController = TextEditingController(text: itd.title),
        id = itd.id,
        dateTime = itd.dateTime;

  ItdController()
      : situationControllers =
            List.generate(3, (index) => TextEditingController()),
        autoThoughtsControllers =
            List.generate(3, (index) => TextEditingController()),
        emotionsControllers =
            List.generate(3, (index) => TextEditingController()),
        reactionsControllers =
            List.generate(3, (index) => TextEditingController()),
        responseControllers =
            List.generate(3, (index) => TextEditingController()),
        id = IdGenerator.generateTempId(),
        titleController = TextEditingController(),
        dateTime = DateTime.now();

  ItdNote toModel() => ItdNote(
      id: id,
      situation: situationControllers.map((e) => e.text).toList(),
      autoThoughts: autoThoughtsControllers.map((e) => e.text).toList(),
      emotions: emotionsControllers.map((e) => e.text).toList(),
      reactions: reactionsControllers.map((e) => e.text).toList(),
      response: responseControllers.map((e) => e.text).toList(),
      title: titleController.text,
      dateTime: dateTime);
}
