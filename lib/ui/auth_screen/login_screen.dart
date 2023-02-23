import 'package:cashbook/constants/function_response.dart';
import 'package:cashbook/helpers/shared_preferences_helper.dart';
import 'package:cashbook/service_locator.dart';
import 'package:cashbook/stores/auth_store.dart';
import 'package:cashbook/ui/auth_screen/register_screen.dart';
import 'package:cashbook/ui/auth_screen/tos_widget.dart';
import 'package:cashbook/ui/auth_screen/verify_otp_screen.dart';
import 'package:cashbook/ui/home/home_screen/home_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/validator.dart';
import '../../utils/custom_alerts.dart';
import 'reset_password_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  static const routeName = '/login-screen';
  final _formKey = GlobalKey<FormState>();
  final CustomValidator customValidator = getIt<CustomValidator>();
  final SharedPreferencesHelper sharedPreferencesHelper =
      getIt<SharedPreferencesHelper>();
  final AuthStore _authStore = getIt<AuthStore>();

  final CustomAlerts _customAlerts = getIt<CustomAlerts>();

  Map<String, dynamic> formData = {
    'password': '',
  };

  Future<void> _submit(BuildContext context) async {
    //Validate Form
    if (!_formKey.currentState!.validate()) {
      // Invalid!
      return;
    }
    try {
      Focus.of(context).unfocus();
    } catch (_) {}
    _formKey.currentState!.save();

    // Start CircularProgressIndicator
    _authStore.changeLogingInStatus(true);

    //Try to Login
    FunctionResponse _fResponse = await _authStore.tryLogin(
      formData['password'],
    );

    // Stop CircularProgressIndicator
    _authStore.changeLogingInStatus(false);

    _customAlerts.showSnackBar(_fResponse.message, context,
        success: _fResponse.success);
    if (_fResponse.success) {
      // Clear all form fields
      formData.clear();

      //Navigate to HomeScreen
      Navigator.of(context)
          .pushNamedAndRemoveUntil(HomeScreen.routeName, (_) => false);
    } else if (_fResponse.message == 'Please Verify your OTP') {
      print('go to verify otp screen');
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => VerifyOTPScreen(
            isChangePasswordOtp: false,
          ),
        ),
        (route) => false,
      );
      // Navigator.of(context).pushReplacementNamed(VerifyOTPScreen.routeName);
    } else {
      print('Login Failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
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
                    'Login to auto backup your data securely',
                    softWrap: true,
                    style: _theme.textTheme.headline6!
                        .copyWith(color: Colors.white70),
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // IntlPhoneField(
                      //   validator: customValidator.validateMobileNoLength,
                      //   autoValidate: false,
                      //   decoration: const InputDecoration(
                      //       labelText: 'Phone Number', counterText: ' '),
                      //   initialCountryCode: 'KE',
                      //   onSaved: (phone) {
                      //     if (phone != null) {
                      //       formData['phoneNumber'] = phone.number;
                      //       formData['country'] = phone.countryCode;
                      //     }
                      //   },
                      // ),
                      const SizedBox(height: 15.0),

                      Card(
                        child: Observer(builder: (_) {
                          return TextFormField(
                            validator: customValidator.validatePasswordLength,
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
                      ),

                      // Submit Buttom
                      const SizedBox(height: 15.0),
                      SizedBox(
                        width: double.infinity,
                        child: Observer(builder: (_) {
                          return ElevatedButton(
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
                          );
                        }),
                      ),
                      // Go to register screen

                      // const SizedBox(height: 15.0),
                      // SizedBox(
                      //   width: double.infinity,
                      //   child: TextButton(
                      //     onPressed: () {
                      //       _authStore.passwordIsVisible = false;
                      //       Navigator.of(context)
                      //           .pushReplacementNamed(RegisterScreen.routeName);
                      //     },
                      //     child: const Text('Create new Account'),
                      //   ),
                      // ),
                      const SizedBox(height: 5.0),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {
                            _authStore.passwordIsVisible = false;
                            Navigator.of(context)
                                .pushNamed(ResetPasswordScreen.routeName);
                          },
                          child: const Text('Forgot password'),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: RichText(
                            softWrap: true,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'By logging in, you agree to our ',
                                  style: _theme.textTheme.headline6,
                                ),
                                TextSpan(
                                  text: 'Terms of Service ',
                                  style: _theme.textTheme.headline5!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: _theme.colorScheme.primary),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      launch(
                                          'https://www.book.tenzi.africa/tos/');
                                    },
                                ),
                                TextSpan(
                                  text: 'and ',
                                  style: _theme.textTheme.headline6,
                                ),
                                TextSpan(
                                  text: 'Privacy Policy.',
                                  style: _theme.textTheme.headline5!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: _theme.colorScheme.primary),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      launch(
                                          'https://www.book.tenzi.africa/privacy-policy/');
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25.0),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
