import 'dart:io';

import 'package:cashbook/models/transaction.dart';
import 'package:cashbook/service_locator.dart';
import 'package:cashbook/stores/home_screen_store.dart';
import 'package:cashbook/utils/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PDFGenerator {
  final HomeScreenStore _homeScreenStore = getIt<HomeScreenStore>();
  final List<List<String>> _dataList = [];
  List<pw.TableRow> listItems = [];

  Future<void> buildPdf(BuildContext context) async {
    var data = await rootBundle.load("assets/fonts/OpenSans-Regular.ttf");

    var myFont = pw.Font.ttf(data);

    await _formalizeData();

    print('Building pdf');
    _homeScreenStore.changeBuildingPdfStatus(true);

    try {
      final pdf = pw.Document();

      String? previousDate;

      var assetImage = pw.MemoryImage(
        (await rootBundle.load('assets/images/tenziBook_splash_image.png'))
            .buffer
            .asUint8List(),
      );

      pdf.addPage(
        pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            return [
              _contentHeader(assetImage, context),
              _contentTable(),
              // printableList(
              //     context, _transactionsList, previousDate, assetImage)
            ];
          },
        ),
      );

      final output = await getTemporaryDirectory();
      final file =
          File("${output.path}/${DateTime.now().toIso8601String()}.pdf");
      print('output path : ${output.path}');

      await file.writeAsBytes(await pdf.save());
      await Printing.layoutPdf(
          onLayout: (PdfPageFormat format) async => pdf.save());

      print('Print successful');
    } catch (e) {
      print('Error making pdf : $e');
      rethrow;
    }
    _homeScreenStore.changeBuildingPdfStatus(false);
  }

  pw.Widget printableList(pw.Context context,
      List<Transaction> _transactionsList, String? previousDate, var _image) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(12.0),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          // pw.SizedBox(height: 10),
        ],
      ),
    );
  }

  _contentHeader(image, context) {
    return pw
        .Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
      pw.Image(image, width: 150),
      pw.SizedBox(height: 30),
      pw.Text(
          'Book : ${_homeScreenStore.bookStore.selectedBook?.title.capitalize()}',
          style: pw.TextStyle(fontSize: 20.0, fontWeight: pw.FontWeight.bold)),
      pw.SizedBox(height: 10),
      pw.Row(children: [
        pw.Expanded(
          child: pw.Padding(
            padding: const pw.EdgeInsets.all(2.0),
            child: pw.Column(children: [
              pw.FittedBox(
                child: pw.Text('Total Cash In',
                    style: const pw.TextStyle(fontSize: 16.0)),
              ),
              pw.SizedBox(height: 10),
              pw.SizedBox(
                width: 50,
                child: pw.FittedBox(
                  child: pw.Text(
                      _homeScreenStore.totalCashIn
                          .toStringAsFixed(2)
                          .priceCommas(),
                      style: const pw.TextStyle(
                        fontSize: 20.0,
                        color: PdfColors.green700,
                      )),
                ),
              ),
            ]),
          ),
        ),
        pw.Expanded(
          child: pw.Padding(
            padding: const pw.EdgeInsets.all(2.0),
            child: pw.Column(children: [
              pw.FittedBox(
                child: pw.Text('Total Cash Out',
                    style: const pw.TextStyle(fontSize: 16.0)),
              ),
              pw.SizedBox(height: 10),
              pw.SizedBox(
                width: 50,
                child: pw.FittedBox(
                  child: pw.Text(
                      _homeScreenStore.totalCashOut
                          .toStringAsFixed(2)
                          .priceCommas(),
                      style: const pw.TextStyle(
                        fontSize: 20.0,
                        color: PdfColors.red700,
                      )),
                ),
              ),
            ]),
          ),
        ),
        pw.Expanded(
          child: pw.Padding(
            padding: const pw.EdgeInsets.all(2.0),
            child: pw.Column(children: [
              pw.FittedBox(
                child: pw.Text('Final Balance',
                    style: const pw.TextStyle(fontSize: 16.0)),
              ),
              pw.SizedBox(height: 10),
              pw.SizedBox(
                width: 50,
                child: pw.FittedBox(
                  child: pw.Text(
                      _homeScreenStore.balance.toStringAsFixed(2).priceCommas(),
                      style: const pw.TextStyle(
                        fontSize: 20.0,
                      )),
                ),
              ),
            ]),
          ),
        ),
      ]),
      pw.SizedBox(height: 10),
      pw.Text('Duration ${_dataList.last.first} to ${_dataList.first.first}',
          style: const pw.TextStyle(
            fontSize: 12.0,
          )),
      pw.SizedBox(height: 10),
      pw.Text('Total Entries ${_dataList.length}',
          style: const pw.TextStyle(
            fontSize: 12.0,
          )),
      pw.SizedBox(height: 10),
      pw.Table.fromTextArray(
          context: context,
          defaultColumnWidth: const pw.IntrinsicColumnWidth(flex: 150),
          data: <List<String>>[
            <String>[
              'Date',
              'Remark',
              'Category',
              'Mode',
              'Cash in',
              'Cash out',
            ],
          ]),
      pw.SizedBox(height: 12),
    ]);
  }

  _contentTable() {
    return pw.Table(
      defaultColumnWidth: const pw.IntrinsicColumnWidth(flex: 150),
      children: [
        ...listItems
        // listItems[0],
        // listItems[1],
        // listItems[2],
        // listItems[3],
        // listItems[4],
        // listItems[5],
        // listItems[6],
        // listItems[7],
        // listItems[8],
        // listItems[9],
        // listItems[10],
        // listItems[11],
        // listItems[12],
        // listItems[13],
        // listItems[14],
        // listItems[15],
        // listItems[16],
        // listItems[17],
        // listItems[18],
        // listItems[19],
        // listItems[20],
        // listItems[21],
        // listItems[22],
        // listItems[23],
        // listItems[24],
        // listItems[25],
        // listItems[26],
      ],
    );
  }

  _formalizeData() {
    final int _listSize = _homeScreenStore.filteredTransactions.length;
    for (Transaction _transaction in _homeScreenStore.filteredTransactions) {
      List<String> _items = [];
      _items.add(
        DateFormat('d MMM y').format(_transaction.date),
      );
      _items.add(
        _transaction.remarks,
      );
      _items.add(_homeScreenStore
          .findCashCategoryById(_transaction.category, _transaction.isCashIn)
          .title);
      _items.add(
        _homeScreenStore.findPaymentModeById(_transaction.paymentMode).title,
      );
      _items.add(
        _transaction.isCashIn
            ? _transaction.amount.toStringAsFixed(2).priceCommas()
            : '0',
      );
      _items.add(
        !_transaction.isCashIn
            ? _transaction.amount.toStringAsFixed(2).priceCommas()
            : '0',
      );
      _dataList.add(_items);
    }

    for (var i = 0; i < _dataList.length; i++) {
      listItems.add(
        pw.TableRow(
          // verticalAlignment: pw.TableCellVerticalAlignment.middle,
          children: [
            pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.center,
                // mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text(_dataList[i][0],
                      overflow: pw.TextOverflow.clip,
                      style: const pw.TextStyle(fontSize: 8)),
                  pw.SizedBox(
                    height: 10,
                  ),
                  // pw.Divider(thickness: 1)
                ]),
            pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.center,
                // mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text(_dataList[i][1].capitalize(),
                      overflow: pw.TextOverflow.clip,
                      style: const pw.TextStyle(fontSize: 8)),
                  // pw.Divider(thickness: 1)
                  pw.SizedBox(
                    height: 10,
                  ),
                ]),
            pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.center,
                // mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text(_dataList[i][2].capitalize(),
                      overflow: pw.TextOverflow.clip,
                      style: const pw.TextStyle(fontSize: 8)),
                  // pw.Divider(thickness: 1)
                  pw.SizedBox(
                    height: 10,
                  ),
                ]),
            pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.center,
                // mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text(_dataList[i][3].capitalize(),
                      overflow: pw.TextOverflow.clip,
                      style: const pw.TextStyle(fontSize: 8)),
                  // pw.Divider(thickness: 1)
                  pw.SizedBox(
                    height: 10,
                  ),
                ]),
            pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.center,
                // mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text(_dataList[i][4].toString().priceCommas(),
                      overflow: pw.TextOverflow.clip,
                      style: const pw.TextStyle(fontSize: 8)),
                  // pw.Divider(thickness: 1)
                  pw.SizedBox(
                    height: 10,
                  ),
                ]),
            pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.center,
                // mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text(_dataList[i][5].toString().priceCommas(),
                      overflow: pw.TextOverflow.clip,
                      style: const pw.TextStyle(fontSize: 8)),
                  // pw.Divider(thickness: 1)
                  pw.SizedBox(
                    height: 10,
                  ),
                ]),
            // pw.Divider(thickness: 1)
          ],
        ),
      );
    }
  }
}
