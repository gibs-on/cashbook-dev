import 'package:cashbook/constants/function_response.dart';
import 'package:cashbook/stores/auth_store.dart';
import 'package:cashbook/ui/auth_screen/verify_otp_screen.dart';
import 'package:cashbook/utils/custom_alerts.dart';
import 'package:cashbook/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../service_locator.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({Key? key}) : super(key: key);

  static const routeName = '/reset-password-screen';

  final CustomAlerts _customAlerts = getIt<CustomAlerts>();
  final CustomValidator customValidator = getIt<CustomValidator>();

  final AuthStore _authStore = getIt<AuthStore>();

  final _formKey = GlobalKey<FormState>();

  Map<String, dynamic> formData = {
    'phone': '',
    'countryCode': '',
  };

  Future<void> resetPassword(context) async {
    FunctionResponse fResponse = getIt<FunctionResponse>();
    try {
      try {
        Focus.of(context).unfocus();
      } catch (_) {}
      _formKey.currentState!.save();

      _customAlerts.showLoaderDialog(context);

      fResponse = await _authStore.resetPassword(
          formData['phone'], formData['countryCode']);
      Navigator.of(context).pop();
    } catch (e) {
      fResponse.success = false;
      fResponse.message = 'Error reseting password : $e';
    }
    _customAlerts.showSnackBar(fResponse.message, context,
        success: fResponse.success);
    if (fResponse.success) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) => VerifyOTPScreen(isChangePasswordOtp: true)));
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
                IntlPhoneField(
                  validator: customValidator.validateMobileNoLength,
                  autoValidate: false,
                  decoration: const InputDecoration(
                      labelText: 'Phone Number', counterText: ' '),
                  initialCountryCode: 'KE',
                  onSaved: (phone) {
                    if (phone != null) {
                      formData['phone'] = phone.number;
                      formData['countryCode'] = phone.countryCode;
                    }
                  },
                ),
                const SizedBox(height: 15.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      await resetPassword(context);
                    },
                    child: _authStore.isLogingIn
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
