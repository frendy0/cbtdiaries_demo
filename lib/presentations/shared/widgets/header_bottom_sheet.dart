import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderBottomSheet extends StatelessWidget {
  final EdgeInsets padding;
  final Widget? title;
  final bool lock;

  const HeaderBottomSheet(
      {super.key,
      this.title,
      this.lock = false,
      this.padding = const EdgeInsets.symmetric(vertical: 10, horizontal: 15)});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: padding,
        child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 25,
              ),
              Expanded(
                  child: Align(
                      child: DefaultTextStyle(
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                          child: title ?? Container()))),
              if (!lock)
                IconButton.filledTonal(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(
                    CupertinoIcons.xmark,
                    size: 20,
                  ),
                )
            ]));
  }
}
