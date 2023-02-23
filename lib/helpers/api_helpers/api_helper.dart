import 'package:cashbook/constants/function_response.dart';
import 'package:cashbook/db/database.dart';
import 'package:cashbook/generated_api_code/api_client.swagger.dart';
import 'package:cashbook/models/api_response/auth_response.dart';
import 'package:cashbook/service_locator.dart';
import 'package:intl/intl.dart';

import '../db_helper.dart';
import '../shared_preferences_helper.dart';
import './auth_api_helper.dart';
import './books_api_helper.dart';
import './cash_category_api_helper.dart';
import './payment_mode_api_helper.dart';
import './transactions_api_helper.dart';
import 'remarks_api_helper.dart';

class ApiHelper {
  final BooksApiHelper _booksApiHelper;
  final TransactionsApiHelper _transactionsApiHelper;
  final CashCategoryApiHelper _cashCategoryApiHelper;
  final PaymentModeApiHelper _paymentModeApiHelper;
  final RemarksApiHelper _remarksApiHelper;
  final AuthApiHelper _authApiHelper;
  final DbHelper _dbHelper;
  ApiHelper(
    this._booksApiHelper,
    this._transactionsApiHelper,
    this._cashCategoryApiHelper,
    this._paymentModeApiHelper,
    this._remarksApiHelper,
    this._authApiHelper,
    this._dbHelper,
  );

  // Download Data
  Future<void> downloadData() async {
    print('getting data from cloud');

    ApiClient _apiClient = await _authApiHelper.getNewToken();

    await _cashCategoryApiHelper.getCashBookCashOutCategories();

    await _cashCategoryApiHelper.getCashBookCashInCategories();

    await _paymentModeApiHelper.getPaymentModes();

    final List<int> _bookIds = await _booksApiHelper.getBooks();
    await _remarksApiHelper.getRemarksApi(_bookIds);

    // await _transactionsApiHelper.getTransactions(_bookIds[0]);

    /* 
    Downloading the data for last sync, and if we got any data, saving it in the 
    shared preferences value. So that the dialog pop-up shows properly.
    */
    try {
      final AuthResponse? _userData = await _authApiHelper.getCurrentUser();

      ApiClient _apiClient = await _authApiHelper.getNewToken();
      final _response =
          await _apiClient.apiCashBookGetLastTimeBackupBusinessidGet(
              businessid: _userData!.businessId);

      if (_response.isSuccessful) {
        print(
            'last time backup get business id - ${_response.body.toString()}');

        if (_response.body != null) {
          if (_response.body != '') {
            String timeInMilliSeconds = _response.body.toString();
            int time = int.parse(timeInMilliSeconds);
            print('time got in milliseconds since epoch: $time');
            DateTime t = DateTime.fromMillisecondsSinceEpoch(time);
            String timeForSavingInSharedPrefs =
                DateFormat('h:mm a d MMM y').format(t);

            getIt<SharedPreferencesHelper>()
                .setLastSync(timeForSavingInSharedPrefs);
          }
        }
      }
    } catch (e) {
      print('Exception while getting last sync data and time');
      rethrow;
    }
  }

//Upload Data
  Future<void> uploadData() async {
    try {
      //get unsynced data. upload it to api. update data to isSynced:true
      print('starting upload');

      //get books
      // for each book, upload its transactions
      List<Book> _books = await _dbHelper.getDbBooks();
      await _remarksApiHelper.uploadUnsyncedRemarks();

      for (Book _book in _books) {
        // print('Uploading transactions for book > ${_book.id} : ${_book.title}');

        await _transactionsApiHelper.uploadUnsyncedBookTransactions(_book.id);
      }
      await _transactionsApiHelper.editMarkedTransactions();
    } catch (e) {
      print('Upload Failed : $e');
    }
  }

  // last sync time and date
  Future<void> uploadLastSyncTimeAndDate() async {
    try {
      print('starting uploading last sync time and date');

      final AuthResponse? _userData = await _authApiHelper.getCurrentUser();

      ApiClient _apiClient = await _authApiHelper.getNewToken();
      final _response = await _apiClient.apiCashBookAddlastbackupdatePost(
        body: LastBackupDTOAdd(
          businessId: _userData!.businessId,
          lastBackupDate: DateTime.now().millisecondsSinceEpoch.toString(),
        ),
      );
      print(
          'uploading time: ${DateTime.now().millisecondsSinceEpoch.toString()}');
      if (_response.isSuccessful) {
        print('last time backup set - ${_response.body.toString()}');
      }
    } catch (e) {
      print('Upload Failed : $e');
    }
  }
}
