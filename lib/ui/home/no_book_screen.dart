import 'package:cashbook/constants/function_response.dart';
import 'package:cashbook/models/book.dart';
import 'package:cashbook/stores/book_store.dart';
import 'package:cashbook/ui/home/home_screen/home_screen.dart';
import 'package:cashbook/utils/connectivity_helper.dart';
import 'package:cashbook/utils/custom_alerts.dart';
import 'package:cashbook/utils/input_formatters.dart';
import 'package:flutter/material.dart';

import '../../service_locator.dart';

class NoBookScreen extends StatelessWidget {
  NoBookScreen({Key? key}) : super(key: key);
  static const routeName = '/no-book-screen';

  final BookStore _bookStore = getIt<BookStore>();

  final CustomAlerts _customAlerts = getIt<CustomAlerts>();

  final ConnectivityHelper _connectivityHelper = getIt<ConnectivityHelper>();

  final TextEditingController bookController = TextEditingController();

  Future<void> manageBooks(BuildContext context) async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    _fResponse = await _connectivityHelper.checkInternetConnection();
    if (_fResponse.success) {
      await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Add New Book'),
                    const SizedBox(height: 10),
                    TextField(
                      controller: bookController,
                      inputFormatters: [
                        UpperCaseTextFormatter(),
                      ],
                      decoration: const InputDecoration(
                        hintText: 'Book Name ',
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 8.0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                        onPressed: () async {
                          if (bookController.text.isEmpty) {
                            return;
                          }

                          print('before rename call to store');
                          // Show Loader
                          _customAlerts.showLoaderDialog(context);
                          _fResponse =
                              await _bookStore.addNewBook(bookController.text);
                          // POP Loader
                          Navigator.of(context).pop();
                          // Pop Editor
                          Navigator.of(context).pop();
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              HomeScreen.routeName,
                              (Route<dynamic> route) => false);
                        },
                        child: const Text('Save'))
                  ],
                ),
              ));
    }

    print(_fResponse.message);
    _customAlerts.showSnackBar(_fResponse.message, context,
        success: _fResponse.success);
    bookController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: _screenHeight,
          width: _screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        'No Book Found. To add transactions create a new Book.',
                        style: _theme.textTheme.headline3,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    ElevatedButton.icon(
                      onPressed: () async {
                        await manageBooks(context);
                      },
                      icon: const Icon(Icons.add),
                      label: const Text('Add New Book'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
