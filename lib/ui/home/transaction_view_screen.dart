import 'package:flutter/material.dart';

import 'transaction_view.dart';

class TrasactionViewScreen extends StatelessWidget {
  const TrasactionViewScreen({Key? key}) : super(key: key);
  static const routeName = '/transaction-view-screen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: TransactionsView(),
          ),
        ),
      ),
    );
  }
}
