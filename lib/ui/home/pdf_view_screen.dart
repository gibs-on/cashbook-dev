import 'package:cashbook/stores/cash_category_store.dart';
import 'package:cashbook/stores/payment_mode_store.dart';
import 'package:cashbook/stores/pdf_screen_store.dart';
import 'package:cashbook/stores/transaction_store.dart';
import 'package:flutter/material.dart';

import 'package:pdf/pdf.dart';

import '../../service_locator.dart';

class PdfViewScreen extends StatelessWidget {
  PdfViewScreen({Key? key}) : super(key: key);
  static const routeName = '/pdf-view-screen';

  final PdfScreenStore _pdfScreenStore = getIt<PdfScreenStore>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: printableScreen(),
        floatingActionButton: FloatingActionButton(
          child: _pdfScreenStore.isBuildingPdf
              ? const CircularProgressIndicator.adaptive()
              : const Icon(Icons.picture_as_pdf_sharp),
          onPressed: _pdfScreenStore.isBuildingPdf
              ? null
              : () async {
                  // await _buildPdf();
                },
        ),
      ),
    );
  }

  Widget printableScreen() => const Center(child: Text('hello'));
}
