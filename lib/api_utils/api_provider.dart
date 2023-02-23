import 'dart:io';

import 'package:cashbook/api_utils/api_settings.dart';
import 'package:cashbook/api_utils/authentication_interceptor.dart';
import 'package:cashbook/generated_api_code/api_client.swagger.dart';
import 'package:cashbook/helpers/shared_preferences_helper.dart';
import 'package:chopper/chopper.dart';

import '../service_locator.dart';

class ApiProvider {
  ApiClient apiClient;
  ApiSettings apiSettings;
  String accessToken;

  ApiProvider({
    required this.apiSettings,
    required this.accessToken,
  }) : apiClient = ApiClient.create(
          ChopperClient(
            interceptors: [
              AuthenticationInterceptor(
                // apiSettings.apiKey,
                () => 'Bearer $accessToken',
              ),
              HttpLoggingInterceptor(),
            ],
            converter: $JsonSerializableConverter(),
            errorConverter: $JsonSerializableConverter(),
            baseUrl: apiSettings.endpoint,
          ),
        );

  Future<void> initAgain() async {
    String accessToken = await getIt<SharedPreferencesHelper>().getToken();
    apiClient = ApiClient.create(
      ChopperClient(
        interceptors: [
          AuthenticationInterceptor(
            // apiSettings.apiKey,
            () => 'Bearer $accessToken',
          ),
          HttpLoggingInterceptor(),
        ],
        converter: $JsonSerializableConverter(),
        errorConverter: $JsonSerializableConverter(),
        baseUrl: apiSettings.endpoint,
      ),
    );
  }
}
