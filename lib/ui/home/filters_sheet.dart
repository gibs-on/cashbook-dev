import 'package:cashbook/constants/function_response.dart';
import 'package:cashbook/stores/home_screen_store.dart';
import 'package:cashbook/stores/transaction_store.dart';
import 'package:cashbook/ui/home/respective_filters.dart';
import 'package:cashbook/utils/custom_alerts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../service_locator.dart';

enum GeneralFilter {
  entryType,
  members,
  category,
  paymentMode,
}

class FiltersSheet extends StatelessWidget {
  final HomeScreenStore _homeScreenStore = getIt<HomeScreenStore>();
  final TransactionStore transactionStore = getIt<TransactionStore>();
  final CustomAlerts _customAlerts = getIt<CustomAlerts>();

  FiltersSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Filters', style: Theme.of(context).textTheme.headline5),
              TextButton(
                onPressed: () {
                  FunctionResponse _fResponse = _homeScreenStore.clearFilters();
                  _customAlerts.showSnackBar(_fResponse.message, context,
                      success: _fResponse.success);
                  Navigator.of(context).pop();
                },
                child: const Text('Clear All'),
              )
            ],
          ),
          const Divider(),
          Expanded(
            child: Observer(builder: (_) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              InkWell(
                                onTap: () {
                                  transactionStore.changeGeneralFilter(
                                      GeneralFilter.entryType);
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 3.0, vertical: 8.0),
                                  child: Text(
                                    'Entry Type',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(
                                            fontSize: transactionStore
                                                        .generalFilter ==
                                                    GeneralFilter.entryType
                                                ? 15
                                                : 12,
                                            color: transactionStore
                                                        .generalFilter ==
                                                    GeneralFilter.entryType
                                                ? Colors.blue.shade300
                                                : Theme.of(context)
                                                    .textTheme
                                                    .headline6!
                                                    .color),
                                  ),
                                ),
                              ),
                              // const Divider(),
                              // InkWell(
                              //   onTap: () {
                              //     transactionStore.changeGeneralFilter(1);
                              //   },
                              //   child: Container(
                              //     padding: const EdgeInsets.symmetric(
                              //         horizontal: 3.0, vertical: 8.0),
                              //     child: Text(
                              //       'Members',
                              //       style: Theme.of(context)
                              //           .textTheme
                              //           .headline6!
                              //           .copyWith(
                              //               fontSize:
                              //                   transactionStore.generalFilter == 1
                              //                       ? 15
                              //                       : 12,
                              //               color:
                              //                   transactionStore.generalFilter == 1
                              //                       ? Colors.blue.shade300
                              //                       : Theme.of(context)
                              // .textTheme
                              // .headline6!
                              // .color),
                              //     ),
                              //   ),
                              // ),
                              const Divider(),
                              InkWell(
                                onTap: () {
                                  transactionStore.changeGeneralFilter(
                                      GeneralFilter.category);
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 3.0, vertical: 8.0),
                                  child: Text(
                                    'Category',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(
                                            fontSize: transactionStore
                                                        .generalFilter ==
                                                    GeneralFilter.category
                                                ? 15
                                                : 12,
                                            color: transactionStore
                                                        .generalFilter ==
                                                    GeneralFilter.category
                                                ? Colors.blue.shade300
                                                : Theme.of(context)
                                                    .textTheme
                                                    .headline6!
                                                    .color),
                                  ),
                                ),
                              ),
                              const Divider(),
                              InkWell(
                                onTap: () {
                                  transactionStore.changeGeneralFilter(
                                      GeneralFilter.paymentMode);
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 3.0, vertical: 8.0),
                                  child: Text(
                                    'Payment Mode',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(
                                            fontSize: transactionStore
                                                        .generalFilter ==
                                                    GeneralFilter.paymentMode
                                                ? 15
                                                : 12,
                                            color: transactionStore
                                                        .generalFilter ==
                                                    GeneralFilter.paymentMode
                                                ? Colors.blue.shade300
                                                : Theme.of(context)
                                                    .textTheme
                                                    .headline6!
                                                    .color),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              RespectiveFilter(
                                transactionStore: transactionStore,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                  child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Apply')))
            ],
          ),
        ],
      ),
    );
  }
}
