import 'package:cashbook/constants/function_response.dart';
import 'package:cashbook/helpers/shared_preferences_helper.dart';
import 'package:cashbook/stores/book_store.dart';
import 'package:cashbook/stores/cash_category_store.dart';
import 'package:cashbook/stores/home_screen_store.dart';
import 'package:cashbook/stores/payment_mode_store.dart';
import 'package:cashbook/stores/reporting_store.dart';
import 'package:cashbook/stores/transaction_store.dart';
import 'package:cashbook/ui/home/book_list_view.dart';
import 'package:cashbook/ui/home/filters_sheet.dart';
import 'package:cashbook/ui/home/reporting_screen.dart';
import 'package:cashbook/ui/home/time_filters.dart';
import 'package:cashbook/ui/home/transaction_view.dart';
import 'package:cashbook/ui/manage_transaction/manage_transaction.dart';
import 'package:cashbook/ui/widgets/pdf_generator.dart';
import 'package:cashbook/utils/connectivity_helper.dart';
import 'package:cashbook/utils/custom_alerts.dart';
import 'package:cashbook/utils/string_extension.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import 'dart:io';

import 'package:cashbook/models/transaction.dart';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../../service_locator.dart';
import '../custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeScreenStore _homeScreenStore = getIt<HomeScreenStore>();

  bool isInTutorialMode =
      false; // tells if the user is currently seeing the tutorial screen

  final GlobalKey _bookKey = GlobalKey();
  final GlobalKey _timeFiltersKey = GlobalKey();
  final GlobalKey _cashInBtnKey = GlobalKey();
  final GlobalKey _cashOutBtnKey = GlobalKey();
  final GlobalKey _pdfKey = GlobalKey();
  final CustomAlerts _customAlerts = getIt<CustomAlerts>();
  final ConnectivityHelper _connectivityHelper = getIt<ConnectivityHelper>();
  final TextEditingController _searchController = TextEditingController();
  late List<ReactionDisposer> _disposers;

  @override
  void initState() {
    _firebaseCloudMessaging();
    _homeScreenStore.downloadAllData(context);
    // transactionStore.getSelectedCurrency();

    _disposers = [
      reaction(
        (_) => _homeScreenStore.needSync,
        (int result) {
          if (!_homeScreenStore.syncPopupIsCurrentlyOpen) {
            _homeScreenStore.syncPopupIsCurrentlyOpen = true;
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  // backgroundColor: Colors.grey.shade800,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                  content: _syncPopup(
                    context,
                  ),
                );
              },
            );
          }
        },
      ),
      reaction(
        (_) => _homeScreenStore.isDownloadingAllData,
        (bool result) {
          if (!result) {
            WidgetsBinding.instance?.addPostFrameCallback((_) async {
              FunctionResponse? isAlreadyShownReponse =
                  await _homeScreenStore.isTutorialShown();
              if (isAlreadyShownReponse?.success ?? false) {
                print('tutorial shown: ${isAlreadyShownReponse!.data}');
              } else {
                print('tutorial not shown');
                if (!isInTutorialMode) {
                  isInTutorialMode = true;
                  // await Future.delayed(const Duration(seconds: 2));
                  showTutorial();
                }
              }
            });
          }
        },
      ),
    ];
    super.initState();
  }

  void _firebaseCloudMessaging() {
    FirebaseMessaging.instance.getToken().then((value) {
      String? token = value;
      print('firebase token got: $token');
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
  }

  Widget _syncPopup(BuildContext context) {
    final ThemeData _theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Backup Reminder',
          style: _theme.textTheme.headline3,
        ),
        const SizedBox(height: 10),
        Observer(builder: (_) {
          return Text('Last Backup : ${_homeScreenStore.lastSync}');
        }),
        const Divider(thickness: 2),
        const Text(
          'Taking regular Backups help keep your valuable data safe in situation of data loss of any kind e.g data corruption, damage to the phone etc.',
          softWrap: true,
        ),
        const SizedBox(height: 10),
        const Text(
          'Its Highly recommended to take the backup now',
          softWrap: true,
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: ElevatedButton(
                style: _theme.elevatedButtonTheme.style?.copyWith(
                  foregroundColor:
                      MaterialStateProperty.all(_theme.colorScheme.primary),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.white.withAlpha(240)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      side: BorderSide(
                          width: 1, color: _theme.colorScheme.primary),
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                  ),
                ),
                onPressed: () async {
                  _homeScreenStore.syncPopupIsCurrentlyOpen = false;
                  Navigator.of(context).pop();
                },
                child: const Text('Sync Later'),
              ),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: ElevatedButton(
                onPressed: () async {
                  await _backupData(context);
                  Navigator.of(context).pop();
                },
                child: const Text('Sync'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    for (final d in _disposers) {
      d();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    return Observer(builder: (_) {
      return SafeArea(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: _homeScreenStore.isDownloadingAllData
              ? Scaffold(
                  body: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _homeScreenStore.needDataDownload
                            ? 'Syncing Data with Cloud'
                            : 'Fetching Books',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const SizedBox(width: 10),
                      const CircularProgressIndicator(),
                    ],
                  )),
                )
              : _homeScreenContents(context, _theme),
        ),
      );
    });
  }

  Scaffold _homeScreenContents(BuildContext context, ThemeData _theme) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => ReportingScreen(),
              ),
            ),
            icon: const Icon(Icons.pie_chart_rounded),
          ),
        ],
      ),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _bookAndTimeFilter(context),
              const SizedBox(height: 10.0),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Observer(
                  builder: (_) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 250,
                              child: FittedBox(
                                child: Text(
                                  'Balance ${_homeScreenStore.selectedCurrency()} ${_homeScreenStore.balance.toStringAsFixed(2).priceCommas()}',
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30.0),
                        cashInOutStatus(context),
                        const SizedBox(height: 5.0),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 30.0),
              const Divider(),
              _searchAndFilter(context),
              const Divider(),
              const SizedBox(height: 20.0),
              TransactionsView(
                  //Transaction ListViewBuilder
                  // transactionStore: transactionStore,
                  ),
              const SizedBox(height: 80.0),
            ],
          ),
        ),
      ),
      floatingActionButton: _homeScreenStore.bookStore.selectedBook == null
          ? null
          : _floatingButtons(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _bookAndTimeFilter(BuildContext context) {
    return Row(
      // mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          key: _bookKey,
          onPressed: () => showModalBottomSheet(
            context: context,
            builder: (context) => BookListView(),
          ),
          child: Row(
            children: [
              const Icon(Icons.auto_stories),
              const SizedBox(width: 8),
              Observer(builder: (_) {
                return _homeScreenStore.bookStore.selectedBook == null
                    ? const SizedBox()
                    : Text(_homeScreenStore.bookStore.selectedBook!.title
                        .capitalize());
              }),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
        timeFilter(context),
      ],
    );
  }

  Widget timeFilter(BuildContext context) {
    return TextButton(
      key: _timeFiltersKey,
      onPressed: () => showModalBottomSheet(
        context: context,
        builder: (ctx) => TimeFilterBottomSheet(),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.access_time_outlined,
          ),
          const SizedBox(width: 8),
          Observer(builder: (_) {
            return Text(
              _homeScreenStore.timeFilterIndicator() ?? 'All Time',
            );
          }),
          const Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }

  Widget cashInOutStatus(BuildContext context) {
    return Observer(builder: (_) {
      // print('abdullah | cashInOutStatus observer called');
      return Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  Icons.arrow_circle_down,
                  size: 40,
                  color: Colors.green,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (ctx) => ReportingScreen()));
                  },
                  child: Column(
                    children: [
                      Observer(builder: (_) {
                        return Text(
                          'Total Cash In',
                          style: Theme.of(context).textTheme.headline5,
                        );
                      }),
                      SizedBox(
                        width: 90,
                        child: FittedBox(
                          child: Text(
                            '${_homeScreenStore.selectedCurrency()} ${_homeScreenStore.totalCashIn.toStringAsFixed(2).priceCommas()}',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  Icons.arrow_circle_up_rounded,
                  color: Colors.red,
                  size: 40,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => const ReportingScreen(
                          openTotalCashOutFirst: true,
                        ),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Text(
                        'Total Cash Out',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      SizedBox(
                        width: 90,
                        child: FittedBox(
                          child: Text(
                            '${_homeScreenStore.selectedCurrency()} ${_homeScreenStore.totalCashOut.toStringAsFixed(2).priceCommas()}',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      );
    });
  }

  Widget _searchAndFilter(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
              controller: _searchController,
              onChanged: (val) {
                _homeScreenStore.changeSearchTerm(val);
                _homeScreenStore.filterTransactions();
              },
              decoration: const InputDecoration(
                label: Text('Search'),
                prefixIcon: Icon(
                  Icons.search,
                ),
                contentPadding: EdgeInsets.all(2),
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
              )),
        ),
        Observer(builder: (_) {
          return IconButton(
            icon: _homeScreenStore.filterIndicator()
                ? const Icon(Icons.filter_alt_outlined)
                : Icon(
                    Icons.filter_alt,
                    color: Colors.orange.shade700,
                  ),
            onPressed: () => showModalBottomSheet(
              context: context,
              builder: (_) => FiltersSheet(),
            ),
          );
        }),
        IconButton(
          key: _pdfKey,
          icon: const Icon(Icons.picture_as_pdf),
          onPressed: () async {
            await PDFGenerator().buildPdf(context);
          },
        ),
      ],
    );
  }

  Widget _floatingButtons(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 15.0),
        Expanded(
          child: ElevatedButton.icon(
            key: _cashInBtnKey,
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                )),
            onPressed: () {
              _homeScreenStore.setTransactionDefaults(
                  true, null, null, null, null, null, null);
              _homeScreenStore.selectedTransactionCategoryType(true);
              Navigator.of(context)
                  .pushNamed(ManageTransaction.routeName, arguments: {
                'transactionStore': getIt<TransactionStore>(),
                'isCashIn': true,
                'id': null,
              });
            },
            icon: const Icon(
              Icons.arrow_circle_down,
              color: Colors.white70,
            ),
            label: const Text(
              'Cash In',
            ),
          ),
        ),
        const SizedBox(width: 15.0),
        Expanded(
          child: ElevatedButton.icon(
            key: _cashOutBtnKey,
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                )),
            onPressed: () {
              _homeScreenStore.setTransactionDefaults(
                  false, null, null, null, null, null, null);
              _homeScreenStore.selectedTransactionCategoryType(false);

              Navigator.of(context)
                  .pushNamed(ManageTransaction.routeName, arguments: {
                'transactionStore': getIt<TransactionStore>(),
                'isCashIn': false,
                'id': null,
              });
            },
            icon: const Icon(
              Icons.arrow_circle_up,
              color: Colors.white70,
            ),
            label: const Text(
              'Cash Out',
            ),
          ),
        ),
        const SizedBox(width: 15.0),
      ],
    );
  }

  void showTutorial() {
    late TutorialCoachMark tutorial;

    List<TargetFocus> listTargetFocus = [
      TargetFocus(keyTarget: _bookKey, color: Colors.black45, contents: [
        TargetContent(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Select Book',
                  style: Theme.of(context).textTheme.headline2?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Text(
                  'You can create and view different books here.',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 16),
                OutlinedButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white30),
                    backgroundColor: MaterialStateProperty.all(Colors.white30),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    tutorial.next();
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
      TargetFocus(keyTarget: _cashInBtnKey, color: Colors.black45, contents: [
        TargetContent(
          align: ContentAlign.top,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Add Income',
                  style: Theme.of(context).textTheme.headline2?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Text(
                  'Create cash-in transactions from here',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 16),
                OutlinedButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white30),
                    backgroundColor: MaterialStateProperty.all(Colors.white30),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    tutorial.next();
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
      TargetFocus(keyTarget: _cashOutBtnKey, color: Colors.black45, contents: [
        TargetContent(
          align: ContentAlign.top,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Add Expenses',
                  style: Theme.of(context).textTheme.headline2?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Text(
                  'Create cash-out transactions from here',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 16),
                OutlinedButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white30),
                    backgroundColor: MaterialStateProperty.all(Colors.white30),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    tutorial.next();
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
      TargetFocus(keyTarget: _timeFiltersKey, color: Colors.black45, contents: [
        TargetContent(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Filters',
                  style: Theme.of(context).textTheme.headline2?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Text(
                  'You can select a time filter to view only transactions that fall in that time.',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 16),
                OutlinedButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white30),
                    backgroundColor: MaterialStateProperty.all(Colors.white30),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    tutorial.next();
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
      TargetFocus(keyTarget: _pdfKey, color: Colors.black45, contents: [
        TargetContent(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Book as PDF',
                  style: Theme.of(context).textTheme.headline2?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Text(
                  'You can generate a PDF document of cash records here.',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 16),
                OutlinedButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white30),
                    backgroundColor: MaterialStateProperty.all(Colors.white30),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    _homeScreenStore.setTutorialShown();
                    tutorial.finish();
                  },
                  child: const Text(
                    'Finish',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    ];

    tutorial = TutorialCoachMark(context,
        targets: listTargetFocus, // List<TargetFocus>
        alignSkip: Alignment.bottomRight,
        textSkip: "SKIP", onFinish: () {
      print("finish");
      _homeScreenStore.setTutorialShown();
    }, onClickTarget: (target) {
      print(target);
    }, onSkip: () {
      print("skip");
      _homeScreenStore.setTutorialShown();
    })
      ..show();

    // tutorial.skip();
    // tutorial.finish();
    // tutorial.next(); // call next target programmatically
    // tutorial.previous(); // call previous target programmatically
  }

  Future<void> _backupData(BuildContext context) async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();
    _customAlerts.showLoaderDialog(context);
    _fResponse = await _connectivityHelper.checkInternetConnection();
    if (_fResponse.success) {
      await _homeScreenStore.uploadAllData();
      _homeScreenStore.clearAllTransactions();
      _homeScreenStore.clearDownloadBookList();
      //set sync date
      await _homeScreenStore.setLastSync();
      await _homeScreenStore.fetchAndSetTranasctions();
      _fResponse.success = true;
      _fResponse.message = 'Data Backup successful';
    }
    //pop loader
    Navigator.of(context).pop();

    _customAlerts.showSnackBar(_fResponse.message, context,
        success: _fResponse.success);
  }
}
