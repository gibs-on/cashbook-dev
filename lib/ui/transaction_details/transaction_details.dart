import 'dart:io';
import 'dart:typed_data';

import 'package:cashbook/constants/function_response.dart';
import 'package:cashbook/models/transaction.dart';
import 'package:cashbook/stores/cash_category_store.dart';
import 'package:cashbook/stores/payment_mode_store.dart';
import 'package:cashbook/stores/transaction_store.dart';
import 'package:cashbook/ui/manage_transaction/image_view_screen.dart';
import 'package:cashbook/ui/manage_transaction/manage_transaction.dart';
import 'package:cashbook/utils/custom_alerts.dart';
import 'package:cashbook/utils/image_helper.dart';
import 'package:cashbook/utils/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:screenshot/screenshot.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';

import '../../service_locator.dart';

final ScreenshotController screenshotController = ScreenshotController();

Future<FunctionResponse> _shareEntry() async {
  print('Share Entry Start');
  FunctionResponse _fResponse = getIt<FunctionResponse>();

  try {
    Uint8List? _imageFile = await screenshotController.capture(
        delay: const Duration(milliseconds: 700));

    if (_imageFile != null) {
      final directory = await getApplicationDocumentsDirectory();
      final _imagePath = await File('${directory.path}/image.png').create();
      await _imagePath.writeAsBytes(_imageFile);

      /// Share Plugin
      await Share.shareFiles([_imagePath.path]);
      _fResponse.message = 'Entry Shared Successfully';
      _fResponse.success = true;
    } else {
      _fResponse.message = 'Could not capture image';
    }
  } catch (e) {
    _fResponse.message = 'Error Sharing Entry : $e';
  }
  print('Share Entry End');
  return _fResponse;
}

class TransactionDetailsScreen extends StatelessWidget {
  //Utilities
  final CustomAlerts _customAlerts = getIt<CustomAlerts>();
  final CustomImageHelper _customImageHelper = getIt<CustomImageHelper>();

  TransactionDetailsScreen({Key? key}) : super(key: key);

  static const routeName = '/transaction-details';

  final PaymentModeStore _paymentModeStore = getIt<PaymentModeStore>();
  final CashCategoryStore _cashCategoryStore = getIt<CashCategoryStore>();
  void printTransactionDetails(Transaction? _transaction) {
    if (_transaction == null) {
      print('Requested transaction is Null');
    } else {
      print('id : ${_transaction.id}');
      print('bookId : ${_transaction.bookId}');
      print('amount : ${_transaction.amount}');
      print('remarks : ${_transaction.remarks}');
      print('caetgory : ${_transaction.category}');
      print('payment mode : ${_transaction.paymentMode}');
      print('date : ${_transaction.date}');
      print('Image Path : ${_transaction.imagePath}');
      print('iscashin : ${_transaction.isCashIn}');
      print('isSynced : ${_transaction.isSynced}');
      print('isEdited : ${_transaction.isEdited}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    final routeData = ModalRoute.of(context)?.settings.arguments as Map;
    final TransactionStore transactionStore = routeData['transactionStore'];
    final Transaction transaction = routeData['transaction'];
    final bool isCashIn = routeData['isCashIn'];

    transactionStore.setImagePath(transaction.imagePath);

    printTransactionDetails(transaction);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Entry Details'),
          actions: [
            IconButton(
                onPressed: () async {
                  FunctionResponse _fResponse = await _customAlerts
                      .confirmDelete(context: context, isBookDelete: false);
                  print(_fResponse.message);
                  if (_fResponse.success) {
                    //Show Loader
                    _customAlerts.showLoaderDialog(context);
                    await transactionStore.deleteTransaction(transaction);

                    //pop loader
                    Navigator.of(context).pop();
                    //pop screen
                    Navigator.of(context).pop();
                  }
                },
                icon: const Icon(
                  Icons.delete,
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Observer(
                    builder: (_) {
                      return Screenshot(
                        controller: screenshotController,
                        child: Container(
                          color: _theme.scaffoldBackgroundColor,
                          child: Column(
                            children: [
                              ListTile(
                                contentPadding: const EdgeInsets.all(0),
                                leading: Icon(
                                  isCashIn
                                      ? Icons.arrow_circle_down_rounded
                                      : Icons.arrow_circle_up_rounded,
                                  size: 40,
                                  color: isCashIn
                                      ? Colors.green.shade700
                                      : Colors.red.shade700,
                                ),
                                title: Text(
                                  isCashIn ? 'Cash In' : 'Cash Out',
                                  style: _theme.textTheme.headline4,
                                ),
                                subtitle: Text(DateFormat('h:mm a d MMM y')
                                    .format(transaction.date)),
                                trailing: SizedBox(
                                  width: 150,
                                  child: FittedBox(
                                    child: Text(
                                        ' ${transactionStore.selectedCurrency} ${transaction.amount.toStringAsFixed(2).priceCommas()}',
                                        style: _theme.textTheme.headline3!
                                            .copyWith(
                                          color: isCashIn
                                              ? Colors.green
                                              : Colors.red,
                                        )),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20.0),
                              Text(
                                transaction.remarks.capitalize(),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.clip,
                                style: _theme.textTheme.headline3,
                              ),
                              const SizedBox(height: 10.0),
                              _showImage(context, transactionStore, _theme,
                                  _customImageHelper),
                              const SizedBox(height: 20.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'Category',
                                        style: _theme.textTheme.headline5,
                                      ),
                                      const SizedBox(height: 5.0),
                                      Chip(
                                        backgroundColor:
                                            _theme.primaryColor.withAlpha(10),
                                        label: SizedBox(
                                          width: 100,
                                          child: Text(
                                            _cashCategoryStore
                                                .findCashCategoryById(
                                                    transaction.category,
                                                    transaction.isCashIn)
                                                .title
                                                .capitalize(),
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                            style: _theme.textTheme.headline5!
                                                .copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.purple.shade400,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Payment Mode',
                                        style: _theme.textTheme.headline5,
                                      ),
                                      const SizedBox(height: 5.0),
                                      Chip(
                                        backgroundColor:
                                            _theme.primaryColor.withAlpha(10),
                                        label: SizedBox(
                                          width: 100,
                                          child: Text(
                                            _paymentModeStore
                                                .findPaymentModeById(
                                                    transaction.paymentMode)
                                                .title
                                                .capitalize(),
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                            style: _theme.textTheme.headline5!
                                                .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    color: _theme
                                                        .colorScheme.primary),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10.0),
                              const Divider(),
                              const SizedBox(height: 10.0),
                              InkWell(
                                splashColor: _theme.primaryColor,
                                onTap: () {
                                  transactionStore.setDefaults(
                                      transaction.isCashIn,
                                      transaction.date,
                                      TimeOfDay.fromDateTime(transaction.date),
                                      transaction.remarks,
                                      _cashCategoryStore.findCashCategoryById(
                                          transaction.category,
                                          transaction.isCashIn),
                                      _paymentModeStore.findPaymentModeById(
                                          transaction.paymentMode),
                                      transaction.imagePath);
                                  _cashCategoryStore
                                      .changeSelectedTransactionCategoryType(
                                          transaction.isCashIn);
                                  Navigator.of(context).pushNamed(
                                      ManageTransaction.routeName,
                                      arguments: {
                                        'transactionStore': transactionStore,
                                        'transaction': transaction,
                                      });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.edit),
                                      const SizedBox(width: 10.0),
                                      Text(
                                        'Edit Entry',
                                        style: _theme.textTheme.headline4!
                                            .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: _theme.primaryColor,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const Expanded(
                child: SizedBox(),
              ),
              InkWell(
                onTap: () async {
                  FunctionResponse _fResponse = await _shareEntry();
                  _customAlerts.showSnackBar(_fResponse.message, context,
                      success: _fResponse.success);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent, width: 1),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Text(
                    'Share Entry',
                    style: _theme.textTheme.headline4!.copyWith(
                        color: Colors.blueAccent, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
        // floatingActionButton: _floatingButton(context, _theme),
      ),
    );
  }
}

Widget _showImage(BuildContext context, TransactionStore transactionStore,
    ThemeData _theme, CustomImageHelper _customImageHelper) {
  // print('------- image observer =  ${transactionStore.imagePath} yes');

  if (!(transactionStore.imagePath == null)) {
    if (transactionStore.imagePath!.isNotEmpty) {
      print('------- starting display ${transactionStore.imagePath} ');

      ImageType _imageIsNetwork =
          _customImageHelper.imageType(transactionStore.imagePath!).data ??
              ImageType.unknown;

      return InkWell(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  ImageViewScreen(imagePath: transactionStore.imagePath!))),
          child: _imageIsNetwork == ImageType.network
              ? Image.network(
                  transactionStore.imagePath!,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                  frameBuilder: (BuildContext context, Widget child, int? frame,
                      bool wasSynchronouslyLoaded) {
                    if (wasSynchronouslyLoaded) {
                      return child;
                    }
                    return AnimatedOpacity(
                      child: child,
                      opacity: frame == null ? 0 : 1,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeOut,
                    );
                  },
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Icon(
                      Icons.error,
                      color: _theme.colorScheme.error,
                    );
                  },
                )
              : Image.file(
                  File(transactionStore.imagePath!),
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                  frameBuilder: (BuildContext context, Widget child, int? frame,
                      bool wasSynchronouslyLoaded) {
                    if (wasSynchronouslyLoaded) {
                      return child;
                    }
                    return AnimatedOpacity(
                      child: child,
                      opacity: frame == null ? 0 : 1,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeOut,
                    );
                  },
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Icon(
                      Icons.error,
                      color: _theme.colorScheme.error,
                    );
                  },
                ));
    }
  }
  return const SizedBox();
}

Widget _floatingButton(BuildContext context, ThemeData _theme) {
  final CustomAlerts _customAlerts = getIt<CustomAlerts>();

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      InkWell(
        onTap: () async {
          FunctionResponse _fResponse = await _shareEntry();
          _customAlerts.showSnackBar(_fResponse.message, context,
              success: _fResponse.success);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Text(
            'Share Entry',
            style: _theme.textTheme.headline4!.copyWith(
              color: Colors.blueAccent,
            ),
          ),
        ),
      ),
    ],
  );
}
