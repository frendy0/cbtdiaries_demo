import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData mainLightTheme = ThemeData(
    colorScheme: mainColorScheme,
    useMaterial3: true,
    scaffoldBackgroundColor: mobileBackgroundColor,
    tabBarTheme: TabBarTheme(
      dividerHeight: 0,
      labelColor: mainColorScheme.onSurface,
      indicator: BoxDecoration(
          color: mainColorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(50)),
      indicatorSize: TabBarIndicatorSize.tab,
    ),
    cupertinoOverrideTheme: const NoDefaultCupertinoThemeData(
        barBackgroundColor: barBackgroundColor,
        primaryColor: Colors.black,
        scaffoldBackgroundColor: mobileBackgroundColor),
    primaryColor: primaryColor);
