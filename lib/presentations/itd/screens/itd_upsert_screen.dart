import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cbtdiaries_demo/presentations/shared/widgets/multi_line_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

import '../../../domain/itd/entities/itd_note_model.dart';
import '../../shared/themes/colors.dart';
import '../../shared/widgets/html_asset_widget.dart';
import '../../shared/widgets/select_datetime_widget.dart';
import '../../shared/widgets/tabs_app_bar.dart';
import '../bloc/itd_bloc.dart';
import '../bloc/itd_event.dart';
import '../controllers/itd_controller.dart';

class ItdAddScreen extends StatefulWidget {
  final ItdNote? itdNote;

  const ItdAddScreen({super.key, this.itdNote});

  @override
  State<StatefulWidget> createState() => _ItdAddScreenState();
}

class _ItdAddScreenState extends State<ItdAddScreen> {
  late ItdController controller;
  int stage = -1;
  late final Widget accordion = _buildAccordion();
  double heightContainer = 120;

  @override
  void initState() {
    controller = widget.itdNote == null
        ? ItdController()
        : ItdController.fromModel(widget.itdNote!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          var value = await showOkCancelAlertDialog(
              context: context,
              title: 'Exit',
              message:
                  'Are you sure you want to exit? Unsaved changes will be lost.',
              okLabel: 'Exit',
              cancelLabel: 'Cancel',
              isDestructiveAction: true);

          if (value.index == 1) {
            return false;
          }
          return true;
        },
        child: DefaultTabController(
            length: 2,
            initialIndex: 1,
            child: GestureDetector(
                onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                child: Scaffold(
                    extendBodyBehindAppBar: true,
                    appBar: TabsAppBar(
                      toolBarHeight: MediaQuery.of(context).padding.top,
                      actions: [
                        if (widget.itdNote != null)
                          CupertinoButton(
                            padding: const EdgeInsets.only(right: 12),
                            onPressed: _share,
                            minSize: 10,
                            child: const Icon(
                              CupertinoIcons.share,
                              color: Colors.black,
                              size: 25,
                            ),
                          ),
                        CupertinoButton(
                          pressedOpacity: 0.8,
                          onPressed: _save,
                          key: ValueKey('itdUpsertScreenSaveButton'),
                          minSize: 10,
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            "Save",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ),
                      ],
                      bottom: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: tabBarBackground,
                                  borderRadius: BorderRadius.circular(50)),
                              child: TabBar(
                                  splashBorderRadius: BorderRadius.circular(50),
                                  tabs: [
                                    Tab(
                                      text: "Description",
                                    ),
                                    Tab(text: "Practice")
                                  ]))),
                    ),
                    body: TabBarView(children: [
                      SingleChildScrollView(
                          child: Padding(
                        padding: EdgeInsets.only(
                            left: 15,
                            right: 15,
                            top: MediaQuery.of(context).padding.top +
                                kMinInteractiveDimensionCupertino +
                                68 +
                                10,
                            bottom: MediaQuery.of(context).padding.bottom + 15),
                        child: HtmlAssetWidget(
                            filePath: 'assets/content/itd.html'),
                      )),
                      SingleChildScrollView(
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: 15,
                                right: 15,
                                top: MediaQuery.of(context).padding.top +
                                    kMinInteractiveDimensionCupertino +
                                    68 +
                                    10,
                                bottom:
                                    MediaQuery.of(context).padding.bottom + 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                SelectDateTimeWidget(
                                    initialDatetime: controller.dateTime,
                                    dateFormat: "MMM dd, yyyy",
                                    onChanged: (DateTime date) {
                                      controller.dateTime = date;
                                    }),
                                const SizedBox(
                                  height: 15,
                                ),
                                accordion
                              ],
                            )),
                      )
                    ])))));
  }

  Widget _buildAccordion() {
    return Accordion(
        maxOpenSections: 2,
        scaleWhenAnimating: false,
        headerPadding: EdgeInsets.all(10),
        paddingListHorizontal: 0,
        paddingListTop: 0,
        paddingListBottom: 0,
        headerBackgroundColor: primaryLightColor,
        contentBorderColor: Colors.grey.shade200,
        disableScrolling: true,
        rightIcon: const Icon(Icons.keyboard_arrow_down),
        openAndCloseAnimation: true,
        sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
        sectionClosingHapticFeedback: SectionHapticFeedback.light,
        children: [
          AccordionSection(
              isOpen: true,
              paddingBetweenOpenSections: 15,
              paddingBetweenClosedSections: 15,
              header: const Text('Title',
                  style: TextStyle(fontWeight: FontWeight.w700)),
              content: TextField(
                key: const ValueKey("titleTextField"),
                cursorColor: primaryColor,
                controller: controller.titleController,
                textCapitalization: TextCapitalization.sentences,
                maxLines: 1,
                style: const TextStyle(fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                    hintText: 'Write here...',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primaryColor, width: 2.0),
                    ),
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(0, 5, 5, 5)),
              )),
          AccordionSection(
              isOpen: true,
              paddingBetweenOpenSections: 15,
              paddingBetweenClosedSections: 15,
              header: const Text('Situation',
                  style: TextStyle(fontWeight: FontWeight.w700)),
              content: Column(children: [
                Text(
                    'Describe the event or trigger that led to your thoughts and feelings.',
                    style: TextStyle(fontSize: 14, color: Color(0xFF686868))),
                MultiLineField(
                    key: const ValueKey("situationTextField"),
                    lines: controller.situationControllers)
              ])),
          AccordionSection(
              isOpen: true,
              paddingBetweenOpenSections: 15,
              paddingBetweenClosedSections: 15,
              header: const Text('Automatic Thoughts',
                  style: TextStyle(fontWeight: FontWeight.w700)),
              content: Column(children: [
                Text(
                    'What thoughts automatically came to your mind? Are there any patterns or assumptions?',
                    style: TextStyle(fontSize: 14, color: Color(0xFF686868))),
                MultiLineField(
                    key: const ValueKey("thoughtsTextField"),
                    lines: controller.autoThoughtsControllers)
              ])),
          AccordionSection(
              isOpen: true,
              paddingBetweenOpenSections: 15,
              paddingBetweenClosedSections: 15,
              header: const Text('Emotions',
                  style: TextStyle(fontWeight: FontWeight.w700)),
              content: Column(children: [
                Text(
                    'What were you feeling? Rate the intensity of your emotion from 0 to 10.',
                    style: TextStyle(fontSize: 14, color: Color(0xFF686868))),
                MultiLineField(
                    key: const ValueKey("emotionsTextField"),
                    lines: controller.emotionsControllers)
              ])),
          AccordionSection(
              isOpen: true,
              paddingBetweenOpenSections: 15,
              paddingBetweenClosedSections: 15,
              header: const Text('Reactions',
                  style: TextStyle(fontWeight: FontWeight.w700)),
              content: Column(children: [
                Text(
                    'How did you react? What actions or physical sensations did you experience?',
                    style: TextStyle(fontSize: 14, color: Color(0xFF686868))),
                MultiLineField(
                    key: const ValueKey("reactionsTextField"),
                    lines: controller.reactionsControllers)
              ])),
          AccordionSection(
              isOpen: true,
              paddingBetweenOpenSections: 15,
              paddingBetweenClosedSections: 15,
              header: const Text('Adaptive Response',
                  style: TextStyle(fontWeight: FontWeight.w700)),
              content: Column(children: [
                Text(
                    'What could you tell yourself instead? How could you challenge your negative thoughts?',
                    style: TextStyle(fontSize: 14, color: Color(0xFF686868))),
                MultiLineField(
                    key: const ValueKey("responseTextField"),
                    lines: controller.responseControllers)
              ])),
        ]);
  }

  void _share() async {
    StringBuffer text = StringBuffer();
    text.writeln("Title: ${controller.titleController.text}");
    text.writeln(
        "Date/Time: ${DateFormat("MMM dd, yyyy").format(controller.dateTime)}");
    text.writeln("Situation:");
    for (int i = 0; i < controller.situationControllers.length; i++) {
      text.writeln("${i + 1}. ${controller.situationControllers[i].text}");
    }
    text.writeln("Automatic Thoughts:");
    for (int i = 0; i < controller.autoThoughtsControllers.length; i++) {
      text.writeln("${i + 1}. ${controller.autoThoughtsControllers[i].text}");
    }
    text.writeln("Emotions:");
    for (int i = 0; i < controller.emotionsControllers.length; i++) {
      text.writeln("${i + 1}. ${controller.emotionsControllers[i].text}");
    }
    text.writeln("Reactions:");
    for (int i = 0; i < controller.reactionsControllers.length; i++) {
      text.writeln("${i + 1}. ${controller.reactionsControllers[i].text}");
    }
    text.writeln("Adaptive Response:");
    for (int i = 0; i < controller.responseControllers.length; i++) {
      text.writeln("${i + 1}. ${controller.responseControllers[i].text}");
    }
    await Share.share(text.toString(), subject: "CBT Thought Record");
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _save() async {
    var itdBloc = context.read<ItdBloc>();

    var itdNote = controller.toModel();
    widget.itdNote != null
        ? itdBloc.add(ItdUpdateNoteEvent(itdNote: itdNote))
        : itdBloc.add(ItdAddNoteEvent(itdNote: itdNote));
    Navigator.pop(context);
  }
}
