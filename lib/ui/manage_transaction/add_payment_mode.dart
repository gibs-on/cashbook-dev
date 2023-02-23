import 'package:cashbook/constants/function_response.dart';
import 'package:cashbook/models/payment_mode.dart';
import 'package:cashbook/stores/payment_mode_store.dart';
import 'package:cashbook/stores/transaction_store.dart';
import 'package:cashbook/utils/connectivity_helper.dart';
import 'package:cashbook/utils/custom_alerts.dart';
import 'package:cashbook/utils/input_formatters.dart';
import 'package:flutter/material.dart';

import '../../service_locator.dart';

class AddPaymenModeScreen extends StatelessWidget {
  AddPaymenModeScreen({Key? key, required this.editablePaymentMode})
      : super(key: key);

  //route Data
  final PaymentMode? editablePaymentMode;

  //Store
  final PaymentModeStore _paymentModeStore = getIt<PaymentModeStore>();
  final TransactionStore _transactionStore = getIt<TransactionStore>();

  //Utitlities
  final CustomAlerts _customAlerts = getIt<CustomAlerts>();
  final ConnectivityHelper _connectivityHelper = getIt<ConnectivityHelper>();

  //Form
  final _formKey = GlobalKey<FormState>();
  PaymentMode _formData = PaymentMode(id: 0, title: '');

  Future<void> _addPaymentMode(BuildContext context) async {
//Show Loader
    _customAlerts.showLoaderDialog(context);

    //Validate Form
    FunctionResponse _fResponse = getIt<FunctionResponse>();
    if (!_formKey.currentState!.validate()) {
      _fResponse.message = 'Please enter valid inputs';
    } else {
      try {
        FocusScope.of(context).unfocus();
        Focus.of(context).unfocus();
      } catch (_) {}
      _formKey.currentState!.save();

      _fResponse = await _connectivityHelper.checkInternetConnection();

      if (_fResponse.success) {
        if (editablePaymentMode == null) {
          _fResponse = await _paymentModeStore.addPaymentMode(_formData.title);
        } else {
          _fResponse = await _paymentModeStore.editPaymentMode(PaymentMode(
            id: editablePaymentMode!.id,
            title: _formData.title,
          ));
          await _transactionStore.fetchAndSetTransactions();
        }
      }
    }
//Pop Loader
    Navigator.of(context).pop();
    print('${_fResponse.message}');
    _customAlerts.showSnackBar(_fResponse.message, context,
        success: _fResponse.success);

    if (_fResponse.success) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Screen title
                  Text(
                    'Add Payment Mode',
                    style: _theme.textTheme.headline2,
                  ),

                  //Form
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 15.0),
                        TextFormField(
                          initialValue: editablePaymentMode?.title,
                          onSaved: (String? val) {
                            if (val == null) {
                              return;
                            }
                            _formData.title = val;
                          },
                          inputFormatters: [
                            UpperCaseTextFormatter(),
                          ],
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            label: Text('Title'),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _paymentModeStore.isLoading
                          ? null
                          : () {
                              _addPaymentMode(context);
                            },
                      child: _paymentModeStore.isLoading
                          ? const CircularProgressIndicator.adaptive(
                              backgroundColor: Colors.white,
                            )
                          : const Text('Submit'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
