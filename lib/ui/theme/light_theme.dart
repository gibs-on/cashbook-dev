import 'package:flutter/material.dart';
import './text_theme.dart';

Color primaryColor = const Color(0xff3d304f);
Color accentColor = Colors.white;
Color primaryTextColor = const Color(0xff111111);

ThemeData lightTheme(BuildContext context) => ThemeData(
      colorScheme: const ColorScheme.light()
          .copyWith(primary: primaryColor, secondary: accentColor),
      primaryColor: primaryColor,
      primaryColorBrightness: Brightness.light,
      primaryColorLight: Colors.blue.shade100,
      cardColor: accentColor,
      scaffoldBackgroundColor: Colors.white.withAlpha(240),
      iconTheme: IconThemeData(color: primaryColor),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              textStyle:
                  MaterialStateProperty.all(const TextStyle(fontSize: 14)),
              foregroundColor: MaterialStateProperty.all(primaryColor))),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              padding: MaterialStateProperty.all(const EdgeInsets.all(12.0)),
              textStyle: MaterialStateProperty.all(
                const TextStyle(
                  fontSize: 14,
                ),
              ),
              foregroundColor: MaterialStateProperty.all(accentColor),
              backgroundColor: MaterialStateProperty.all(primaryColor))),
      fontFamily: 'OpenSans',
      textTheme:
          ThemeData.light().textTheme.merge(customTextTheme(primaryTextColor)),
    );
