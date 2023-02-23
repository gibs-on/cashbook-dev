import 'package:cashbook/models/cash_category.dart';
import 'package:cashbook/models/payment_mode.dart';
import 'package:cashbook/stores/cash_category_store.dart';
import 'package:cashbook/stores/payment_mode_store.dart';
import 'package:cashbook/stores/transaction_store.dart';
import 'package:cashbook/ui/home/filters_sheet.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../service_locator.dart';

enum EntryTypeFilter {
  all,
  cashIn,
  cashOut,
}

class RespectiveFilter extends StatelessWidget {
  final PaymentModeStore _paymentModeStore = getIt<PaymentModeStore>();
  final CashCategoryStore _cashCategoryStore = getIt<CashCategoryStore>();

  RespectiveFilter({
    Key? key,
    required this.transactionStore,
  }) : super(key: key);
  final TransactionStore transactionStore;

  @override
  Widget build(BuildContext context) {
    switch (transactionStore.generalFilter) {
      case GeneralFilter.entryType:
        {
          return Observer(builder: (_) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Radio<EntryTypeFilter>(
                          key: const ValueKey(1),
                          groupValue: transactionStore.entryTypeFilter,
                          value: EntryTypeFilter.all,
                          onChanged: (EntryTypeFilter? val) {
                            transactionStore.changeEntryTypeFilter(val);
                          }),
                      Text(
                        'All',
                        style: Theme.of(context).textTheme.headline6,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio<EntryTypeFilter>(
                          key: const ValueKey(2),
                          groupValue: transactionStore.entryTypeFilter,
                          value: EntryTypeFilter.cashOut,
                          onChanged: transactionStore.changeEntryTypeFilter),
                      Text(
                        'Cash Out',
                        style: Theme.of(context).textTheme.headline6,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio<EntryTypeFilter>(
                          key: const ValueKey(3),
                          groupValue: transactionStore.entryTypeFilter,
                          value: EntryTypeFilter.cashIn,
                          onChanged: transactionStore.changeEntryTypeFilter),
                      Text(
                        'Cash In',
                        style: Theme.of(context).textTheme.headline6,
                      )
                    ],
                  ),
                ],
              ),
            );
          });
        }
      case GeneralFilter.members:
        {
          return Center(
            child: Column(
              children: [
                const Text(
                  'This book is not shared with anybody. Go to Book Settings to add Members',
                  softWrap: true,
                ),
                TextButton(onPressed: () {}, child: const Text('Book Settings'))
              ],
            ),
          );
        }
      case GeneralFilter.category:
        {
          return SingleChildScrollView(
            child: Observer(builder: (_) {
              return Column(
                children: [
                  Row(
                    children: [
                      Radio<CashCategory?>(
                          key: const ValueKey(0),
                          groupValue: transactionStore.categoryFilter,
                          value: null,
                          onChanged: (CashCategory? val) {
                            transactionStore.changeCategoryFilter(null);
                          }),
                      Text(
                        'All',
                        style: Theme.of(context).textTheme.headline6,
                      )
                    ],
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _cashCategoryStore.cashInCategoryList.length +
                        _cashCategoryStore.cashOutCategoryList.length,
                    itemBuilder: (BuildContext context, int index) {
                      List<CashCategory> category =
                          _cashCategoryStore.cashInCategoryList;
                      int tempIndex = index;
                      if (index + 1 >
                          _cashCategoryStore.cashInCategoryList.length) {
                        category = _cashCategoryStore.cashOutCategoryList;
                        tempIndex -=
                            _cashCategoryStore.cashInCategoryList.length;
                      }

                      return Column(
                        children: [
                          Row(
                            children: [
                              Radio<CashCategory>(
                                  key: ValueKey(index),
                                  groupValue: transactionStore.categoryFilter,
                                  value: category[tempIndex],
                                  onChanged: (CashCategory? val) {
                                    transactionStore.changeCategoryFilter(
                                        category[tempIndex]);
                                  }),
                              Text(
                                category[tempIndex].title,
                                style: Theme.of(context).textTheme.headline6,
                              )
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ],
              );
            }),
          );
          // return Column(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     Row(
          //       children: [
          //         Observer(builder: (_) {
          //           return Checkbox(
          //             value: transactionStore.categoryFilter,
          //             onChanged: transactionStore.changeCategoryFilter,
          //           );
          //         }),
          //         Text(
          //           'Crypto',
          //           style: Theme.of(context).textTheme.headline6,
          //         )
          //       ],
          //     ),
          //   ],
          // );
        }

      case GeneralFilter.paymentMode:
        {
          return SingleChildScrollView(
            child: Observer(builder: (_) {
              return Column(
                children: [
                  Row(
                    children: [
                      Radio<PaymentMode?>(
                          key: const ValueKey(0),
                          groupValue: transactionStore.paymentFilter,
                          value: null,
                          onChanged: (PaymentMode? val) {
                            transactionStore.changePaymentFilter(null);
                          }),
                      Text(
                        'All',
                        style: Theme.of(context).textTheme.headline6,
                      )
                    ],
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _paymentModeStore.paymentModeList.length,
                    itemBuilder: (BuildContext context, int index) {
                      List<PaymentMode> _paymentMode =
                          _paymentModeStore.paymentModeList;

                      return Column(
                        children: [
                          Row(
                            children: [
                              Radio<PaymentMode?>(
                                  key: ValueKey(_paymentMode[index].id),
                                  groupValue: transactionStore.paymentFilter,
                                  value: _paymentMode[index],
                                  onChanged: (PaymentMode? val) {
                                    transactionStore.changePaymentFilter(
                                        _paymentMode[index]);
                                  }),
                              Text(
                                _paymentMode[index].title,
                                style: Theme.of(context).textTheme.headline6,
                              )
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ],
              );
            }),
          );
        }
      default:
        {
          return const Center(child: Text('Error'));
        }
    }
  }
}
