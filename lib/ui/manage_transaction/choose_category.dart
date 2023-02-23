import 'package:cashbook/constants/function_response.dart';
import 'package:cashbook/models/cash_category.dart';
import 'package:cashbook/stores/cash_category_store.dart';
import 'package:cashbook/stores/transaction_store.dart';
import 'package:cashbook/ui/manage_transaction/add_category_screen.dart';
import 'package:cashbook/utils/connectivity_helper.dart';
import 'package:cashbook/utils/custom_alerts.dart';
import 'package:cashbook/utils/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../service_locator.dart';

class ChooseCategoryView extends StatelessWidget {
  ChooseCategoryView({Key? key}) : super(key: key);

  static const routeName = '/choose-category';

  //Stores
  final CashCategoryStore _cashCategoryStore = getIt<CashCategoryStore>();
  final TransactionStore _transactionStore = getIt<TransactionStore>();

  //Utitlities
  final CustomAlerts _customAlerts = getIt<CustomAlerts>();
  final ConnectivityHelper _connectivityHelper = getIt<ConnectivityHelper>();

  Future<void> _deleteCategory(
      BuildContext context, CashCategory _category, bool _isCashIn) async {
    _cashCategoryStore.changeIsLoading(true);

    //Validate Form
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    try {
      FocusScope.of(context).unfocus();
      Focus.of(context).unfocus();
    } catch (_) {}

    _fResponse = await _connectivityHelper.checkInternetConnection();
    if (_fResponse.success) {
      //Show Loader
      _customAlerts.showLoaderDialog(context);

      _fResponse =
          await _cashCategoryStore.deleteCategory(_category, _isCashIn);
      await _transactionStore.fetchAndSetTransactions();
    }
    //Pop Loader
    Navigator.of(context).pop();
    print(_fResponse.message);
    _customAlerts.showSnackBar(_fResponse.message, context,
        success: _fResponse.success);

    _cashCategoryStore.changeIsLoading(false);
  }

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    final routeData = ModalRoute.of(context)?.settings.arguments as Map;
    final TransactionStore _transactionStore = routeData['transactionStore'];
    final bool isCashIn = routeData['isCashIn'];
    final categoryList = isCashIn
        ? _cashCategoryStore.cashInCategoryList
        : _cashCategoryStore.cashOutCategoryList;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Choose Category'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Observer(builder: (_) {
            return ListView.builder(
              itemCount: categoryList.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Radio(
                      key: ValueKey(categoryList[index].id),
                      groupValue: _cashCategoryStore.selectedCategory?.id ?? 0,
                      value: categoryList[index].id,
                      onChanged: (_) {
                        _cashCategoryStore
                            .setSelectedCategory(categoryList[index]);
                        Navigator.of(context).pop();
                      },
                    ),
                    SizedBox(
                      width: 150,
                      child: Text(
                        categoryList[index].title.capitalize(),
                        overflow: TextOverflow.ellipsis,
                        style: _theme.textTheme.headline4,
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    IconButton(
                        onPressed: () {
                          if (isCashIn && categoryList[index].id == 3) {
                            _customAlerts.showSnackBar(
                                'Cannot edit default Category', context);
                          } else if (!isCashIn && categoryList[index].id == 2) {
                            _customAlerts.showSnackBar(
                                'Cannot edit default Category', context);
                          } else {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => AddCategoryScreen(
                                      editableCategory: categoryList[index],
                                      isCashIn: isCashIn,
                                    )));
                          }
                        },
                        icon: const Icon(Icons.edit)),
                    const SizedBox(width: 10),
                    IconButton(
                        onPressed: () async {
                          if (isCashIn && categoryList[index].id == 3) {
                            _customAlerts.showSnackBar(
                                'Cannot delete default Category', context);
                          } else if (!isCashIn && categoryList[index].id == 2) {
                            _customAlerts.showSnackBar(
                                'Cannot delete default Category', context);
                          } else {
                            //Show Loader
                            _customAlerts.showLoaderDialog(context);
                            await _deleteCategory(
                              context,
                              categoryList[index],
                              isCashIn,
                            );
                            //Pop Loader
                            Navigator.of(context).pop();
                          }
                        },
                        icon: Icon(Icons.delete,
                            color: _theme.colorScheme.error)),
                  ],
                );
              },
            );
          }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => AddCategoryScreen(
                      editableCategory: null,
                      isCashIn: isCashIn,
                    )));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
