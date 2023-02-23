import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HttpException implements Exception {
  HttpException(this.statusCode, this.message);

  final int statusCode;
  final String? message;

  @override
  String toString() => 'HttpException: $statusCode - $message';
}

class HttpExceptionNotifyUser {
  static Future<void> showError(String message) async {
    await Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 6,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static Future<T> run<T>(Future<T> Function() f) async {
    try {
      return await f();
    } on HttpException catch (e) {
      final message = '${e.statusCode} --- ${e.message}';
      await showError(message);
      rethrow;
    }
  }
}
