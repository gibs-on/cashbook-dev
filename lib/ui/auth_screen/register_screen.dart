import 'package:cashbook/api_utils/api_parser.dart';
import 'package:cashbook/api_utils/api_provider.dart';
import 'package:cashbook/constants/function_response.dart';
import 'package:cashbook/helpers/shared_preferences_helper.dart';
import 'package:cashbook/generated_api_code/api_client.swagger.dart';
import 'package:cashbook/models/api_response/auth_response.dart';
import 'package:cashbook/models/generic_response_model.dart';
import 'package:cashbook/service_locator.dart';
import 'package:cashbook/stores/auth_store.dart';
import 'package:cashbook/ui/auth_screen/login_screen.dart';
import 'package:cashbook/ui/auth_screen/tos_widget.dart';
import 'package:cashbook/ui/home/home_screen/home_screen.dart';
import 'package:cashbook/utils/custom_alerts.dart';
import 'package:cashbook/utils/input_formatters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../utils/validator.dart';

import 'verify_otp_screen.dart';

final SharedPreferencesHelper _sharedPreferencesHelper =
    getIt<SharedPreferencesHelper>();
final AuthStore _authStore = getIt<AuthStore>();

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  static const routeName = '/register-screen';
  final _formKey = GlobalKey<FormState>();

  //TODO: use these with getIt. In(login, register, verify OTP screen)
  final CustomValidator customValidator = CustomValidator();
  final CustomAlerts customAlerts = getIt<CustomAlerts>();

  final Map<String, dynamic> _formData = {
    // 'email': '',
    'firstName': '',
    'lastName': '',
    'businessName': '',
    'password': '',
    // 'phoneNumber': '',
    // 'countryCode': '',
    // 'country': '',
  };

  void _submit(BuildContext context) async {
    _authStore.changeLogingInStatus(true);

    if (!_formKey.currentState!.validate()) {
      // Invalid!
      _authStore.changeLogingInStatus(false);
      return;
    }
    try {
      Focus.of(context).unfocus();
    } catch (_) {}
    _formKey.currentState!.save();

    try {
      print('Before Request');
      final _response =
          await getIt<ApiProvider>().apiClient.apiAuthRegisterPost(
                body: TenzibookRegisterDTO(
                  // email: _formData['email'],
                  firstName: _formData['firstName'],
                  lastName: _formData['lastName'],
                  businessName: _formData['businessName'],
                  phoneNumber: _authStore.phoneNumber,
                  countryCode: _authStore.countryCode,
                  password: _formData['password'],
                  country: _authStore.countryISOCode,
                  deviceId: '',
                  deviceType: '',
                  os: '',
                ),
              );

      print('After Request');
      if (_response.isSuccessful && _response.body?['success'] == true) {
        print('--- Register was successful');

        print('before response parse');
        final _responseData = _response.body as Map<String, dynamic>;
        //convert response into authResponse Object
        final _authResponse = AuthResponse.fromJson(_responseData);

        print('before saving user');
        //save user to shared preferences
        FunctionResponse _fResponse =
            await _sharedPreferencesHelper.saveNewUser(_authResponse.toJson());
        print(_fResponse.message);

        // if save to sharedPreferences is succussful
        print('before naigating to OTP verification');
        if (_fResponse.success) {
          _formData.clear();
          customAlerts.showSnackBar(
              'Registration successful. Verify OTP', context,
              success: true);
          //Navigate to Verify OTP Screen
          _authStore.changeLogingInStatus(false);
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (ctx) => VerifyOTPScreen(isChangePasswordOtp: false)));
        }
      } else {
        print('Register Failed');
        customAlerts.showSnackBar(_response.body?['errordesc'], context);
        print('${_response.body['errordesc']}');
      }
    } catch (e) {
      customAlerts.showSnackBar(e.toString(), context);
      print('Error registering : $e');
    }
    _authStore.changeLogingInStatus(false);
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
                    'Signup to secure and auto backup your data',
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
                      //     labelText: 'Phone Number',
                      //     counterText: ' ',
                      //   ),
                      //   initialCountryCode: 'KE',
                      //   onChanged: (phone) {
                      //     print(phone.completeNumber);
                      //     print(phone.countryCode);
                      //   },
                      //   onSaved: (phone) {
                      //     if (phone != null) {
                      //       _formData['phoneNumber'] = phone.number;
                      //       _formData['country'] = phone.countryISOCode;
                      //       _formData['countryCode'] = phone.countryCode;
                      //     }
                      //   },
                      // ),
                      const SizedBox(height: 15.0),
                      Card(
                        child: TextFormField(
                          validator: customValidator.validateName,
                          onSaved: (String? val) {
                            if (val == null) {
                              return;
                            }

                            _formData['firstName'] = val;
                          },
                          inputFormatters: [
                            UpperCaseTextFormatter(),
                          ],
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            label: Text('First Name'),
                            contentPadding: EdgeInsets.all(10.0),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      Card(
                        child: TextFormField(
                          validator: customValidator.validateName,
                          onSaved: (String? val) {
                            if (val == null) {
                              return;
                            }
                            _formData['lastName'] = val;
                          },
                          inputFormatters: [
                            UpperCaseTextFormatter(),
                          ],
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            label: Text('Last Name'),
                            contentPadding: EdgeInsets.all(10.0),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      Card(
                        child: TextFormField(
                          onSaved: (String? val) {
                            if (val == null) {
                              return;
                            }
                            _formData['businessName'] = val;
                          },
                          inputFormatters: [
                            UpperCaseTextFormatter(),
                          ],
                          decoration: const InputDecoration(
                            label: Text('Business Name (Optional)'),
                            contentPadding: EdgeInsets.all(10.0),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),

                      // const SizedBox(height: 15.0),
                      // Card(
                      //   child: TextFormField(
                      //     validator: customValidator.validateEmail,
                      //     onSaved: (String? val) {
                      //       if (val == null) {
                      //         return;
                      //       }
                      //       _formData['email'] = val;
                      //     },
                      //     keyboardType: TextInputType.emailAddress,
                      //     decoration: const InputDecoration(
                      //       label: Text('Email'),
                      //       contentPadding: EdgeInsets.all(10.0),
                      //       border: InputBorder.none,
                      //       focusedBorder: InputBorder.none,
                      //       enabledBorder: InputBorder.none,
                      //       errorBorder: InputBorder.none,
                      //       disabledBorder: InputBorder.none,
                      //     ),
                      //   ),
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
                              _formData['password'] = val;
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
                            onPressed: () =>
                                _authStore.isLogingIn ? null : _submit(context),
                            child: _authStore.isLogingIn
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : const Text('Submit'),
                          );
                        }),
                      ),
                      const SizedBox(height: 15.0),
                      // SizedBox(
                      //   width: double.infinity,
                      //   child: TextButton(
                      //     onPressed: () {
                      //       _authStore.passwordIsVisible = false;
                      //       Navigator.of(context)
                      //           .pushReplacementNamed(LoginScreen.routeName);
                      //     },
                      //     child: const Text('Login'),
                      //   ),
                      // ),
                      const SizedBox(height: 15.0),
                      Center(
                        child: tosWidget(_theme),
                      ),
                      const SizedBox(height: 50.0),
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
