import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget tosWidget(ThemeData _theme) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25.0),
    child: RichText(
      softWrap: true,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By creating an account, you agree to our ',
            style: _theme.textTheme.headline6,
          ),
          TextSpan(
            text: 'Terms of Service ',
            style: _theme.textTheme.headline5!.copyWith(
                fontWeight: FontWeight.bold, color: _theme.colorScheme.primary),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                launch('https://www.book.tenzi.africa/tos/');
              },
          ),
          TextSpan(
            text: 'and ',
            style: _theme.textTheme.headline6,
          ),
          TextSpan(
            text: 'Privacy Policy.',
            style: _theme.textTheme.headline5!.copyWith(
                fontWeight: FontWeight.bold, color: _theme.colorScheme.primary),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                launch('https://www.book.tenzi.africa/privacy-policy/');
              },
          ),
        ],
      ),
    ),
  );
}
