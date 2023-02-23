import 'package:cashbook/constants/function_response.dart';
import 'package:cashbook/models/book.dart';
import 'package:cashbook/stores/book_store.dart';
import 'package:cashbook/ui/home/no_book_screen.dart';
import 'package:cashbook/utils/connectivity_helper.dart';
import 'package:cashbook/utils/custom_alerts.dart';
import 'package:cashbook/utils/input_formatters.dart';
import 'package:cashbook/utils/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../service_locator.dart';

class BookListView extends StatefulWidget {
//Stores

  BookListView({Key? key}) : super(key: key);

  @override
  State<BookListView> createState() => _BookListViewState();
}

class _BookListViewState extends State<BookListView> {
  final BookStore _bookStore = getIt<BookStore>();

  final CustomAlerts _customAlerts = getIt<CustomAlerts>();

  final ConnectivityHelper _connectivityHelper = getIt<ConnectivityHelper>();

  final TextEditingController bookController = TextEditingController();

  Future<void> manageBooks(BuildContext context, Book? previousBook) async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();
    print('called manage books');

    _fResponse = await _connectivityHelper.checkInternetConnection();
    if (_fResponse.success) {
      await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(previousBook == null ? 'Add New Book' : 'Edit Name'),
                    const SizedBox(height: 10),
                    TextField(
                      inputFormatters: [
                        UpperCaseTextFormatter(),
                      ],
                      controller: bookController
                        ..text = previousBook?.title ?? '',
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
                          previousBook == null
                              ? _fResponse = await _bookStore
                                  .addNewBook(bookController.text)
                              : _fResponse = await _bookStore.editBookTitle(
                                  bookController.text, previousBook);
                          // POP Loader
                          Navigator.of(context).pop();
                          // Pop Editor
                          Navigator.of(context).pop();
                        },
                        child: const Text('Save'))
                  ],
                ),
              ));
    }
    //pop bottom sheet
    Navigator.of(context).pop();
    bookController.text = '';
    print(_fResponse.message);
    _customAlerts.showSnackBar(_fResponse.message, context,
        success: _fResponse.success);
  }

  Future<void> _deleteBook(int id) async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();
    try {
      _fResponse = await _connectivityHelper.checkInternetConnection();

      if (_fResponse.success) {
        _fResponse = await _customAlerts.confirmDelete(
            context: context, isBookDelete: true);
        print(_fResponse.message);
        if (_fResponse.success) {
          // Show Loader
          _customAlerts.showLoaderDialog(context);

          _fResponse = await _bookStore.deleteBook(id);
        }
      }
    } catch (e) {
      _fResponse.success = false;
      _fResponse.message = 'Error deleting Book : $e';
    }
    //pop loader
    Navigator.of(context).pop();
    print(_fResponse.message);
    _customAlerts.showSnackBar(_fResponse.message, context,
        success: _fResponse.success);
    if (_fResponse.data == 'NoBook') {
      print('-------- yay DeletBook: No book found moving to nobookscreen');
      Navigator.of(context).pushNamedAndRemoveUntil(
          NoBookScreen.routeName, (Route<dynamic> route) => false);
    }
  }

  @override
  void initState() {
    super.initState();
    _bookStore.changeIsLoading(true);
    _bookStore.fetchAndSetBooks(context);
  }

  @override
  Widget build(BuildContext context) {
    const double height = 400.0;
    return SizedBox(
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Observer(builder: (_) {
              return Container(
                // height: height * 0.85,
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                child: _bookStore.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: _bookStore.bookList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () async {
                                  //Show Loader
                                  _customAlerts.showLoaderDialog(context);
                                  await _bookStore
                                      .changeBook(_bookStore.bookList[index]);
                                  //Pop Loader
                                  Navigator.of(context).pop();
                                  //pop bottom sheet
                                  Navigator.of(context).pop();
                                },
                                child: ListTile(
                                  leading: const Icon(Icons.auto_stories),
                                  title: Text(_bookStore.bookList[index].title
                                      .capitalize()),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    // mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      if (_bookStore.selectedBook?.id ==
                                          _bookStore.bookList[index].id)
                                        Icon(
                                          Icons.check_circle,
                                          color: Colors.blue.shade800,
                                        ),
                                      DropdownButtonHideUnderline(
                                        child: ButtonTheme(
                                          alignedDropdown: true,
                                          child: DropdownButton(
                                            icon: Icon(
                                              Icons.more_vert,
                                              color: Theme.of(context)
                                                  .primaryIconTheme
                                                  .color,
                                            ),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                            items: [
                                              DropdownMenuItem(
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.edit,
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                    ),
                                                    const SizedBox(width: 5.0),
                                                    const Text('Rename'),
                                                  ],
                                                ),
                                                value: 'rename',
                                              ),
                                              DropdownMenuItem(
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.delete,
                                                      color: Theme.of(context)
                                                          .errorColor,
                                                    ),
                                                    const SizedBox(width: 8.0),
                                                    const Text('Delete'),
                                                  ],
                                                ),
                                                value: 'delete',
                                              ),
                                            ],
                                            onChanged: (itemIdentifier) async {
                                              if (itemIdentifier == 'rename') {
                                                print('rename called');
                                                manageBooks(context,
                                                    _bookStore.bookList[index]);
                                              }
                                              if (itemIdentifier == 'delete') {
                                                await _deleteBook(_bookStore
                                                    .bookList[index].id);
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Divider(),
                            ],
                          );
                        }),
              );
            }),
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () async {
                    await manageBooks(context, null);
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Create New Book'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
