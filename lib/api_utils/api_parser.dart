import 'package:cashbook/api_utils/http_exception.dart';
import 'package:chopper/chopper.dart';

class ApiSuccessParser {
  static bool isSuccessfulWithPayload(Response<dynamic> response) {
    return response.isSuccessful &&
        response.body != null &&
        response.body?.payload != null;
  }

  static T payloadOrThrow<T>(Response<dynamic> response) {
    if (isSuccessfulWithPayload(response)) {
      return response.body.payload;
    }
    throw HttpException(
        response.statusCode, ApiErrorParser.message(response.error));
  }

  static Future<T> payloadOrThrowWithMessage<T>(
      Response<dynamic> response) async {
    try {
      return payloadOrThrow(response);
    } on HttpException catch (e) {
      final message = '${e.statusCode} --- ${e.message ?? ''}';
      await HttpExceptionNotifyUser.showError(message);
      rethrow;
    }
  }

  static void isSuccessfulOrThrowWithMessage(Response<dynamic> response) async {
    print('is success: ${response.isSuccessful}');
    if (!response.isSuccessful) {
      final message =
          '${response.statusCode} --- ${ApiErrorParser.message(response.error) ?? ''}';
      print('message from isSuccessfulOrThrowWithMessage: $message');
      await HttpExceptionNotifyUser.showError(message);
      throw HttpException(response.statusCode, message);
    }
  }
}

class ApiErrorParser {
  static String? message(dynamic apiError) {
    if (apiError is String) {
      return apiError;
    } else if (apiError is Map<String, dynamic>) {
      return apiError['message'];
    }
    return null;
  }
}
