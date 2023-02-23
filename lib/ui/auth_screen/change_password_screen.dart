import 'package:cashbook/constants/function_response.dart';
import 'package:cashbook/stores/auth_store.dart';
import 'package:cashbook/utils/custom_alerts.dart';
import 'package:cashbook/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../service_locator.dart';
import 'login_screen.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);

  final CustomAlerts _customAlerts = getIt<CustomAlerts>();
  final CustomValidator _customValidator = getIt<CustomValidator>();
  final AuthStore _authStore = getIt<AuthStore>();
  final _formKey = GlobalKey<FormState>();

  static const routeName = '/change-password-screen';

  final formData = {
    'password': '',
    'cPassword': '',
  };

  Future<void> _changePassword(BuildContext context) async {
    FunctionResponse fResponse = getIt<FunctionResponse>();
    try {
      //Validate Form
      if (!_formKey.currentState!.validate()) {
        // Invalid!
        return;
      }
      try {
        Focus.of(context).unfocus();
      } catch (_) {}
      _formKey.currentState!.save();

      if (formData['password'] == formData['cPassword']) {
        _customAlerts.showLoaderDialog(context);
        fResponse = await _authStore.changePassword(formData['password']!);
        Navigator.of(context).pop();
      } else {
        fResponse.message = 'Password does not match';
      }
    } catch (e) {
      fResponse.success = false;
      fResponse.message = 'Error changing password : $e';
    }
    _customAlerts.showSnackBar(fResponse.message, context,
        success: fResponse.success);

    if (fResponse.success) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          LoginScreen.routeName, (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 15.0),
                Observer(builder: (_) {
                  return TextFormField(
                    validator: _customValidator.validatePasswordLength,
                    onSaved: (String? val) {
                      if (val == null) {
                        return;
                      }
                      formData['password'] = val;
                    },
                    keyboardType: TextInputType.text,
                    obscureText: !_authStore.passwordIsVisible,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            _authStore.togglepasswordIsVisible();
                          },
                          icon: _authStore.passwordIsVisible
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off)),
                      label: const Text('Password'),
                      contentPadding: const EdgeInsets.all(10.0),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  );
                }),
                const SizedBox(height: 15.0),
                Observer(builder: (_) {
                  return TextFormField(
                    validator: _customValidator.validatePasswordLength,
                    onSaved: (String? val) {
                      if (val == null) {
                        return;
                      }
                      formData['cPassword'] = val;
                    },
                    keyboardType: TextInputType.text,
                    obscureText: !_authStore.passwordIsVisible,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            _authStore.togglepasswordIsVisible();
                          },
                          icon: _authStore.passwordIsVisible
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off)),
                      label: const Text('Confirm Password'),
                      contentPadding: const EdgeInsets.all(10.0),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  );
                }),
                const SizedBox(height: 25.0),
                SizedBox(
                  width: double.infinity,
                  child: Observer(builder: (_) {
                    return ElevatedButton(
                      onPressed: () async {
                        await _changePassword(context);
                      },
                      child: _authStore.isLogingIn
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text('Submit'),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
