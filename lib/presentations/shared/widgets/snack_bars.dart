import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum TypeSnackBar {
  error(
      backgroundColor: Color(0xFFf5e2dd),
      primaryColor: Color(0xffe32e1d),
      icon: CupertinoIcons.xmark_circle_fill),
  success(
      backgroundColor: Color(0xffdbfae6),
      primaryColor: Color(0xff14a244),
      icon: CupertinoIcons.checkmark_alt_circle_fill),
  warning(
      backgroundColor: Color(0xfff6e6cf),
      primaryColor: Color(0xffd07a10),
      icon: CupertinoIcons.exclamationmark_triangle_fill),
  info(
      backgroundColor: Color(0xffe2ebf5),
      primaryColor: Color(0xff2870c7),
      icon: CupertinoIcons.info_circle_fill),
  neutral(
      backgroundColor: Color(0xffe8e8e8),
      primaryColor: Color(0xff424242),
      icon: CupertinoIcons.arrow_clockwise_circle_fill);

  final Color backgroundColor;
  final Color primaryColor;
  final IconData icon;

  const TypeSnackBar(
      {required this.backgroundColor,
      required this.primaryColor,
      required this.icon});
}

class CustomSnackBar extends SnackBar {
  final TypeSnackBar typeSnackBar;
  final String text;
  final IconData? customIcon;

  CustomSnackBar(
      {super.key,
      required this.typeSnackBar,
      required this.text,
      this.customIcon,
      super.action,
      super.duration = const Duration(seconds: 2),
      super.behavior = SnackBarBehavior.floating,
      super.margin = const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      super.elevation = 0.5,
      super.showCloseIcon,
      super.padding})
      : super(
            content: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  customIcon ?? typeSnackBar.icon,
                  color: typeSnackBar.primaryColor,
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                    child: Text(
                  text,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: typeSnackBar.primaryColor),
                ))
              ],
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            closeIconColor: typeSnackBar.primaryColor,
            backgroundColor: typeSnackBar.backgroundColor);
}
