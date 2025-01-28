import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/widgets/bouncing_widget.dart';

class CustomBottomNavBar extends StatefulWidget {
  final List<BottomNavigationBarItem> items;
  final int currentIndex;
  final Color backgroundColor;
  final Function(int i) onTap;

  const CustomBottomNavBar(
      {super.key,
      required this.items,
      required this.currentIndex,
      this.backgroundColor = const Color(0x99FFFFFF),
      required this.onTap});

  @override
  State<StatefulWidget> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(color: widget.backgroundColor),
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              color: Colors.grey.shade200, width: 1))),
                  child: Row(children: [
                    for (int i = 0; i < widget.items.length; i++)
                      _CustomBottomBarButton(
                          selected: widget.currentIndex == i,
                          onTap: () {
                            widget.onTap(i);
                          },
                          backgroundColor:
                              widget.items[i].backgroundColor ?? Colors.white,
                          child: widget.items[i].icon)
                  ]))),
        ));
  }
}

class _CustomBottomBarButton extends StatefulWidget {
  final Widget child;
  final Color backgroundColor;
  final bool selected;
  final Function() onTap;

  const _CustomBottomBarButton(
      {super.key,
      required this.child,
      required this.onTap,
      required this.selected,
      required this.backgroundColor});

  @override
  State<StatefulWidget> createState() => _CustomBottomBarButtonState();
}

class _CustomBottomBarButtonState extends State<_CustomBottomBarButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Bouncing(
            onPress: widget.onTap,
            child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: widget.selected
                        ? widget.backgroundColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(20)),
                child: IconTheme(
                    data: IconThemeData(
                        size: 33,
                        color:
                            widget.selected ? Colors.white : Color(0xFFA5A5A5)),
                    child: widget.child))));
  }
}
