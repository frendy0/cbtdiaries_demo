import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import '../themes/colors.dart';
import 'bouncing_widget.dart';

class MultiLineField extends StatefulWidget {
  final List<TextEditingController> lines;

  const MultiLineField({super.key, required this.lines});

  @override
  State<StatefulWidget> createState() => MultiLineFieldState();
}

class MultiLineFieldState extends State<MultiLineField>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 300), value: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < widget.lines.length; i++)
          if (i < widget.lines.length - 1) ...[
            _buildField(i),
            const SizedBox(height: 2)
          ] else
            AnimatedBuilder(
                builder: (context, child) {
                  if (_animationController.isCompleted) return child!;

                  return Opacity(
                      opacity: _animationController.value,
                      child: SizedBox(
                          height: _animationController.value * 34,
                          child: child!));
                },
                animation: _animationController,
                child: _buildField(i)),
        const SizedBox(
          height: 15,
        ),
        Bouncing(
          key: ValueKey('multiLineFieldAddNewLineButton'),
          onPress: () {
            _addNewLine();
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: primaryColor, width: 3)),
            child: const Text(
              'New line',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildField(int i) {
    return TextField(
      cursorColor: primaryColor,
      controller: widget.lines[i],
      minLines: 1,
      maxLines: 4,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: primaryColor, width: 2.0),
          ),
          prefixIcon: Text(
            '${i + 1}. ',
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
          suffixIconConstraints:
              const BoxConstraints(minWidth: 0, minHeight: 0),
          prefixIconConstraints:
              const BoxConstraints(minWidth: 0, minHeight: 0),
          isDense: true,
          contentPadding: const EdgeInsets.fromLTRB(0, 5, 5, 5)),
    );
  }

  void _addNewLine() {
    if (widget.lines.length > 30) {
      showOkAlertDialog(
          context: context,
          title: 'Информация',
          message: 'Можно добавить только до 30 элементов списка');
      return;
    }

    setState(() {
      widget.lines.add(TextEditingController());
    });
    _animationController.forward(from: 0);
  }
}
