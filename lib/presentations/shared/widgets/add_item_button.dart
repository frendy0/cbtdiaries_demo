import 'package:flutter/material.dart';

import '../themes/colors.dart';
import 'bouncing_widget.dart';

class AddItemButton extends StatelessWidget {
  final Color? backgroundColor;
  final Widget? child;
  final Function() onPressed;
  final Color? textColor;

  const AddItemButton(
      {super.key,
      this.backgroundColor,
      this.child,
      required this.onPressed,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return Bouncing(
        onPress: onPressed,
        child: Container(
          height: 90,
          margin: const EdgeInsets.symmetric(horizontal: 25),
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 30),
          decoration: BoxDecoration(
              color: backgroundColor ?? primaryColor,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 9,
                    offset: Offset(0, 4))
              ],
              borderRadius: BorderRadius.circular(20)),
          child: child ??
              Text(
                "Add new note",
                style: TextStyle(
                    color: textColor ?? Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.w700),
              ),
        ));
  }
}
