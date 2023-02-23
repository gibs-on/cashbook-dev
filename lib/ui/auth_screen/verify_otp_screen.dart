import 'dart:convert';

import 'package:cashbook/api_utils/api_provider.dart';
import 'package:cashbook/constants/function_response.dart';
import 'package:cashbook/generated_api_code/api_client.swagger.dart';
import 'package:cashbook/helpers/shared_preferences_helper.dart';
import 'package:cashbook/stores/auth_store.dart';
import 'package:cashbook/stores/book_store.dart';
import 'package:cashbook/stores/home_screen_store.dart';
import 'package:cashbook/ui/auth_screen/change_password_screen.dart';
import 'package:cashbook/ui/auth_screen/login_screen.dart';
import 'package:cashbook/ui/auth_screen/register_screen.dart';
import 'package:cashbook/ui/auth_screen/validate_phone_screen.dart';
import 'package:cashbook/ui/home/home_screen/home_screen.dart';
import 'package:cashbook/utils/custom_alerts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../service_locator.dart';

final SharedPreferencesHelper _sharedPreferencesHelper =
    getIt<SharedPreferencesHelper>();

final BookStore _bookStore = getIt<BookStore>();
final HomeScreenStore _homeScreenStore = getIt<HomeScreenStore>();
final AuthStore _authStore = getIt<AuthStore>();

class VerifyOTPScreen extends StatefulWidget {
  VerifyOTPScreen({Key? key, required this.isChangePasswordOtp})
      : super(key: key);

  static const routeName = '/verify-otp-screen';

  final bool isChangePasswordOtp;

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> with CodeAutoFill {
  final CustomAlerts customAlerts = getIt<CustomAlerts>();

  final TextEditingController _pinPutController = TextEditingController();

  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.deepPurpleAccent),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  Future<void> _verifyOTP(
      {required BuildContext context, required String otp}) async {
    _authStore.changeLogingInStatus(true);

    try {
      //get token
      final String _token = await _sharedPreferencesHelper.getToken();

      if (_token.isEmpty) {
        print('No token found');
      } else {
        //refreshing token for Api Provider class
        await getIt<ApiProvider>().initAgain();
        print('--- Token found $_token');
        final _response = await getIt<ApiProvider>()
            .apiClient
            .apiAccountValidateOTPPost(body: OTPValidation(otp: otp));

        final _responseData = _response.body as Map<String, dynamic>;

        if (_response.isSuccessful) {
          if (_responseData['valid'] == true) {
            print('OTP verified Successfully');
            FunctionResponse _fResponse =
                await _sharedPreferencesHelper.verifyUser();
            print(_fResponse.message);
            customAlerts.showSnackBar('OTP verified Successfully', context,
                success: true);
            _homeScreenStore.needDataDownload = true;
            _bookStore.selectedBook = null;
            _bookStore.downloadedBookList.clear();
            _authStore.changeLogingInStatus(false);
            Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
          } else {
            customAlerts.showSnackBar('Invalid OTP', context);
            print('${_responseData['error']}');
          }
        } else {
          customAlerts.showSnackBar(
              'Verification Failed. Check your OTP and try again.', context);
          print('${_responseData['error']}');
        }
      }
    } catch (e) {
      customAlerts.showSnackBar(e.toString(), context);

      print('Error Verifying : $e');
    }
    _pinPutController.text = '';
    _authStore.changeLogingInStatus(false);
  }

  Future<void> verifyPasswordChangeOtp(
      {required BuildContext context, required String otp}) async {
    FunctionResponse fResponse = getIt<FunctionResponse>();
    print('verify otp init');
    try {
      customAlerts.showLoaderDialog(context);
      fResponse = await _authStore.verifyResetPasswordOtp(otp);
      Navigator.of(context).pop();
    } catch (e) {
      fResponse.success = false;
      fResponse.message = 'Error verifying Otp : $e';
    }
    customAlerts.showSnackBar(fResponse.message, context,
        success: fResponse.success);

    if (fResponse.success) {
      Navigator.of(context)
          .pushReplacementNamed(ChangePasswordScreen.routeName);
    }
    _pinPutController.text = '';
  }

  String? otpCode;

  @override
  void initState() {
    listenForCode();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    cancel();
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          actions: [
            IconButton(
              onPressed: () async {
                await _homeScreenStore.userLogout();
                Navigator.of(context).pushNamedAndRemoveUntil(
                    ValidatePhoneScreen.routeName, (_) => false);
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              // height: 200,
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              color: Theme.of(context).primaryColor,
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
                  'Verify OTP',
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: Colors.white),
                ),
                subtitle: Text(
                  'One-Time Password has been sent to your mobile number',
                  softWrap: true,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.white70),
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PinPut(
                      fieldsCount: 5,
                      onSubmit: (String pin) async {
                        print('otp submitted');
                        widget.isChangePasswordOtp
                            ? await verifyPasswordChangeOtp(
                                context: context, otp: pin)
                            : await _verifyOTP(context: context, otp: pin);
                      },
                      focusNode: _pinPutFocusNode,
                      controller: _pinPutController,
                      submittedFieldDecoration: _pinPutDecoration.copyWith(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      selectedFieldDecoration: _pinPutDecoration,
                      followingFieldDecoration: _pinPutDecoration.copyWith(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                          color: Colors.deepPurpleAccent.withOpacity(.5),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Text('Enter OTP to verify your device.',
                          softWrap: true,
                          style: Theme.of(context).textTheme.headline6),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  if (!widget.isChangePasswordOtp)
                    Observer(builder: (_) {
                      return TextButton(
                        onPressed: _authStore.isLogingIn
                            ? null
                            : () async {
                                await _authStore.resendOtp();
                              },
                        child: const Text(
                          'Resend OTP',
                        ),
                      );
                    }),
                  const SizedBox(height: 15.0),
                  const SizedBox(height: 25.0),
                  Observer(builder: (_) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: _authStore.isLogingIn
                          ? const CircularProgressIndicator()
                          : const SizedBox(),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void codeUpdated() async {
    otpCode = code!;
    _pinPutController.text = code!;
    widget.isChangePasswordOtp
        ? await verifyPasswordChangeOtp(context: context, otp: otpCode!)
        : await _verifyOTP(context: context, otp: otpCode!);
  }
}
