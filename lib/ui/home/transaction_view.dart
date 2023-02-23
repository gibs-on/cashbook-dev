import 'package:cashbook/constants/function_response.dart';
import 'package:cashbook/models/transaction.dart';
import 'package:cashbook/stores/book_store.dart';
import 'package:cashbook/stores/cash_category_store.dart';
import 'package:cashbook/stores/home_screen_store.dart';
import 'package:cashbook/stores/payment_mode_store.dart';
import 'package:cashbook/stores/transaction_store.dart';
import 'package:cashbook/ui/transaction_details/transaction_details.dart';
import 'package:cashbook/utils/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';

import '../../service_locator.dart';

class TransactionsView extends StatelessWidget {
  TransactionsView({
    Key? key,
    // required this.transactionStore,
  }) : super(key: key);

  final TransactionStore _transactionStore = getIt<TransactionStore>();
  final HomeScreenStore _homeScreenStore = getIt<HomeScreenStore>();
  final BookStore _bookStore = getIt<BookStore>();
  final PaymentModeStore _paymentModeStore = getIt<PaymentModeStore>();
  final CashCategoryStore _cashCategoryStore = getIt<CashCategoryStore>();

  @override
  Widget build(BuildContext context) {
    String? previousDate;
    return Observer(builder: (_) {
      // transactionData = snapshot.data as List<Transaction>;
      List<Transaction> _transactionsList =
          _homeScreenStore.filteredTransactions;

      if (_transactionsList.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/money.png', height: 100),
              const SizedBox(height: 16),
              Text(
                'No Transactions Found for this Book',
                softWrap: true,
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        );
      }

      return Observer(builder: (_) {
        // print(
        //     'Recived ${_transactionsList.length} transactions in transactions view');

        return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _transactionsList.length,
            itemBuilder: (ctx, index) {
              final Transaction _currentTransaction = _transactionsList[index];

              String? currentDate =
                  DateFormat('d MMM y').format(_currentTransaction.date);

              double _balanceStatus = 0;

              if (previousDate != currentDate || index == 0) {
                previousDate = currentDate;
                FunctionResponse _fResponse =
                    _homeScreenStore.findBalanceStatusByDate(currentDate);
                // print('---- ${_fResponse.message}');
                _balanceStatus = _fResponse.data;
              } else {
                currentDate = null;
              }

              return GestureDetector(
                onTap: () => Navigator.of(context)
                    .pushNamed(TransactionDetailsScreen.routeName, arguments: {
                  'transactionStore': _transactionStore,
                  'transaction': _currentTransaction,
                  'isCashIn': _currentTransaction.isCashIn,
                }),
                child: Card(
                    key: ValueKey(_currentTransaction.id),
                    child: Column(
                      children: [
                        if (currentDate != null)
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            color: Theme.of(context).primaryColorLight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  currentDate,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Balance ${_transactionStore.selectedCurrency} ${_balanceStatus.toStringAsFixed(2).priceCommas()}',
                                )
                              ],
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(DateFormat('h:mm a')
                                      .format(_currentTransaction.date)),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: Column(
                                    // crossAxisAlignment:
                                    //     CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        _currentTransaction.remarks
                                            .capitalize(),
                                        // softWrap: true,
                                        // maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      ),
                                      Chip(
                                        backgroundColor: Theme.of(context)
                                            .primaryColor
                                            .withAlpha(10),
                                        label: SizedBox(
                                          width: 50,
                                          child: Text(
                                            _cashCategoryStore
                                                .findCashCategoryById(
                                                    _currentTransaction
                                                        .category,
                                                    _currentTransaction
                                                        .isCashIn)
                                                .title
                                                .capitalize(),
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Colors.purple.shade200,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: Column(
                                    children: [
                                      Observer(builder: (_) {
                                        return Text(
                                          ' ${_transactionStore.selectedCurrency} ${_currentTransaction.amount.toStringAsFixed(2).priceCommas()}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5!
                                              .copyWith(
                                                color:
                                                    _currentTransaction.isCashIn
                                                        ? Colors.green
                                                        : Colors.red,
                                              ),
                                        );
                                      }),
                                      Chip(
                                        backgroundColor: Theme.of(context)
                                            .primaryColor
                                            .withAlpha(10),
                                        label: SizedBox(
                                          width: 50,
                                          child: Text(
                                            _paymentModeStore
                                                .findPaymentModeById(
                                                    _currentTransaction
                                                        .paymentMode)
                                                .title
                                                .capitalize(),
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              color: Colors.brown,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              );
            });
      });
    });
  }
}
