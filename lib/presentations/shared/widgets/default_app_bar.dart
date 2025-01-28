import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../themes/colors.dart';
import '../themes/text_styles.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;

  const DefaultAppBar({super.key, this.title, this.actions, this.leading});

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
        middle: title != null
            ? DefaultTextStyle(style: appBarDefaultTitle, child: title!)
            : null,
        border: null,
        backgroundColor: appBarBackgroundColor,
        leading: leading,
        transitionBetweenRoutes: false,
        trailing: actions != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                    for (var a in actions!) ...[SizedBox(width: 5), a]
                  ])
            : null);
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
