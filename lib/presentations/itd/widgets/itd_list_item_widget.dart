import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../core/enums/processing_note_status.dart';
import '../../../domain/itd/entities/itd_note_model.dart';
import '../../shared/widgets/bouncing_widget.dart';

class ItdListItem extends StatelessWidget {
  final ItdNote note;
  final ProcessingNoteStatus status;
  final Function() onLongPress;
  final bool selected;
  final Function() onPress;

  const ItdListItem(
      {super.key,
      required this.note,
      this.status = ProcessingNoteStatus.still,
      required this.onLongPress,
      required this.selected,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Bouncing(
        onLongPress: onLongPress,
        onPress: onPress,
        disabled: selected,
        child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                    blurRadius: 7, color: Colors.black12, offset: Offset(0, 4))
              ],
            ),
            child: Stack(children: [
              Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              note.dateTime.day.toString(),
                              style: const TextStyle(
                                  fontSize: 22,
                                  height: 1.4,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            Text(
                              ' ${DateFormat('MMM').format(note.dateTime)}.',
                              style: const TextStyle(
                                  fontSize: 14,
                                  height: 1,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: ConstrainedBox(
                                    constraints:
                                        const BoxConstraints(maxHeight: 40),
                                    child: Text(note.title,
                                        overflow: TextOverflow.fade,
                                        softWrap: true)))
                          ],
                        )),
                        _buildStatusIndicator() ?? Container()
                      ])),
              if (selected)
                Positioned.fill(
                    child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0x7BB6B6B6)),
                ))
            ])));
  }

  Widget? _buildStatusIndicator() {
    Widget? indicator;
    switch (status) {
      case ProcessingNoteStatus.loading:
        indicator = SizedBox(
            width: 25,
            height: 25,
            child: CircularProgressIndicator(color: Color(0xFFDADADA)));
        break;
      case ProcessingNoteStatus.error:
        indicator = Icon(Icons.error, color: Colors.redAccent, size: 30);
      default:
        indicator = null;
    }
    if (indicator != null) {
      return SizedBox(
          width: 35,
          child: Align(alignment: Alignment.centerRight, child: indicator));
    }
    return null;
  }
}
