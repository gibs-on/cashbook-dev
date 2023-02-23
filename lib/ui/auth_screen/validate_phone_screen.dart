import 'package:cashbook/constants/function_response.dart';
import 'package:cashbook/stores/auth_store.dart';
import 'package:cashbook/ui/auth_screen/login_screen.dart';
import 'package:cashbook/ui/auth_screen/register_screen.dart';
import 'package:cashbook/utils/connectivity_helper.dart';
import 'package:cashbook/utils/custom_alerts.dart';
import 'package:cashbook/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../service_locator.dart';

class ValidatePhoneScreen extends StatelessWidget {
  static const routeName = '/validate-phone-screen';

  final _formKey = GlobalKey<FormState>();

  final CustomValidator customValidator = getIt<CustomValidator>();
  final AuthStore _authStore = getIt<AuthStore>();

  Map<String, dynamic> formData = {
    'country': '',
    'phoneNumber': '',
    'countryISO': '',
  };
  ValidatePhoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                // height: 200,
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                color: _theme.primaryColor,
                child: ListTile(
                  leading: const CircleAvatar(
                    radius: 35.0,
                    backgroundColor: Colors.white54,
                    foregroundColor: Colors.white,
                    child: Icon(
                      Icons.login_rounded,
                      // color: Colors.white,
                    ),
                  ),
                  title: Text(
                    'Welcome!',
                    style: _theme.textTheme.headline3!
                        .copyWith(color: Colors.white),
                  ),
                  subtitle: Text(
                    'Let\'s get you in.',
                    softWrap: true,
                    style: _theme.textTheme.headline6!
                        .copyWith(color: Colors.white70),
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: IntlPhoneField(
                  validator: customValidator.validateMobileNoLength,
                  autoValidate: false,
                  decoration: const InputDecoration(
                      labelText: 'Phone Number', counterText: ' '),
                  initialCountryCode: 'KE',
                  onSaved: (phone) {
                    if (phone != null) {
                      formData['phoneNumber'] = phone.number;
                      formData['country'] = phone.countryCode;
                      formData['countryISO'] = phone.countryISOCode;
                    }
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Observer(builder: (_) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ElevatedButton(
                      onPressed: _authStore.isLogingIn
                          ? null
                          : () async {
                              await _submit(context);
                            },
                      child: _authStore.isLogingIn
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text('Submit'),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _submit(BuildContext context) async {
    //Validate Form
    if (!_formKey.currentState!.validate()) {
      // Invalid!
      return;
    }

    final ConnectivityHelper _connectivityHelper = getIt<ConnectivityHelper>();
    FunctionResponse functionResponse =
        await _connectivityHelper.checkInternetConnection();
    if (functionResponse.success) {
      try {
        Focus.of(context).unfocus();
      } catch (_) {}
      _formKey.currentState!.save();

      // Start CircularProgressIndicator
      _authStore.changeLogingInStatus(true);

      //Try to Login
      FunctionResponse _fResponse = await _authStore.checkPhoneIfRegistered(
        formData['phoneNumber'],
        formData['country'],
      );

      _authStore.countryCode = formData['country'];
      _authStore.phoneNumber = formData['phoneNumber'];
      _authStore.countryISOCode = formData['countryISO'];

      // Stop CircularProgressIndicator
      _authStore.changeLogingInStatus(false);

      if (_fResponse.success) {
        // Clear all form fields
        formData.clear();
        //Navigate to HomeScreen
        Navigator.of(context).pushNamed(LoginScreen.routeName);
      } else {
        Navigator.of(context).pushNamed(RegisterScreen.routeName);
      }
    } else {
      final CustomAlerts customAlerts = getIt<CustomAlerts>();
      customAlerts.showSnackBar(functionResponse.message, context);
    }
  }
}
