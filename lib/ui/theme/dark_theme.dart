import 'package:flutter/material.dart';
import './text_theme.dart';

Color primaryColor = Colors.blue.shade900;
Color accentColor = Colors.grey.withAlpha(30);
Color primaryTextColor = Colors.white70;

ThemeData darkTheme(BuildContext context) => ThemeData(
      colorScheme: const ColorScheme.dark()
          .copyWith(primary: primaryColor, secondary: accentColor),
      primaryColor: primaryColor,
      primaryColorBrightness: Brightness.dark,
      primaryColorLight: Colors.blue.shade900,
      cardColor: accentColor,
      scaffoldBackgroundColor: Colors.black87,
      iconTheme: const IconThemeData(color: Colors.blue),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(TextStyle(
            fontSize: 14,
            color: primaryTextColor,
          )),
          foregroundColor: MaterialStateProperty.all(
            primaryColor,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(12.0)),
          textStyle: MaterialStateProperty.all(
            TextStyle(
              fontSize: 16,
              color: primaryTextColor,
            ),
          ),
          foregroundColor: MaterialStateProperty.all(primaryTextColor),
          backgroundColor: MaterialStateProperty.all(primaryColor),
        ),
      ),
      fontFamily: 'Quicksand',
      textTheme:
          ThemeData.dark().textTheme.merge(customTextTheme(primaryTextColor)),
    );
