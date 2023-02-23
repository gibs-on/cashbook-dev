import 'package:cashbook/constants/function_response.dart';
import 'package:cashbook/models/cash_category.dart';
import 'package:cashbook/stores/cash_category_store.dart';
import 'package:cashbook/stores/transaction_store.dart';
import 'package:cashbook/utils/custom_alerts.dart';
import 'package:cashbook/utils/connectivity_helper.dart';
import 'package:cashbook/utils/input_formatters.dart';
import 'package:flutter/material.dart';

import '../../service_locator.dart';

class AddCategoryScreen extends StatelessWidget {
  AddCategoryScreen({Key? key, required this.editableCategory, this.isCashIn})
      : super(key: key);

  //route Data
  final CashCategory? editableCategory;
  final bool? isCashIn;

  //Store
  final CashCategoryStore _categoryStore = getIt<CashCategoryStore>();
  final TransactionStore _transactionStore = getIt<TransactionStore>();

  //Utitlities
  final CustomAlerts _customAlerts = getIt<CustomAlerts>();
  final ConnectivityHelper _connectivityHelper = getIt<ConnectivityHelper>();

  //Form
  final _formKey = GlobalKey<FormState>();
  CashCategory _formData = CashCategory(id: 0, title: '');

  Future<void> _addCategory(BuildContext context) async {
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
      //Show Loader
      _customAlerts.showLoaderDialog(context);

      _fResponse = await _connectivityHelper.checkInternetConnection();

      if (_fResponse.success) {
        if (editableCategory == null) {
          _fResponse = await _categoryStore.addCategory(
            _formData.title,
            isCashIn!,
          );
        } else {
          _fResponse = await _categoryStore.editCategory(
              CashCategory(
                id: editableCategory!.id,
                title: _formData.title,
              ),
              isCashIn!);
          await _transactionStore.fetchAndSetTransactions();
        }
      }
    }
    //Pop Loader
    Navigator.of(context).pop();

    print('---- category screen ${_fResponse.message}');
    _customAlerts.showSnackBar(_fResponse.message, context,
        success: _fResponse.success);
    _categoryStore.changeIsLoading(false);

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
                    'Add Category',
                    style: _theme.textTheme.headline2,
                  ),

                  //Form
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 15.0),
                        TextFormField(
                          initialValue: editableCategory?.title,
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
                      onPressed: _categoryStore.isLoading
                          ? null
                          : () {
                              _addCategory(context);
                            },
                      child: _categoryStore.isLoading
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
