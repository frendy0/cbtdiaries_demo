import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../themes/colors.dart';
import 'bouncing_widget.dart';

class SelectDateTimeWidget extends StatefulWidget {
  final DateTime initialDatetime;
  final Function(DateTime) onChanged;
  final String? dateFormat;

  const SelectDateTimeWidget(
      {super.key,
      required this.initialDatetime,
      required this.onChanged,
      this.dateFormat = 'MMM dd'});

  @override
  State<StatefulWidget> createState() => _SelectDateTimeWidgetState();
}

class _SelectDateTimeWidgetState extends State<SelectDateTimeWidget> {
  late DateTime _currentDateTime;

  @override
  void initState() {
    _currentDateTime = widget.initialDatetime;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () =>
          Platform.isIOS ? _cupertinoPicker(context) : _materialPicker(context),
      minSize: 12,
      padding: EdgeInsets.zero,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
              height: 22,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  DateFormat('MMM dd, yyyy').format(_currentDateTime),
                  style: const TextStyle(
                      fontSize: 19, fontWeight: FontWeight.w600),
                ),
              )),
          SizedBox(width: 5),
          const Icon(Icons.keyboard_arrow_down_outlined)
        ],
      ),
    );
  }

  void _materialPicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: widget.initialDatetime,
        cancelText: 'CANCEL',
        helpText: 'SELECT DATE',
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null) {
      widget.onChanged(picked);
      _currentDateTime = picked;
      setState(() {});
    }
  }

  void _cupertinoPicker(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext builder) {
          return Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom),
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.4,
              child: Column(children: [
                Expanded(
                    child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: (value) {
                          widget.onChanged(value);
                          _currentDateTime = value;
                        },
                        initialDateTime: widget.initialDatetime,
                        minimumYear: 2000,
                        maximumYear: 3000)),
                Bouncing(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: primaryColor, width: 3)),
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    child: const Text(
                      'Select',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  onPress: () {
                    setState(() {});
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: 15,
                )
              ]));
        });
  }
}
