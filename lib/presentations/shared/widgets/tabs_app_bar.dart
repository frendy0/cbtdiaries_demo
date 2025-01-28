import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;
  final Widget bottom;
  final double extendedHeight;
  final double toolBarHeight;

  const TabsAppBar(
      {super.key,
      this.title,
      this.actions,
      this.extendedHeight = 68,
      this.toolBarHeight = 0,
      this.leading,
      required this.bottom});

  @override
  Widget build(BuildContext context) {
    final ModalRoute<dynamic>? currentRoute = ModalRoute.of(context);
    return PreferredSize(
        preferredSize: Size.fromHeight(
            toolBarHeight + kMinInteractiveDimensionCupertino + extendedHeight),
        child: SizedBox(
            height: toolBarHeight +
                kMinInteractiveDimensionCupertino +
                extendedHeight,
            child: CupertinoNavigationBar(
                backgroundColor: Colors.white54,
                transitionBetweenRoutes: false,
                middle: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(mainAxisSize: MainAxisSize.max, children: [
                        Expanded(
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: currentRoute?.canPop == true
                                    ? CupertinoNavigationBarBackButton()
                                    : null)),
                        if (title != null)
                          Expanded(
                              child: ConstrainedBox(
                                  constraints:
                                      const BoxConstraints(maxHeight: 36),
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: DefaultTextStyle(
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black),
                                          child: title!)))),
                        Expanded(
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                              if (actions != null)
                                for (var action in actions!) ...[
                                  action,
                                  SizedBox(width: 5)
                                ]
                            ]))
                      ]),
                      ConstrainedBox(
                          constraints:
                              BoxConstraints(maxHeight: extendedHeight),
                          child: Material(
                            color: Colors.transparent,
                            child: bottom,
                          ))
                    ]),
                automaticallyImplyLeading: false,
                automaticallyImplyMiddle: false)));
  }

  @override
  Size get preferredSize => Size.fromHeight(
      toolBarHeight + kMinInteractiveDimensionCupertino + extendedHeight);
}
